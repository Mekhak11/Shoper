//
//  ProductModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

struct ProductModel: Codable {
  
  let id: Int
  let productName, imageURL, description: String
  let subcategoryId: Int
  let prices: [PriceModel]
  var count: Int = 1
  
  init(id: Int, productName: String, imageURL: String, description: String, subcategoryId: Int, prices: [PriceModel], count: Int = 1) {
    self.id = id
    self.productName = productName
    self.imageURL = imageURL
    self.description = description
    self.subcategoryId = subcategoryId
    self.prices = prices
    self.count = count
  }
  
  init(dto: ProductDTO) {
    self.id = dto.id ?? 0
    self.productName = dto.name ?? ""
    self.imageURL = dto.imageURL ?? ""
    self.description = dto.description ?? ""
    self.subcategoryId = dto.categoryID ?? 0
    self.count = 1
    self.prices = dto.prices?.map({PriceModel(dto: $0)}) ?? []
  }
  
  init(metaDTO: ProductMetaDTO) {
    self.id = metaDTO.id
    self.productName = metaDTO.name ?? ""
    self.imageURL = metaDTO.imageUrl ?? ""
    self.description = metaDTO.description ?? ""
    self.subcategoryId = metaDTO.categoryId ?? 0
    self.count = 1
    self.prices = metaDTO.prices?.map({PriceModel(dto: $0)}) ?? []
  }
  
}

struct PriceModel: Codable {
  
  let marketId: Int
  let price: Double
  
  init(marketId: Int, price: Double) {
    self.marketId = marketId
    self.price = price
  }
  
  init(dto: PriceDTO) {
    self.price = Double(dto.price ?? 0)
    self.marketId = dto.supermarketID ?? 0
  }
  
}
