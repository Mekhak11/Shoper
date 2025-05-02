//
//  HomeModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

struct HomeModelReal: Codable {
  
  let categories: [HomeModel]
  
  init(categories: [HomeModel]) {
    self.categories = categories
  }
  
  init(dto: HomeDTO) {
    self.categories = dto.categories?.map({HomeModel(dto: $0)}) ?? []
  }
  
}

struct HomeModel: Codable {
  
  let category: CategoryModel
  let products: [ProductModel]
  
  init(category: CategoryModel, products: [ProductModel]) {
    self.category = category
    self.products = products
  }
  
  init(dto: CategoryProductDto) {
    self.category = CategoryModel(dto: dto.category)
    self.products = dto.products.map({ProductModel(dto: $0)})
  }
  
}
