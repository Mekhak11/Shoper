//
//  CartViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

final class CartViewModel: CartViewModeling {
  @Published var products: [ProductModel] = [ProductModel(
    id: 1,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ]
  ),ProductModel(
    id: 2,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1350.00),
      PriceModel(marketId: 1, price: 1650.00),
      PriceModel(marketId: 2, price: 1750.00),
    ]
  ),ProductModel(
    id: 3,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1100.00),
      PriceModel(marketId: 1, price: 1050.00),
      PriceModel(marketId: 2, price: 1000.00),
    ]
  ),ProductModel(
    id: 4,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ]
  ),ProductModel(
    id: 5,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ]
  ),ProductModel(
    id: 6,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ]
  ),ProductModel(
    id: 7,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ]
  )]
  
  
}
