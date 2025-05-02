//
//  AIAssistantView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI


import SwiftUI

struct AIAssistantView: View {
  @State private var messages: [ChatMessage] = []
  @State private var newMessage: String = ""
  
  var body: some View {
    VStack {
      ScrollViewReader { proxy in
        ScrollView {
          VStack(spacing: 16) {
            ForEach(messages) { message in
              HStack {
                if message.isFromUser {
                  Spacer()
                  ChatBubble(message: message)
                } else {
                  ChatBubble(message: message)
                  Spacer()
                }
              }
              .padding(.horizontal)
              .id(message.id)
            }
          }
          .padding(.vertical)
        }
        .onChange(of: messages.count) { _ in
          if let lastMessage = messages.last {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
          }
        }
      }
      
      Divider()
      
      HStack {
        TextField("Type your message...", text: $newMessage)
          .padding(12)
          .background(Color.gray.opacity(0.1))
          .cornerRadius(12)
        
        Button(action: sendMessage) {
          Image(systemName: "paperplane.fill")
            .foregroundColor(.white)
            .padding(12)
            .background(Color.blue)
            .cornerRadius(12)
        }
        .disabled(newMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
      }
      .padding()
      .navigationTitle("Chat with AI 👨‍🍳")
    }
  }
  
  private func sendMessage() {
    let userText = newMessage.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !userText.isEmpty else { return }
    
    messages.append(ChatMessage(id: UUID(), text: userText, products: [], isFromUser: true))
    newMessage = ""
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      let aiResponse = ChatMessage(
        id: UUID(),
        text: """
👨‍🍳 Here's a recipe suggestion! /n
  - 1/2 cup of pizza sauce Hot ketchup "Слобода"
  - 1 cup of shredded mozzarella cheese Buried cheese with
  - Toppings of your choice (e.g., pepperoni Oily fish smoked "Sas Product", mushrooms, bell peppers, onions)
- **Step-by-step Instructions**:
  1. In a large mixing bowl, combine the flour, sugar, salt, and yeast.
  2. Gradually add the warm water and mix until a dough forms.
  3. Add the olive oil and continue kneading the dough for about 5 minutes until it becomes smooth and elastic.
  4. Place the dough in a greased bowl, cover it with a damp cloth, and let it rise in a warm place for about 1 hour, or until it has doubled in size.
  5. Preheat the oven to 425°F (220°C).
  6. Punch down the dough and roll it out into a circle or rectangle shape, depending on your preference.
  7. Transfer the dough to a greased pizza pan or baking sheet.
  8. Spread the pizza sauce over the dough, leaving a small border around the edges.
  9. Sprinkle the shredded mozzarella cheese over the sauce.
  10. Add your desired toppings.
  11. Bake the pizza in the preheated oven for about 15-20 minutes, or until the crust is golden brown and the cheese is melted and bubbly.
- **Preparation Time**: 30 minutes
- **Cooking Time**: 15-20 minutes
- **Serving Size**: 4-6 slices
""",
        products: sampleProducts.shuffled(),
        isFromUser: false
      )
      messages.append(aiResponse)
    }
  }
}

struct ChatBubble: View {
  let message: ChatMessage
  
  var body: some View {
    VStack(alignment: message.isFromUser ? .trailing : .leading, spacing: 12) {
      Text(message.text)
        .font(.body)
        .padding()
        .background(message.isFromUser ? Color.blue : Color.gray.opacity(0.2))
        .foregroundColor(message.isFromUser ? .white : .black)
        .cornerRadius(16)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isFromUser ? .trailing : .leading)
      
      if !message.products.isEmpty {
        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 2), spacing: 12) {
          ForEach(Array(message.products.enumerated()), id: \.offset) { index, product in
            ProductMetaCell(product: product)
          }
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isFromUser ? .trailing : .leading)
      }
    }
  }
}

struct ChatMessage: Identifiable {
  let id: UUID
  let text: String
  let products: [ProductModel]
  let isFromUser: Bool
}


let sampleProducts: [ProductModel] = [
  .init(id: 0, productName: "Flour \"Baghramyan\" 2kg", imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1041585.png/250/250/false", description: "", subcategoryId: 1,prices: []),
  .init(id: 1,productName: "Sugar 1kg", imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1040538.png/250/250/false", description: "", subcategoryId: 2, prices: []),
  .init(id: 2, productName: "Sea salt \"Marbelle\" small 750g", imageURL: "https://media.yerevan-city.am/api/Image/Resize/ProductPhoto/1039273.png/250/250/false", description: "", subcategoryId: 3,prices: []),
  .init(id: 3, productName: "Cheese Feta \"Hotos\"", imageURL: "https://www.sas.am/upload/Sh/imageCache/115/738/7383622390538428.webp", description: "", subcategoryId: 4,prices: [])
]
