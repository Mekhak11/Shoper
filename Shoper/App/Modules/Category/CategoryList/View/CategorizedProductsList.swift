//
//  CategoryListView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import SwiftUI

struct CategorizedProductsList<M: CategorizedProductsListViewModeling>: View {
  
  @StateObject var viewModel: M = CategorizedProductsListViewModel(
    getProductsUseCase: GetProductsByCategoryUseCase(categoryRepository: CategoryDefaultRepository()),
    searchCategoryProductsUseCase: SearchProductsUseCase(categoryRepository: CategoryDefaultRepository())
  ) as! M
  
  let categoryId: Int
  
  @State private var searchText: String = ""
  
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    VStack(spacing: 0) {
      searchField
      list
    }
  }
}

extension CategorizedProductsList {
  private var searchField: some View {
    TextField("Search in this category...", text: $searchText)
      .padding(12)
      .background(Color.white)
      .cornerRadius(12)
      .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
      .padding(.horizontal)
      .padding(.bottom, 2)
      .onChange(of: searchText) { _, newValue in
        viewModel.searchedProducts = []
        viewModel.resetSearchPageNumber()
        if !newValue.isEmpty {
          viewModel.searchProducts(for: newValue, by: categoryId)
        }
      }
  }
  
  private var list: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 16) {
        if !searchText.isEmpty {
          searchedProducts
        } else {
          allProducts
        }
      }
      .padding()
    }
    .onLoad {
      viewModel.getProducts(for: categoryId)
    }
  }
  
  private var searchedProducts: some View {
    ForEach(viewModel.searchedProducts.indices, id: \.self) { index in
      let product = viewModel.searchedProducts[index]
      NavigationLink(
        destination: ProductDetailView(product: product),
        label: {
          ProductCellView(product: product)
            .onAppear {
              if index == viewModel.searchedProducts.count - 1 {
                viewModel.searchProducts(for: searchText, by: categoryId)
              }
            }
        }
      )
    }
  }
  
  private var allProducts: some View {
    ForEach(viewModel.products.productMetas.indices, id: \.self) { index in
      let product = viewModel.products.productMetas[index]
      NavigationLink(
        destination: ProductDetailView(product: product),
        label: {
          ProductCellView(product: product)
            .onAppear {
              if index == viewModel.products.productMetas.count - 1 {
                viewModel.getProducts(for: categoryId)
              }
            }
        }
      )
    }
  }
  
}
