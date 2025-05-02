//
//  CartBaseUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//

import Foundation

class CartBaseUseCase {
  
  let cartRepository: CartRepository
  
  init(cartRepository: CartRepository) {
    self.cartRepository = cartRepository
  }
  
}
