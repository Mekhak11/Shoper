//
//  HomeView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct HomeView<M: HomeViewModeling>: View {
  
  @StateObject var viewModel:M = HomeViewModel(homeMainUseCase: HomeMainUseCase(homeRepository: HomeDefaultRepository())) as! M
  
  var body: some View {
    content
      .background(Color.blue.opacity(0.04).ignoresSafeArea())
      .onLoad {
        viewModel.getCategoryProduct()
      }
      .refreshable {
        viewModel.getCategoryProduct()
      }
  }
}


extension HomeView {
  
  private var content: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 30) {
        if viewModel.isLoading {
          LottieView(animationFileName: "home", loopMode: .playOnce)
            .scaleEffect(0.5)
        } else {
          categoryProducts
        }
      }
    }
  }
  
  private var categoryProducts: some View {
    VStack {
      slider
    ForEach(viewModel.realCategoryProduct.categories.indices, id: \.self) { index in
      let section = viewModel.realCategoryProduct.categories[index]
      if section.products.count > 0 {
        VStack(alignment: .leading, spacing: 10) {
          HStack {
            Text(section.category.categoryName)
              .font(.title2.bold())
              .foregroundColor(.black)
            Spacer()
            NavigationLink(
              destination:
                CategorizedProductsList<CategorizedProductsListViewModel>(categoryId: section.category.id) ,
              label: {
                Text("See All")
                  .font(.subheadline)
                  .foregroundColor(.blue)
              }
            )
          }
          .padding(.horizontal)
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
              ForEach(section.products, id: \.id) { product in
                NavigationLink(
                  destination:
                    ProductDetailView(product: product) ,
                  label: {
                    ProductCellView(product: product)
                    
                  }
                )
                .frame(width: 220)
              }
            }
            .padding(.horizontal)
            .padding(.bottom)
          }
        }
      }
    }
  }
  }
  
  private var slider: some View {
    AutoSlidingImageSliderView(images: ["shop1","shop3","shop2"])
  }
}

#Preview {
  HomeView<HomeViewModel>()
}
