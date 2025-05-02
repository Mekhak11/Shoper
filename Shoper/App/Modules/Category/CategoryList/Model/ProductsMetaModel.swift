//
//  ProductsMetaModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import Foundation
import SwiftUI

struct ProductsMetaModel {
  
  var productMetas: [ProductModel]
  
  init(productMetas: [ProductModel]) {
    self.productMetas = productMetas
  }
  
  init(dto: ProductMetasDTO) {
    self.productMetas = dto.productMetas.map { ProductModel(metaDTO: $0)}
  }
  
}

//struct ProductMetaModel {
//  
//  let productName, imageURL, description: String
//  let categoryID: Int
//  let prices: [PriceModel]
//  
//  init(productName: String, imageURL: String, description: String, categoryID: Int, prices: [PriceModel]) {
//    self.productName = productName
//    self.imageURL = imageURL
//    self.description = description
//    self.categoryID = categoryID
//    self.prices = prices
//  }
//  
//  init(dto: ProductMetaDTO) {
//    self.categoryID = dto.id ?? 0
//    self.productName = dto.name ?? ""
//    self.imageURL = dto.imageUrl ?? ""
//    self.description = dto.description ?? ""
//    self.prices = dto.prices?.map{PriceModel(dto: $0)} ?? []
//  }
//  
//}
