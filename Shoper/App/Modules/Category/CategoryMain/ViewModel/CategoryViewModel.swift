//
//  CategoryViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation
import Combine

final class CategoryViewModel: CategoryViewModeling {
  
  @Published var categoriesReal: Categories = Categories(categories: [])
  @Published var searchedProducts: [ProductModel] = []
  @Published var isLoading: Bool = false
  
  private var getCategoryUseCase: CategoryMainUseCase
  private var searchUseCase: SearchProductsUseCase
  private var cancellable = Set<AnyCancellable>()
  private var pageNumber = 0
  
  init(getCategoryUseCase: CategoryMainUseCase, searchUseCase: SearchProductsUseCase) {
    self.getCategoryUseCase = getCategoryUseCase
    self.searchUseCase = searchUseCase
  }
  
  func getCategories() {
    isLoading = true
    getCategoryUseCase.execute()
      .sink { [weak self] result in
        switch result {
        case .finished:
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self?.isLoading = false
          }
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  categories in
        self?.categoriesReal = categories
      }.store(in: &cancellable)
  }
  
  func searchProducts(query: String) {
    guard !isLoading else { return }
    pageNumber += 1
    searchUseCase.execute(name: query, categoryId: nil, page: pageNumber)
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
  
  func resetPageNumber() {
    self.pageNumber = 0
  }
  
}
