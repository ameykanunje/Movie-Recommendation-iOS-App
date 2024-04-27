//
//  HomeViewModel.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/17/24.
//

import Foundation
import Combine

enum MovieType{
    case trending
    case topRated
    case genre
    case discoverMovies
}

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topRatedMovies : [Movie] = []
    @Published var trendingMovies : [Movie] = []
    @Published var filteredMovie : [Movie] = []
    @Published var moviesForSelectedGenre : [Movie] = []
    @Published var genreMovies : [Genre] = []
    @Published var selectedGenre = DeveloperPreview.instance.genre
    @Published var errorMsg = ""
    @Published var selectedMovie : Movie? = nil
    @Published var searchedMovie : String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    private let movieService = MovieService()
    
//    var filteredFollowers : [Movie] {
//        guard !searchedMovie.isEmpty else {
//            return filteredMovie
//        }
//        print("SearchedMovie : \(searchedMovie)")
//        isSearching = true
//        var trending = trendingMovies.filter{ $0.title.localizedCaseInsensitiveContains(searchedMovie)}
//        //print("Filtered Content : \(trending)")
//        return trending
//    }
    
    func filterMovies(){
        print("In filteredMovies")
        filteredMovie = trendingMovies.filter{ $0.title.localizedCaseInsensitiveContains(searchedMovie)}
        print(filteredMovie)
    }

    
    func fetchMovies(for type: MovieType ) async {
        do{
            //print("in Fetch Movies")
            //getting Response from API
            
            //print(movieApiReponse.results)
            //store in the container accordong to the type
            switch type{
            case .trending:
                let movieApiReponse : MovieResponse = try await movieService.fetchData(api: APIConstructor(endPoint: .trending))
                trendingMovies = movieApiReponse.results
            case .topRated:
                let movieApiReponse : MovieResponse = try await movieService.fetchData(api: APIConstructor(endPoint: .topRated))
                topRatedMovies = movieApiReponse.results
            case .genre:
                let genreApiResponse : GenreResponse = try await movieService.fetchData(api: APIConstructor(endPoint: .genre))
                genreMovies = genreApiResponse.genres
                if let genreMovies = genreMovies.first{
                    selectedGenre = genreMovies
                    await fetchMovies(for: .discoverMovies)
                }
            case .discoverMovies:
                let api = APIConstructor(endPoint: .discoverMovies, params: ["with_genres" : "\(selectedGenre.id)"])
                let response : MovieResponse = try await movieService.fetchData(api: api)
                moviesForSelectedGenre = response.results
            }
            
        }catch{
            errorMsg = "Error : \(error)"
        }
        
    }
}

//var endPoint : Endpoint
////selection of endPoint
//switch type{
//case .trending:
//    endPoint = .trending
//case .topRated:
//    endPoint = .topRated
//case .genre:
//    endPoint = .genre
//}
