//
//  ProductDetailView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//


import SwiftUI

struct ProductDetailView: View {
  
  let product: ProductModel
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 16) {
        productImage
        productTitle
        productDescription
        priceList
        addbuton
      }
      .padding()
    }
    .background(Color(.systemGroupedBackground))
    .navigationTitle("Product Details")
    .navigationBarTitleDisplayMode(.inline)
  }
}

extension ProductDetailView {
    
    private var productImage: some View {
      NukeImageView(url: URL(string: product.imageURL))
        .frame(height: 300)
        .scaledToFit()
        .shadow(color: .gray.opacity(0.4), radius: 8, x: 0, y: 4)
    }
    
    private var productTitle: some View {
        Text(product.productName)
            .font(.title2.bold())
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .blue.opacity(0.1), radius: 6, x: 0, y: 4)
    }
    
    private var productDescription: some View {
        Text(product.description)
            .font(.body)
            .foregroundColor(.gray)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .blue.opacity(0.1), radius: 6, x: 0, y: 4)
    }
    
    private var priceList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Available Prices:")
                .font(.headline)
                .padding(.bottom, 4)

            ForEach(product.prices, id: \.marketId) { market in
                HStack {
                  SupermarketLogoView(marketId: market.marketId)
                    Spacer()
                  Text(String(format: "%.2f", market.price))
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .blue.opacity(0.15), radius: 8, x: 0, y: 4)
    }
  
    private var addbuton: some View {
      Button {
        CartManager.shared.addToCart(productId: "\(product.id)")
      } label: {
        Text("Add To Cart")
          .foregroundStyle(Color.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(12)
          .shadow(color: .blue.opacity(0.15), radius: 6, x: 0, y: 3)
      }
    }
  
//  private var quantitySelector: some View {
//    HStack {
//        Text("Quantity:")
//            .font(.headline)
//        Spacer()
//        Stepper(value: .constant(product.count), in: 1...100) {
//            Text("\(product.count)")
//        }
//        .labelsHidden()
//    }
//    .padding()
//    .background(Color.white)
//    .cornerRadius(12)
//    .shadow(color: .blue.opacity(0.15), radius: 6, x: 0, y: 3)
//  }
  
}

