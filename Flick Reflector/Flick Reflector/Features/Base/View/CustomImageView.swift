//
//  CustomImageView.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/15/24.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth : CGFloat
    let itemHeight : CGFloat
    let movie : Movie
    var imageType : MovieImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))){ image in
                image
                .resizable()
                .scaledToFill()
        }placeholder: {
            ZStack{
                Color.gray
                ProgressView()
                    .padding()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: itemWidth, height: itemHeight)
    }
}

#Preview {
    CustomImageView(itemWidth: 150, itemHeight: 150, movie: DeveloperPreview.instance.movie)
}
