//
//  CategoryListView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import SwiftUI

struct CategorizedProductsList<M: CategorizedProductsListViewModeling>: View {
  
  @StateObject var viewModel:M = CategorizedProductsListViewModel(getProductsUseCase: GetProductsByCategoryUseCase(categoryRepository: CategoryDefaultRepository())) as! M
  
  let categoryId: Int
  
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 16) {
        ForEach(viewModel.products.productMetas.indices, id: \.self) { index in
          let product = viewModel.products.productMetas[index]
          NavigationLink(
            destination: ProductDetailView(product: product),
              label: {
                ProductMetaCell(product: product)
                  .onAppear {
                    if index == viewModel.products.productMetas.count - 1 {
                      viewModel.getProducts(for: categoryId)
                    }
                  }
              }
          )

        }
      }
      .padding()
    }
    .onLoad {
      viewModel.getProducts(for: categoryId)
    }
  }
}

//#Preview {
//    CategorizedProductsList()
//}
