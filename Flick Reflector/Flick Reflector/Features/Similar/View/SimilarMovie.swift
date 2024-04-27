//
//  SimilarMovie.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/26/24.
//

import SwiftUI

struct SimilarMovie: View {
    @StateObject private var vm : SimilarMovieViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(movie : Movie) {
       _vm = StateObject(wrappedValue: SimilarMovieViewModel(movie: movie))
    }
    
    var body: some View {
        NavigationView{
            
            
            List{
                ForEach(vm.similarMovieContainer.prefix(9)){ movie in
                    SimilarMovieCard(similarMovie: movie)
                        .onTapGesture {
                            
                        }
                }
            }
            .navigationTitle("Recommended Movies")
            .navigationBarItems(leading: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    })
        }
        .onAppear(perform: {
            Task{
                await vm.fetchSimilarMovies()
            }
        })
        
    }
    
}

#Preview {
    SimilarMovie(movie: DeveloperPreview.instance.movie)
}
