//
//  CategoryCellView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct CategoryCellView: View {
  
  let category: CategoryModel
  
  var body: some View {
    ZStack(alignment: .center) {
      NukeImageView(url: URL(string: category.image))
      .cornerRadius(20)
      .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 6)
      
      Text(category.categoryName)
        .font(.title3.bold())
        .foregroundColor(.white)
        .padding()
        .background(
          LinearGradient(
            colors: [Color.black.opacity(0.6), Color.clear],
            startPoint: .bottom,
            endPoint: .top
          )
          .cornerRadius(12)
        )
        .padding()
    }
    .frame(height: 160)
    .clipShape(RoundedRectangle(cornerRadius: 20))
  }
  
}

#Preview {
  CategoryCellView(category:   CategoryModel(
    id: 0,
    categoryName: "Canned Food",
    image: "https://simplyhomecooked.com/wp-content/uploads/2015/04/Eggplant-spread-ikra-7.jpg"
  ))
}
