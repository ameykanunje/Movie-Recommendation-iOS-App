//
//  SimilarMovieViewModel.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/26/24.
//

import Foundation

@MainActor
class SimilarMovieViewModel : ObservableObject{
    var movie : Movie
    private let movieService = MovieService()
    @Published var similarMovieContainer : [Movie] = []
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchSimilarMovies() async{
        do{
            let response : MovieResponse = try await movieService.fetchData(api: APIConstructor(endPoint: .similarMovie(movie.id)))
            print("Similar Movie -> \(similarMovieContainer)")
            similarMovieContainer = response.results
        }
        catch{
            print("Error \(error)")
        }
    }
}

//1. Getting the movie data from DetailView onTap,
//passing that to SimilarView and then using StateObject wrappedValue to pass it to SimilarMovieModel
