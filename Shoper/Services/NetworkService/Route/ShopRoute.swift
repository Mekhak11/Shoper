//
//  ShopRoute.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//

import Foundation

enum ShopRoute: TargetType {
  
  case find(payload: String)
  
  var baseURL: URL {
    switch self {
    case .find:
      return URL(string: "https://shoper-api.herokuapp.com")!
    }
  }
  
  var path: String {
    switch self {
    case .find:
      return "/api/v1/shops"
    }
  }
  
  var method: String {
    switch self {
    case .find:
      return "GET"
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .find:
      return nil
    }
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .find(payload: let payload):
      return ["q": payload]
    }
  }
  
}
