//
//  CommonTextFieldLogin.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//


import SwiftUI

struct CommonTextFieldLogin: View {
  
  var placeholder: String
  @Binding var text: String
  
  var body: some View {
    TextField(LocalizedStringKey(placeholder), text: $text)
      .padding()
      .frame(height: 48)
      .background(.white)
      .overlay (
        RoundedRectangle(cornerRadius: 16)
          .stroke(.gray, lineWidth: 1)
      )
  }
  
}
