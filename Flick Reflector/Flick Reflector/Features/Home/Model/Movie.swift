//
//  Movie.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/15/24.
//

import Foundation

//Now Playing

// MARK: - Welcome
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Movie
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath : String?
    let releaseDate : String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


extension Movie{
    
    func getImage(for type : MovieImageType) -> String{
        switch type{
        case .poster:
            return Constants.imageBaseUrl + (posterPath == nil ? backdropPath.stringValue : posterPath.stringValue)
        case .backdrop:
            return Constants.imageBaseUrl + (posterPath == nil ? posterPath.stringValue : backdropPath.stringValue)
        }
    }
}

enum MovieImageType{
    case poster, backdrop
}
