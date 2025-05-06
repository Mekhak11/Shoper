//
//  CartViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

protocol CartViewModeling: ObservableObject, Identifiable {
  
  var isLoading: Bool { get set }
  var products: [ProductModel] { get set }
  
  func fetchCartProducts()
}
