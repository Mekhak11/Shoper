//
//  NukeImageView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/6/25.
//

import SwiftUI
import NukeUI

struct NukeImageView: View {
  
  let url: URL?
  
  var body: some View {
    LazyImage(url: url) { state in
      if let image = state.image {
        image
          .resizable()
      } else if state.error != nil {
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.blue.opacity(0.1))
          .overlay(
            Image(systemName: "exclamationmark.circle")
          )
          .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 4)
      } else {
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.blue.opacity(0.1))
          .overlay(
            ProgressView()
              .progressViewStyle(.circular)
              .tint(.gray)
          )
          .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 4)
      }
    }
  }
  
}
