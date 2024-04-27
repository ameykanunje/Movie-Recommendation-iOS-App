//
//  SimilarMovieCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/26/24.
//

import SwiftUI

struct SimilarMovieCard: View {
    var similarMovie : Movie
    var movieType : MovieImageType = .poster
    
    var body: some View {
    
//            HStack{
//                if let imageUrl = URL(string: similarMovie.getImage(for: movieType)){
//                    AsyncImage(url: imageUrl) { image in
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 60, height: 60)
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    .clipShape(Circle())
//                }//image
        VStack(alignment : .leading, spacing: 8){
                    Text(similarMovie.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "globe")
                        Text("\(similarMovie.releaseDate.stringValue)".prefix(4))
                            .font(.caption)
                        Text("|")
                        Image(systemName: "star.fill")
                        Text("\(similarMovie.voteAverage, specifier: "%.2f")/10")
                            .font(.caption)
                    }
                    .font(.caption)
                }
                
    }
}

#Preview {
    SimilarMovieCard(similarMovie: DeveloperPreview.instance.movie)
}
