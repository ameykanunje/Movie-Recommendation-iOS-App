//
//  Endpoint.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/16/24.
//

import Foundation

enum Endpoint{
    case trending, topRated, genre, movieReviews(_ movieId : Int), discoverMovies, similarMovie(_ movieId :Int)
    
    private var path: String{
        switch self{
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)/reviews"
        case .discoverMovies:
            return "/3/discover/movie"
        case .similarMovie(let movieId):
            return "/3/movie/\(movieId)/similar"
        }
    }
    
    var fullPath: String{
        Constants.apiBaseUrl + path
    }
}


