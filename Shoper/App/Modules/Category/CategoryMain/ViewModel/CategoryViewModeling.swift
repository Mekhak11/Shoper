//
//  CategoryViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

protocol CategoryViewModeling: ObservableObject, Identifiable {
  
  var isLoading: Bool { get set }
  var categoriesReal: Categories { get set }
  var searchedProducts: [ProductModel] { get set }
  
  func getCategories()
  func resetPageNumber()
  func searchProducts(query: String)
  
}
