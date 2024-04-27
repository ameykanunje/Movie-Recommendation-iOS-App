//
//  Review.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/22/24.
//

import Foundation

// MARK: - Welcome
struct ReviewResponse: Codable {
    let id: Int
    let results: [Review]?

    enum CodingKeys: String, CodingKey {
        case id, results
    }
}

// MARK: - Review
struct Review: Codable, Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}


extension Review {
    var authorName : String{
        authorDetails?.authorName ?? author
    }
    
    var authorImage : String {
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/"){
            image = String(image.dropFirst())
        }
        return image
    }
    
    var authorRating : String {
        authorDetails?.authorRating ?? ""
    }
}


extension AuthorDetails {
    var authorName : String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
    
    var authorRating : String{
        return rating != nil ? "\(rating)" : ""
    }
}
