//
//  CartRepository.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//

import Foundation
import Combine

protocol CartRepository {
  
  func getProduct(by id: Int) -> AnyPublisher<ProductMetaDTO,NetworkError>

}

final class CartDfefaultRepository: NetworkManager, CartRepository {
  
  func getProduct(by id: Int) -> AnyPublisher<ProductMetaDTO, NetworkError> {
    request(CartRoute.product(id: id), type: ProductMetaDTO.self)
  }
    
}
