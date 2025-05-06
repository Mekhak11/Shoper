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
  @Published var isLoading: Bool = false
  
  private var getCategoryUseCase: CategoryMainUseCase
  private var cancellable = Set<AnyCancellable>()
  
  init(getCategoryUseCase: CategoryMainUseCase) {
    self.getCategoryUseCase = getCategoryUseCase
  }
  
  func getCategories() {
    isLoading = true
    getCategoryUseCase.execute()
      .sink { [weak self] result in
        switch result {
        case .finished:
          self?.isLoading = false
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  categories in
        self?.categoriesReal = categories
      }.store(in: &cancellable)
  }
  
}
