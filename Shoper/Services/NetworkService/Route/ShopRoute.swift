//
//  ShopRoute.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//

import Foundation

enum HomeRout: TargetType {
  
  case find(payload: String)
  case home
  
  var baseURL: URL {
    return URL(string: "https://heroic-musical-feline.ngrok-free.app")!
  }
  
  var path: String {
    switch self {
    case .find:
      return "/api/v1/shops"
    case .home:
      return "/api/Home"
    }
  }
  
  var method: String {
    switch self {
    case .find:
      return "GET"
    case .home:
      return "GET"
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .find:
      return nil
    case .home:
      return [
        "accept": "text/plain"
      ]
    }
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .find(payload: let payload):
      return ["q": payload]
    case .home:
      return nil
    }
    
  }
  
}
