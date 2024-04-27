//
//  SearchView.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/23/24.
//

import SwiftUI

struct SearchView: View {
    let filteredMovie : Movie
    
    var body: some View {
            HStack {
                    if let imageURL = URL(string: filteredMovie.getImage(for: .poster)) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    VStack(alignment: .leading, spacing: 5){
                        Text(filteredMovie.title)
                            .fontWeight(.semibold)
                            .font(.title3)
                        HStack{
                            Text("\(filteredMovie.releaseDate.stringValue)".prefix(4))
                                .font(.caption)
                            Text("|  \(filteredMovie.voteAverage, specifier: "%.2f")/10")
                                .font(.caption)
                        }
                        
                    }
                    
                }

        }
}

#Preview {
    SearchView(filteredMovie: DeveloperPreview.instance.movie)
}
