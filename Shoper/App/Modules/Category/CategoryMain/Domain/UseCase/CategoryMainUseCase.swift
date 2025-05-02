//
//  CategoryMainUseCase.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation
import Combine

final class CategoryMainUseCase: CategoryUseCase {
  func execute() -> AnyPublisher<Categories, NetworkError> {
    categoryRepository.getAllCategories()
      .map {
        Categories(dto: $0)
      }
      .eraseToAnyPublisher()
  }
}
