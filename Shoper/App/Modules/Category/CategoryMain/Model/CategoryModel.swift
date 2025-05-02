//
//  CategoryModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

struct CategoryModel: Codable {
  
  let id: Int
  let categoryName, image: String
  
  init(id: Int, categoryName: String, image: String) {
    self.id = id
    self.categoryName = categoryName
    self.image = image
  }
  
  init(dto: CategoryDto) {
    self.id = dto.id ?? 0
    self.categoryName = dto.name ?? ""
    self.image = dto.imageURL ?? ""
  }
  
}

struct Categories: Codable {
  
  let categories: [CategoryModel]
  
  init(categories: [CategoryModel]) {
    self.categories = categories
  }
  
  init(dto: CategoriesDTO) {
    self.categories = dto.categories.map({CategoryModel(dto: $0)})
  }
  
}
