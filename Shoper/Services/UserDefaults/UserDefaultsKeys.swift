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
  
  struct Cart {
    
    static let savedProductID = UserDefaults.Key(rawValue: "q")
    
  }
  
}
