//
//  CategoryRepository.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation
import Combine

protocol CategoryRepository {
  
  func getAllCategories() -> AnyPublisher<CategoriesDTO, NetworkError>
  func getProductMetasBy(_ id : Int, page: Int) -> AnyPublisher<ProductMetasDTO, NetworkError>
  func search(by name: String, in categoryId: Int?, page: Int ) -> AnyPublisher<ProductMetasDTO, NetworkError>
  
}

final class CategoryDefaultRepository: NetworkManager, CategoryRepository {
  
  func getProductMetasBy(_ id: Int, page: Int) -> AnyPublisher<ProductMetasDTO, NetworkError> {
    request(CategoryRoute.productMeta(id: id, page: page), type: ProductMetasDTO.self)
  }

  func getAllCategories() -> AnyPublisher<CategoriesDTO, NetworkError> {
    request(CategoryRoute.categories, type: CategoriesDTO.self)
  }
  
  func search(by name: String, in categoryId: Int?, page: Int) -> AnyPublisher<ProductMetasDTO, NetworkError> {
    request(CategoryRoute.search(name: name, categoryID: categoryId, page: page) , type: ProductMetasDTO.self)
  }
  
  
}
