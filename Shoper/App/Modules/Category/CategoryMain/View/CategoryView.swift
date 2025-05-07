//
//  CategoryView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//
//
//import SwiftUI
//
//struct ads<M: CategoryViewModeling>: View {
//  
//  @StateObject var viewModel:M = CategoryViewModel(getCategoryUseCase: CategoryMainUseCase(categoryRepository: CategoryDefaultRepository()), searchUseCase: SearchProductsUseCase(categoryRepository: CategoryDefaultRepository())) as! M
//  
//  private let columns = [
//    GridItem(.flexible(), spacing: 16),
//    GridItem(.flexible(), spacing: 16)
//  ]
//  
//  var body: some View {
//    ZStack {
//      if viewModel.isLoading {
//        LottieView(animationFileName: "cooking", loopMode: .playOnce)
//          .scaleEffect(0.4)
//      } else {
//        ScrollView {
//          LazyVGrid(columns: columns, spacing: 16) {
//            ForEach(viewModel.categoriesReal.categories, id: \.id) { category in
//              NavigationLink(
//                destination: CategorizedProductsList<CategorizedProductsListViewModel>(categoryId: category.id),
//                label: {
//                  CategoryCellView(category: category)
//                }
//              )
//            }
//          }
//          .padding(.horizontal)
//          .padding(.top)
//        }
//      }
//    }
//    .background(Color.blue.opacity(0.04).ignoresSafeArea())
//    
//    .onLoad {
//      viewModel.getCategories()
//    }
//  }
//  
//}

import SwiftUI
import Combine

struct CategoryView<M: CategoryViewModeling>: View {
  
  @StateObject var viewModel: M = CategoryViewModel(
    getCategoryUseCase: CategoryMainUseCase(categoryRepository: CategoryDefaultRepository()),
    searchUseCase: SearchProductsUseCase(categoryRepository: CategoryDefaultRepository())
  ) as! M
  
  @State private var searchText: String = ""
  
  private let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    VStack(spacing: 0) {
      searchField
      list
    }
  }
}

extension CategoryView {
  
  private var list: some View {
    ScrollView {
      if viewModel.isLoading {
        LottieView(animationFileName: "cooking", loopMode: .playOnce)
          .scaleEffect(0.4)
      } else {
        LazyVGrid(columns: columns, spacing: 16) {
          if !searchText.isEmpty {
            searchedProductList
          } else {
            categoryList
          }
        }
        .padding(.horizontal)
        .padding(.top)
      }
    }
//    .background(Color.blue.opacity(0.04).ignoresSafeArea())
    .onLoad {
      viewModel.getCategories()
    }
  }
  
  
  private var searchField: some View {
    TextField("Search products...", text: $searchText)
      .padding(12)
      .background(Color.white)
      .cornerRadius(12)
      .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
      .padding(.horizontal)
      .padding(.bottom, 2)
      .onChange(of: searchText) { _, newValue in
        viewModel.searchedProducts = []
        viewModel.resetPageNumber()
        if !newValue.isEmpty {
//          viewModel.getCategories()
//        } else {
          viewModel.searchProducts(query: newValue)
        }
      }
  }
  
  private var searchedProductList: some View {
    ForEach(viewModel.searchedProducts.indices, id: \.self) { index in
      let product = viewModel.searchedProducts[index]
      NavigationLink(
        destination: ProductDetailView(product: product),
        label: {
          ProductMetaCell(product: product)
            .onAppear {
              if index == viewModel.searchedProducts.count - 1 {
                viewModel.searchProducts(query: searchText)
              }
            }
        }
      )
    }
  }
  
  private var categoryList: some View {
    ForEach(viewModel.categoriesReal.categories, id: \.id) { category in
      NavigationLink(
        destination: CategorizedProductsList<CategorizedProductsListViewModel>(categoryId: category.id),
        label: {
          CategoryCellView(category: category)
        }
      )
    }
  }
  
}

