//
//  AIAssistantView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI
import Lottie

struct AIAssistantView<M: AIAssistantViewModeling>: View {
  
  @ObservedObject var viewModel: M = AIAssistantViewModel(reciepeUseCase: GetReciepeUseCase(aiRepository: AIDefaultRepository())) as! M
  @State private var newMessage: String = ""
  
  var body: some View {
    VStack {
      ScrollViewReader { proxy in
        ScrollView {
          VStack(spacing: 16) {
            ForEach(viewModel.messages) { message in
              HStack {
                if message.isFromUser {
                  Spacer()
                  ChatBubble(message: message)
                } else {
                  RecipeView(textInput: message.text, message: message)
                  Spacer()
                }
              }
              .padding(.horizontal)
              .id(message.id)
            }
            if viewModel.isLoading {
              HStack {
                LottieView(animationFileName: "cooking", loopMode: .loop)
                  .scaleEffect(0.06)
                  .frame(width: 60, height: 60)
                  .clipped()
                  .scaledToFill()
                LottieView(animationFileName: "cooking", loopMode: .loop)
                  .scaleEffect(0.06)
                  .frame(width: 60, height: 60)
                  .clipped()
                  .scaledToFill()
                LottieView(animationFileName: "cooking", loopMode: .loop)
                  .scaleEffect(0.06)
                  .frame(width: 60, height: 60)
                  .clipped()
                  .scaledToFill()
                Spacer()
              }
            }
          }
          .padding(.vertical)
        }
        .onChange(of: viewModel.messages.count) {
          if let lastMessage = viewModel.messages.last {
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
        
        Button {
          viewModel.sendMessage(message: newMessage)
          newMessage = ""
        } label: {
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
      
//      if !message.products.isEmpty {
//        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 12), count: 2), spacing: 12) {
//          ForEach(Array(message.products.enumerated()), id: \.offset) { index, product in
//            
//            NavigationLink(
//              destination: ProductDetailView(product: product),
//              label: {
//                ProductMetaCell(product: product)
//              }
//            )
//          }
//        }
//        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isFromUser ? .trailing : .leading)
//      }
    }
  }
}
