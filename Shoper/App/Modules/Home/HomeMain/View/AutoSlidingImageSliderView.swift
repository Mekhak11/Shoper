//
//  AutoSlidingImageSliderView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 5/2/25.
//

import SwiftUI

struct AutoSlidingImageSliderView: View {
    let images: [String] // Use image names (e.g. asset names or URLs for remote loading)
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 16)
        .shadow(color: .blue.opacity(0.4), radius: 8, x: 0, y: 4)
        .presentationCornerRadius(16)

    }
}
