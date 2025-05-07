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
  var searchedProducts: [ProductModel] { get set }
  
  func searchProducts(for query: String, by categoryId: Int)
  func getProducts(for categoryId: Int)
  func resetSearchPageNumber()
  
}
