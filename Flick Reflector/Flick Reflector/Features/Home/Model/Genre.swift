//
//  Genre.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/18/24.
//

import Foundation

// MARK: - GenreResponse
struct GenreResponse: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
