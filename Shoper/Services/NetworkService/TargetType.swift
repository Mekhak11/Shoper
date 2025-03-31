//
//  TargetType.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//


import Foundation

protocol TargetType {
  
  var baseURL: URL { get }
  var path: String { get }
  var method: String { get }
  var headers: [String: String]? { get }
  var parameters: [String: Any]? { get }
  
}
