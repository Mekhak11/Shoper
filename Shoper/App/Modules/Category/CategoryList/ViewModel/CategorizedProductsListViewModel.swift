//
//  CategorizedProductsListViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import Foundation
import Combine

final class CategorizedProductsListViewModel: CategorizedProductsListViewModeling {
  
  @Published var products: ProductsMetaModel = ProductsMetaModel(productMetas: [])
  @Published var isLoading: Bool = false
  
  
  private var getProductsUseCase: GetProductsByCategoryUseCase
  private var cancellable = Set<AnyCancellable>()
  private var pageNumber = 0
  
  init(getProductsUseCase: GetProductsByCategoryUseCase) {
    self.getProductsUseCase = getProductsUseCase
  }
  
  func getProducts(for categoryId: Int) {
    guard !isLoading else { return }
    isLoading = true
    pageNumber += 1
    getProductsUseCase.execute(id: categoryId, page: pageNumber)
      .sink { [weak self] result in
        switch result {
        case .finished:
          self?.isLoading = false
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  products in
        self?.products.productMetas += products.productMetas
      }
      .store(in: &cancellable)
  }
  
  
}
