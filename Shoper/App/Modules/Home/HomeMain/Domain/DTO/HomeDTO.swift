//
//  HomeDTO.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation

struct HomeDTO: Codable {
  let categories: [CategoryProductDto]?
}

// MARK: - CategoryElement
struct CategoryProductDto: Codable {
  let category: CategoryDto
  let products: [ProductDTO]
}

// MARK: - CategoryCategory
struct CategoryDto: Codable {
  let id: Int?
  let name, imageURL: String?
}

// MARK: - Product
struct ProductDTO: Codable {
  let id: Int?
  let name, imageURL, description: String?
  let categoryID: Int?
  let prices: [PriceDTO]?
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case imageURL = "imageUrl"
    case description
    case categoryID = "categoryId"
    case prices
  }
}

// MARK: - Price
struct PriceDTO: Codable {
  let supermarketID, price: Int?
  
  enum CodingKeys: String, CodingKey {
    case supermarketID = "supermarketId"
    case price
  }
  
}
