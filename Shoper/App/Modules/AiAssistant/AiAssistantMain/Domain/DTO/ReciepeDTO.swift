//
//  ReciepeDTO.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation

struct ReciepeDTO: Codable {
  
  let dish, recipeText: String?
  let ingredients: [String]?
  let recommendations: [ProductDTO]?
  
}
