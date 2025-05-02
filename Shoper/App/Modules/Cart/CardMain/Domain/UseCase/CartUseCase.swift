//
//  CartUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//

import Foundation
import Combine

final class CartUseCase: CartBaseUseCase {
  
  func execute(id: Int) -> AnyPublisher<ProductModel, NetworkError> {
    cartRepository.getProduct(by: id)
      .map {
        ProductModel(metaDTO: $0)
      }
      .eraseToAnyPublisher()
  }
}
