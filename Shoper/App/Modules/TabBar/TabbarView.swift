//
//  TabbarView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct TabbarView: View {
  
  var body: some View {
    TabView {
      NavigationStack {
        HomeView<HomeViewModel>()
          .navigationTitle("Home")
      }
      .tabItem {
        Label("Home", systemImage: "house")
      }
      
      NavigationStack {
        CategoryView<CategoryViewModel>()
          .navigationTitle("Category")
      }
      .tabItem {
        Label("Category", systemImage: "square.grid.2x2")
      }
      
      NavigationStack {
        AIAssistantView()
          .navigationTitle("AI Assistant")
      }
      .tabItem {
        Label("AI Assistant", systemImage: "brain.head.profile")
      }
      
      NavigationStack {
        CartView<CartViewModel>()
          .navigationTitle("Cart")
      }
      .tabItem {
        Label("Cart", systemImage: "cart")
      }
    }
  }
  
}


#Preview {
  TabbarView()
}
