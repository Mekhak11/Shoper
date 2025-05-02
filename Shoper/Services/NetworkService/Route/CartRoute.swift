//
//  CartRoute.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//

import Foundation

enum CartRoute: TargetType {
  
  case product(id: Int)
  
  var baseURL: URL {
    return URL(string: "http://localhost:8080")!
  }
  
  var path: String {
    switch self {
    case .product(let id):
      return "/api/ProductMeta/\(id)"
    }
  }
  
  var method: String {
    switch self {
    case .product:
      return "GET"
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .product:
      return [
        "accept": "text/plain"
      ]
    }
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .product:
      return nil
    }
    
  }
  
}

