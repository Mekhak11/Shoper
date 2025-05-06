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
  
  func getCategories()
  
}
