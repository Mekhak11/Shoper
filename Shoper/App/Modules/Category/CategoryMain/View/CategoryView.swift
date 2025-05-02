//
//  CategoryView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct CategoryView<M: CategoryViewModeling>: View {
  
  @StateObject var viewModel:M = CategoryViewModel(getCategoryUseCase: CategoryMainUseCase(categoryRepository: CategoryDefaultRepository())) as! M
  
  private let columns = [
    GridItem(.flexible(), spacing: 16),
    GridItem(.flexible(), spacing: 16)
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 16) {
        ForEach(viewModel.categoriesReal.categories, id: \.id) { category in
          NavigationLink(
              destination: CategorizedProductsList<CategorizedProductsListViewModel>(categoryId: category.id),
              label: {
                  CategoryCellView(category: category)
              }
          )
        }
      }
      .padding(.horizontal)
      .padding(.top)
    }
    .background(Color.blue.opacity(0.04).ignoresSafeArea())
    .onLoad {
      viewModel.getCategories()
    }
  }
    
  
}
