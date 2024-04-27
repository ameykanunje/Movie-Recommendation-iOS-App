//
//  RecommendCard.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/25/24.
//

import SwiftUI

struct RecommendCard: View {
    var recommendedMovie : Recommended
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(recommendedMovie.name)
                    .font(.title2)
                Text(recommendedMovie.year)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    RecommendCard(recommendedMovie: DeveloperPreview.instance.recommend)
}



//{
//    ForEach(vm.recommendedMovie, id: \.name){ movie in
//        AsyncImage(url: URL(string: movie.image)){ image in
//            switch image {
//            case .empty:
//                ProgressView()
//            case .success(let image):
//                image
//                    .resizable()
//                    .scaledToFit()
//            case .failure(let error):
//                Text("Failed to show image")
//            }
//        }
//        VStack(alignment: .leading){
//            Text(movie.name)
//                .font(.headline)
//                .fontWeight(.semibold)
//            
//            Text(movie.year)
//                .font(.caption)
//        }
//        
//    }
//}
