//
//  CartViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation
import Combine

final class CartViewModel: CartViewModeling {
  
  @Published var products: [ProductModel] = []
  @Published var isLoading: Bool = false
  
  private var cancelables = Set<AnyCancellable>()
  private var cartUseCase: CartUseCase
  
  init(cartUseCase: CartUseCase) {
    self.cartUseCase = cartUseCase
  }
  
  func fetchCartProducts() {
    isLoading = true
    let cartItems = CartManager.shared.getAllItems() // [String: Int]
    let productIds = cartItems.keys.compactMap { Int($0) }
    
    var fetchedProducts: [ProductModel] = []
    let group = DispatchGroup()
    
    for id in productIds {
      group.enter()
      cartUseCase.execute(id: id)
        .sink(
          receiveCompletion: { completion in
            
        }, receiveValue: { product in
          var updatedProduct = product
          updatedProduct.count = cartItems["\(id)"] ?? 1
          fetchedProducts.append(updatedProduct)
          group.leave()
        })
        .store(in: &cancelables)
    }
    
    group.notify(queue: .main) {
      self.products = fetchedProducts
      self.isLoading = false
    }
  }
  
}
