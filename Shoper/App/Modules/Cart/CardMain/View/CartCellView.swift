//
//  CartCellView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI
import Nuke
import NukeUI

struct CartCellView: View {
  
  @Binding var selectionMode: SelectionType
  @Binding var product: ProductModel
  var action: () -> ()

  var body: some View {
    HStack(spacing: 8) {
      
      NukeImageView(url: URL(string: product.imageURL))
      
      VStack(alignment: .leading) {
        Text(product.productName)
          .font(.caption2)
          .foregroundColor(.black)
          .lineLimit(4)
        
        ForEach(product.prices.prefix(3), id: \.marketId) { market in
          HStack(spacing: 10) {
            SupermarketLogoView(marketId: market.marketId)
            
            Text("\(String(format: "%.f", market.price)) \u{058F}")
              .font(.subheadline)
              .foregroundColor(market.price == findSelectedPrice() ? Color.green : Color.black.opacity(0.8))
          }
        }
        Spacer()
      }
      Spacer()
      
      VStack {
        StepperButtonView(count: $product.count) {
          CartManager.shared.updateQuantity(productId: "\(product.id)", quantity: product.count)
        } decrementAction: {
          CartManager.shared.updateQuantity(productId: "\(product.id)", quantity: product.count)
        } deleteAction: {
          CartManager.shared.removeFromCart(productId: "\(product.id)")
          action()
        }

        Button {
          CartManager.shared.removeFromCart(productId: "\(product.id)")
          action()
        } label: {
          Image(systemName: "trash.fill")
            .resizable()
            .foregroundStyle(Color.red)
            .frame(width: 20, height: 20)
        }      }
      
    }
    .padding()
    .background(Color.white)
    .cornerRadius(18)
    .shadow(color: Color.gray.opacity(0.15), radius: 6, x: 0, y: 4)
    .padding(.horizontal)
    .frame(height: 200)
  }
}

extension CartCellView {
  private func findSelectedPrice() -> Double {
    switch selectionMode {
    case .lowest:
      var lowest = product.prices.first?.price ?? 0
      for model in product.prices {
        if model.price < lowest {
          lowest = model.price
        }
      }
      return lowest
    case .supermarket(let id):
      return product.prices.first(where: {$0.marketId == id})?.price ?? 0.0
    }
  }
}

#Preview {
  CartCellView(selectionMode: .constant(.lowest), product:
      .constant(ProductModel(
        id: 7,
        productName: "Eggplant caviar \"Artfood\" 360g",
        imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
        description: "",
        subcategoryId: 1,
        prices: [
          PriceModel(marketId: 0, price: 1650.00),
          PriceModel(marketId: 1, price: 1250.00),
          PriceModel(marketId: 2, price: 1450.00),
        ], count: 1
  ))) {
    
  }
}

enum SelectionType: Equatable {
  case lowest
  case supermarket(Int)
}
