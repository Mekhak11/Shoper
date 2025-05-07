//
//  HomeViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation
import Combine

final class HomeViewModel: HomeViewModeling, Identifiable {
  
  @Published var realCategoryProduct: HomeModelReal = HomeModelReal(categories: [])
  @Published var isLoading: Bool = false
  @Published var error: NetworkError? = nil
  
  private var homeMainUseCase: HomeMainUseCase
  private var cancellable = Set<AnyCancellable>()
  
  init(homeMainUseCase: HomeMainUseCase) {
    self.homeMainUseCase = homeMainUseCase
  }
  
  func getCategoryProduct() {
    isLoading = true
    homeMainUseCase.execute()
      .sink { [weak self] result in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          self?.isLoading = false
        }
        switch result {
        case .finished:
          print("Finished")
        case .failure(let error):
          print(error)
          self?.error = error
        }
      } receiveValue: { [weak self]  products in
        self?.realCategoryProduct = products
      }
      .store(in: &cancellable)
  }
  
  
  
}
