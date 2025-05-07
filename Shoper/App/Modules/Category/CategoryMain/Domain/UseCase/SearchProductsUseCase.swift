//
//  SearchProductsUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation
import Combine

final class SearchProductsUseCase: CategoryUseCase {
  
  func execute(name: String, categoryId: Int?, page: Int) -> AnyPublisher<[ProductModel], NetworkError> {
    categoryRepository.search(by: name, in: categoryId, page: page)
      .map {
        $0.productMetas.map({ProductModel(metaDTO: $0)})
      }
      .eraseToAnyPublisher()
  }
  
}
