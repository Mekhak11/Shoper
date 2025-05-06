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
        NukeImageView(url: URL(string: product.imageURL))
          .frame(height: 150)
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
