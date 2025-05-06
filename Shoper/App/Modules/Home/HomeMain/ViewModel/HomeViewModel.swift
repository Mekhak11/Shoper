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
  
  private var homeMainUseCase: HomeMainUseCase
  private var cancellable = Set<AnyCancellable>()
  
  init(homeMainUseCase: HomeMainUseCase) {
    self.homeMainUseCase = homeMainUseCase
  }
  
  func getCategoryProduct() {
    homeMainUseCase.execute()
          .sink { [weak self] result in
            switch result {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { [weak self]  products in
          self?.realCategoryProduct = products
        }.store(in: &cancellable)
  }
  
  
  
}
