//
//  AIAssistantViewModel.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation
import Combine
import SwiftUI

final class AIAssistantViewModel: AIAssistantViewModeling {
  
  @Published var isLoading: Bool = false
  @Published var messages: [ChatMessage] = []
  
  private var reciepeUseCase: GetReciepeUseCase
  private var cancelables = Set<AnyCancellable>()
  
  init(reciepeUseCase: GetReciepeUseCase) {
    self.reciepeUseCase = reciepeUseCase
  }
  
  func sendMessage(message: String) {
    let userText = message.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !userText.isEmpty else { return }
    self.messages.append(ChatMessage(id: UUID(), text: userText, products: [], isFromUser: true))
    getReciepe(prompt: message)
  }
  
  private func getReciepe(prompt: String) {
    self.isLoading = true
    reciepeUseCase.execute(by: prompt)
      .sink { [weak self] result in
        switch result {
        case .finished:
          self?.isLoading = false
        case .failure(let error):
          print(error)
        }
      } receiveValue: { [weak self]  reciepe in
        let chatMessage = ChatMessage(reciepe: reciepe)
          self?.messages.append(chatMessage)
        print(reciepe.recipeText)
      }.store(in: &cancelables)
  }
  
}
