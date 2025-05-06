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
  
  
  @Published  var categries: [CategoryModel] = [
    CategoryModel(
      id: 0,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 1,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 2,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 3,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 4,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 5,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 6,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 7,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
        CategoryModel(
      id: 8,
      categoryName: "Canned Food",
      image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
    ),
    
  ]
  
  private var getCategoryUseCase: CategoryMainUseCase
  private var cancellable = Set<AnyCancellable>()

  init(getCategoryUseCase: CategoryMainUseCase) {
    self.getCategoryUseCase = getCategoryUseCase
  }
  
  func getCategories() {
    getCategoryUseCase.execute()
      .sink { [weak self] result in
        switch result {
        case .finished:
            print("Finished")
        case .failure(let error):
            print(error)
        }
      } receiveValue: { [weak self]  categories in
        self?.categoriesReal = categories
    }.store(in: &cancellable)
  }
  
  
}
