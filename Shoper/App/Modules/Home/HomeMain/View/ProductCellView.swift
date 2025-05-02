//
//  ProductCellView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct ProductCellView: View {
    let product: ProductModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Product Image
            AsyncImage(url: URL(string: product.imageURL)) { phase in
                if let image = phase.image {
                  ZStack {
                    Color.gray.opacity(0.2)
                    image
                      .resizable()
                      .frame(maxHeight: 180)
                      .scaledToFit()
                    
                      .clipped()
                      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 6)
                  }
                  .frame(height: 180)
                  .cornerRadius(16)
                  
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.1))
                        .frame(height: 180)
                        .overlay(
                          Image(systemName: "exclamationmark.circle")
                        )
                        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 4)
                }
            }

            Text(product.productName)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(2)

//          HStack {
            VStack {
              ForEach(product.prices.prefix(3), id: \.marketId) { market in
                HStack(spacing: 10) {
                  SupermarketLogoView(marketId: market.marketId)
                  //                    Spacer()
                  Text("\(String(format: "%.f", market.price)) AMD")
                    .font(.subheadline)
                    .foregroundColor(Color.black.opacity(0.8))
                }
              }
            }
            Spacer()
//            
//          }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.blue.opacity(0.3), radius: 12, x: 2, y: 8)
        .overlay(alignment: .bottomTrailing) {
          Button(action: {
            CartManager.shared.addToCart(productId: "\(product.id)")
          }) {
              Image(systemName: "cart.badge.plus")
                  .foregroundColor(.white)
                  .padding()
                  .background(Color.blue)
                  .clipShape(Circle())
                  .shadow(radius: 4)
                  .frame(maxWidth: 20)
                  .frame(maxHeight: 20)
          }

        }
        .padding(16)

    }
}
#Preview {
  ProductCellView(product: ProductModel(
    id: 6,
    productName: "Eggplant caviar \"Artfood\" 360g",
    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
    description: "",
    subcategoryId: 1,
    prices: [
      PriceModel(marketId: 0, price: 1650.00),
      PriceModel(marketId: 1, price: 1250.00),
      PriceModel(marketId: 2, price: 1450.00),
    ], count: 1
  ))
}
