//
//  GetProductsByCategoryUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import Foundation
import Combine

final class GetProductsByCategoryUseCase: CategoryUseCase {
  
  func execute(id: Int, page: Int) -> AnyPublisher<ProductsMetaModel, NetworkError> {
    categoryRepository.getProductMetasBy(id, page: page)
      .map{
        ProductsMetaModel(dto: $0)
      }
      .eraseToAnyPublisher()
  }
  
}
