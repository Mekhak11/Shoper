//
//  ImageView.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//


import SwiftUI

struct ImageView: View {
  
    @ObservedObject var imageLoader: UrlImageModel
    @State var image: UIImage = UIImage()
    var size: CGSize = .zero
//
    init(withURL url:String) {
        imageLoader = UrlImageModel(withURL: url)
    }

    var body: some View {

        Image(uiImage: imageLoader.image ?? UIImage() )
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
//            .onReceive(imageLoader.objectWillChange) { data in
//                self.image = imageLoader.image ?? UIImage() //UIImage(data: data) ?? UIImage()
//            }
    }
}
