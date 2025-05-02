//
//  HomeViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import Foundation

protocol HomeViewModeling: ObservableObject {
  
//  var categoryProduct: [HomeModel] { get set }
  var realCategoryProduct: HomeModelReal { get set }
  
  func getCategoryProduct()
  
}
