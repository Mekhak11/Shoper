//
//  AIAssistantViewModeling.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation

protocol AIAssistantViewModeling: ObservableObject, Identifiable {
  
  var isLoading: Bool { get set }
  var messages: [ChatMessage]  { get set }
  
  func sendMessage(message: String)
  
}
