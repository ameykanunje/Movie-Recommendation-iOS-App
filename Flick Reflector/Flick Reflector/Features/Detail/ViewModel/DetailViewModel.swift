//
//  DetailViewModel.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/20/24.
//

import Foundation
import OpenAIKit

@MainActor
class DetailViewModel : ObservableObject{
    var movie : Movie
    let sections : [DetailViewSection] = [.about, .review]
    
    @Published var selectedSection : DetailViewSection = .about
    @Published var reviews : [Review] = []
    @Published var similarMovie : Movie? = nil
    
    private let movieService = MovieService()
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response : ReviewResponse = try await movieService.fetchData(api: APIConstructor(endPoint: .movieReviews(movie.id)))
            //print(response)
            guard let reviews = response.results else {
                self.reviews = []
                return
            }
            self.reviews = reviews
            
            
        }
        catch {
            print("Error: \(error)")
        }
    }
}

