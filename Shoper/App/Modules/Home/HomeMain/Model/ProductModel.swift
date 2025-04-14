//
//  ProductModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

struct ProductModel {
  
  let id: Int
  let productName, imageURL, description: String
  let subcategoryId: Int
  let prices: [PriceModel]
  var count: Int = 1
  
}

struct PriceModel {
  
  let marketId: Int
  let price: Double
  
}
