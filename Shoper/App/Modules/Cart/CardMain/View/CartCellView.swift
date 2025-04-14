//
//  CartCellView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct CartCellView: View {
  
  @Binding var selectionMode: SelectionType
  @Binding var product: ProductModel
  var action: () -> ()

  var body: some View {
    HStack(spacing: 8) {
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
          .frame(maxHeight: 180)
          .frame(maxWidth: 100)
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
        
        // Product Info
      VStack(alignment: .leading) {
        Text(product.productName)
          .font(.caption2)
          .foregroundColor(.black)
          .lineLimit(4)
        
      ForEach(product.prices.prefix(3), id: \.marketId) { market in
          HStack(spacing: 10) {
            SupermarketLogoView(marketId: market.marketId)
            
            Text("\(String(format: "%.f", market.price)) AMD")
              .font(.subheadline)
              .foregroundColor(market.price == findSelectedPrice() ? Color.green : Color.black.opacity(0.8))
          }
        }
      }
      Spacer()
      
      VStack {
        StepperButtonView(count: $product.count)
        Button {
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
//
//#Preview {
//  CartCellView(selectionMode: .constant(.lowest), product: .conProductModel(
//    id: 7,
//    productName: "Eggplant caviar \"Artfood\" 360g",
//    imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1053273.png/250/250/false",
//    description: "",
//    subcategoryId: 1,
//    prices: [
//      PriceModel(marketId: 0, price: 1650.00),
//      PriceModel(marketId: 1, price: 1250.00),
//      PriceModel(marketId: 2, price: 1450.00),
//    ]
//  ))
//}

enum SelectionType: Equatable {
  case lowest
  case supermarket(Int)
}
