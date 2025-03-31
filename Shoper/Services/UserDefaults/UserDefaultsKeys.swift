//
//  UserDefaultsKeys.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//

import Foundation

extension UserDefaults {
  
  struct Key: RawRepresentable {
    var rawValue: String
  }
  
}

extension UserDefaults.Key {
  
  struct User {
    
    static let posts  = UserDefaults.Key(rawValue: "q")
    static let token  = UserDefaults.Key(rawValue: "token")
    
  }
  
}
