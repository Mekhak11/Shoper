//
//  RecipeView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import SwiftUI

struct RecipeView: View {
  
  let ingredients: [String]
  let instructions: [String]
  let message: ChatMessage
  
  init(textInput: String, message: ChatMessage) {
    let parsed = textInput.parseRecipe()
    self.ingredients = parsed.ingredients
    self.instructions = parsed.instructions
    self.message = message
  }
  
  var body: some View {
    if ingredients.count > 0 || instructions.count > 0 {
      filledView
    } else {
      ChatBubble(message: message)
    }
  }
  
}

extension RecipeView {
  
  private var filledView: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        Text("Recipe")
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.bottom, 10)
        
        SectionView(title: "Ingredients", items: ingredients,isOrdered: true)
        SectionView(title: "Instructions", items: instructions, isOrdered: true)
        
        if !message.products.isEmpty {
          LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 2), spacing: 12) {
            ForEach(Array(message.products.enumerated()), id: \.offset) { index, product in
              
              NavigationLink(
                destination: ProductDetailView(product: product),
                label: {
                  ProductMetaCell(product: product)
                }
              )
            }
          }
          .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isFromUser ? .trailing : .leading)
        }
      }
      .padding()
    }
  }
  
}

struct SectionView: View {
  let title: String
  let items: [String]
  let isOrdered: Bool
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(title)
        .font(.title2)
        .fontWeight(.semibold)
      
      ForEach(Array(items.enumerated()), id: \.offset) { index, item in
        HStack(alignment: .top) {
          Text(isOrdered ? "\(index + 1)." : "•")
            .fontWeight(.bold)
          Text(item)
            .foregroundColor(.secondary)
        }
      }
    }
    .padding()
    .background(Color(.systemGray6))
    .cornerRadius(12)
    .shadow(radius: 1)
  }
}
