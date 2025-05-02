//
//  ProductMetaDTO.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import Foundation

struct ProductMetasDTO: Codable {
  let productMetas: [ProductMetaDTO]
}

// MARK: - ProductMeta
struct ProductMetaDTO: Codable {
  let id: Int
  let name, imageUrl, description: String?
  let categoryId: Int?
  let prices: [PriceDTO]?
  
}
