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
  @Published var searchedProducts: [ProductModel] = []
  
  
  private var getProductsUseCase: GetProductsByCategoryUseCase
  private var searchCategoryProductsUseCase: SearchProductsUseCase
  private var cancellable = Set<AnyCancellable>()
  private var pageNumber = 0
  private var searchpageNumber = 0
  
  init(getProductsUseCase: GetProductsByCategoryUseCase, searchCategoryProductsUseCase: SearchProductsUseCase) {
    self.getProductsUseCase = getProductsUseCase
    self.searchCategoryProductsUseCase = searchCategoryProductsUseCase
  }
  
  func getProducts(for categoryId: Int) {
    guard !isLoading else { return }
    isLoading = true
    pageNumber += 1
    getProductsUseCase.execute(id: categoryId, page: pageNumber)
      .sink { [weak self] result in
        switch result {
        case .finished:
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self?.isLoading = false
          }
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  products in
        self?.products.productMetas += products.productMetas
      }
      .store(in: &cancellable)
  }
  
  func searchProducts(for query: String, by categoryId: Int) {
    searchpageNumber += 1
    searchCategoryProductsUseCase.execute(name: query, categoryId: categoryId, page: searchpageNumber)
      .sink {  result in
        switch result {
        case .finished:
          print("Finished")
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  products in
        self?.searchedProducts += products
      }
      .store(in: &cancellable)
  }
  
  func resetSearchPageNumber() {
    self.searchpageNumber = 0
  }
  
  
}
