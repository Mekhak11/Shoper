//
//  CategorizedProductsListViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import Foundation

protocol CategorizedProductsListViewModeling: ObservableObject {
 
  var products: ProductsMetaModel { get set }
  var isLoading: Bool { get set }
  
  func getProducts(for categoryId: Int)
  
}
