//
//  HomeView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct HomeView<M: HomeViewModeling>: View {

  @StateObject var viewModel:M = HomeViewModel() as! M
  
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
              ForEach(viewModel.categoryProduct.indices, id: \.self) { index in
                    let section = viewModel.categoryProduct[index]

                    VStack(alignment: .leading, spacing: 16) {
                        // Category Header
                        HStack {
                            Text(section.category.categoryName)
                                .font(.title2.bold())
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                // Action for See All
                            }) {
                                Text("See All")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(section.products, id: \.id) { product in
                                    ProductCellView(product: product)
                                        .frame(width: 220)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                }
            }
//            .padding(.vertical)
        }
        .background(Color.blue.opacity(0.04).ignoresSafeArea())
    }
}

#Preview {
  HomeView<HomeViewModel>()
}
