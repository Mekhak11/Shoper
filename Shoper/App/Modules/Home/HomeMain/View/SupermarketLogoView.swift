//
//  SupermarketLogoView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 4/13/25.
//

import SwiftUI

struct SupermarketLogoView: View {
  
    let marketId: Int

    var imageName: String {
        let name = "market_\(marketId)"
        return UIImage(named: name) != nil ? name : "market_default"
    }

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 1)
            )
            .shadow(radius: 2)
    }
}
