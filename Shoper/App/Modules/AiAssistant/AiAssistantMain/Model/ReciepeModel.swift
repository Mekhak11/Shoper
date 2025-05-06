//
//  ReciepeModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation

struct ReciepeModel {
  
  let dish, recipeText: String
  let ingredients: [String]
  let products: [ProductModel]
  
  init(dish: String, recipeText: String, ingredients: [String], recommendations: [ProductModel]) {
    self.dish = dish
    self.recipeText = recipeText
    self.ingredients = ingredients
    self.products = recommendations
  }
  
  init(dto: ReciepeDTO) {
    self.dish = dto.dish ?? ""
    self.recipeText = dto.recipeText ?? ""
    self.ingredients = dto.ingredients ?? []
    self.products = dto.recommendations?.map({ProductModel(dto: $0)}) ?? []
  }
  
}

struct ChatMessage: Identifiable {
  
  let id: UUID
  let text: String
  let products: [ProductModel]
  let ingredients: [String]
  let isFromUser: Bool
  
  init(id: UUID, text: String, products: [ProductModel], isFromUser: Bool, ingredients: [String] = []) {
    self.id = id
    self.text = text
    self.products = products
    self.isFromUser = isFromUser
    self.ingredients = ingredients
  }
  
  init(userMessage: String) {
    self.id = UUID()
    self.text = userMessage
    self.products = []
    self.ingredients = []
    self.isFromUser = true
  }
  
  init(reciepe: ReciepeModel) {
    self.id = UUID()
    self.isFromUser = false
    self.text = reciepe.recipeText
    self.products = reciepe.products
    self.ingredients = reciepe.ingredients
  }
  
  
}
