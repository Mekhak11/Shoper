//
//  CartViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

protocol CartViewModeling: ObservableObject, Identifiable {
  var products: [ProductModel] { get set }
  func fetchCartProducts()
}
