//
//  AIAssistantRoute.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import Foundation

enum AIAssistantRoute: TargetType {
  
  case reciepe(prompt: String)
  
  var baseURL: URL {
    return URL(string: "https://heroic-musical-feline.ngrok-free.app")!
  }
  
  var path: String {
    switch self {
    case  .reciepe:
      return "/api/Recipe/recommend"
    }
  }
  
  var method: String {
    switch self {
    case .reciepe:
      return "GET"
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .reciepe:
      return [
        "accept": "*/*"
      ]
    }
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .reciepe(let prompt):
      return [
        "dish" : prompt
      ]
    }
    
  }
  
}
