//
//  ProductMetaCell.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/23/25.
//

import SwiftUI

struct ProductMetaCell: View {
  
  let product: ProductModel
  
    var body: some View {
      VStack(alignment: .leading, spacing: 10) {
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

      }
      .padding()
      .background(Color.white)
      .cornerRadius(20)
      .shadow(color: Color.blue.opacity(0.3), radius: 12, x: 2, y: 8)
    }
}
