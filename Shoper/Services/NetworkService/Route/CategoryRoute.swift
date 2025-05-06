//
//  CategoryRoute.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/22/25.
//

import Foundation

enum CategoryRoute: TargetType {
  
  case categories
  case productMeta(id: Int, page: Int)

  var baseURL: URL {
    return URL(string: "https://heroic-musical-feline.ngrok-free.app")!
  }
  
  var path: String {
    switch self {
    case .categories:
      return "/api/CategoryMeta"
    case .productMeta(let id, _):
      return "/api/ProductMeta/category/\(id)"
    }
  }
  
  var method: String {
    switch self {
    case .categories:
      return "GET"
    case .productMeta:
      return "GET"
    }
 
  }
  
  var headers: [String : String]? {
    return ["accept": "text/plain'"]
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .categories:
      return nil
    case .productMeta(_, let page):
      return [
        "pageNumber": page,
        "pageSize": 10
      ]
    }
  }
  
}
