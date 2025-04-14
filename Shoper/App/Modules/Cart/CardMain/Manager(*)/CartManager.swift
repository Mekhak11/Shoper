//
//  CartManager.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/14/25.
//

import Foundation

struct CartManager {
  
    static let shared = CartManager()
    private let userDefaults = UserDefaults.standard

    func addToCart(productId: String, quantity: Int = 1) {
        let currentQty = userDefaults.integer(forKey: productId)
        userDefaults.set(currentQty + quantity, forKey: productId)
    }

    func removeFromCart(productId: String) {
        userDefaults.removeObject(forKey: productId)
    }

    func updateQuantity(productId: String, quantity: Int) {
        userDefaults.set(quantity, forKey: productId)
    }

    func getQuantity(productId: String) -> Int {
        return userDefaults.integer(forKey: productId)
    }

    func getAllItems() -> [String: Int] {
        userDefaults.dictionaryRepresentation().compactMapValues { $0 as? Int }
            .filter { $0.value > 0 }
    }
}
