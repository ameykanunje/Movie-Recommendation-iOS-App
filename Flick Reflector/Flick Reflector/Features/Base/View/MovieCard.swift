//
//  MovieCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/15/24.
//

import SwiftUI

struct MovieCard: View {
    let movie : Movie
    var type : MovieCardType = .poster
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard{
    var itemWidth : CGFloat{
        screenWidth * type.widthPercent
    }
    var itemHeight: CGFloat{
        screenHeight * type.heightPercent
    }
}

#Preview {
    MovieCard(movie: DeveloperPreview.instance.movie)
}
