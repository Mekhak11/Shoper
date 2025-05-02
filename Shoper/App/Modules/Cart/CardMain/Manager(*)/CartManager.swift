//
//  CartManager.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/14/25.
//

import Foundation

class CartManager {
  
  static let shared = CartManager()
  private let userDefaults = UserDefaults.standard
  private let cartKey = "cart_local"
  
  private(set) var cart: [String: Int] = [:]
  
  private init() {
    loadCart()
  }
  
  private func loadCart() {
    if let saved = userDefaults.dictionary(forKey: cartKey) as? [String: Int] {
      self.cart = saved.filter { $0.value > 0 }
    }
  }
  
  private func saveCart() {
    userDefaults.set(cart, forKey: cartKey)
  }
  
  func addToCart(productId: String, quantity: Int = 1) {
    guard cart[productId] == nil else { return } // Already in cart
    cart[productId] = quantity
    saveCart()
  }
  
  func removeFromCart(productId: String) {
    cart.removeValue(forKey: productId)
    saveCart()
  }
  
  func updateQuantity(productId: String, quantity: Int) {
    if quantity > 0 {
      cart[productId] = quantity
    } else {
      cart.removeValue(forKey: productId)
    }
    saveCart()
  }
  
  func getQuantity(productId: String) -> Int {
    return cart[productId] ?? 0
  }
  
  func getAllItems() -> [String: Int] {
    return cart
  }
  
  func clearCart() {
    cart.removeAll()
    saveCart()
  }
  
}

