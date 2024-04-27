//
//  PreviewProvider.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/15/24.
//

import SwiftUI

extension PreviewProvider{
    static var dev : DeveloperPreview {
        DeveloperPreview.instance
    }
}
//posterPath : /1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg
//backdropPath : /xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg
class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init() {}
    
    let movie = Movie(
        adult: false,
        backdropPath: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
        genreIDS: [27],
        id: 437342,
        originalLanguage: "en",
        originalTitle: "The First Omen",
        overview: "When a young American woman is sent to Rome to begin a life of service to the church, she encounters a darkness that causes her to question her own faith and uncovers a terrifying conspiracy that hopes to bring about the birth of evil incarnate.",
        popularity: 645.524,
        posterPath: "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
        releaseDate: "2024-04-03",
        title: "The First Omen",
        video: false,
        voteAverage: 6.692,
        voteCount: 86)
    
    let genre = Genre(id: 28, name: "Action")
    
    let review = Review(
        author: "Manuel São Bento",
        authorDetails: AuthorDetails(
            name: "Manuel São Bento",
            username: "msbreviews",
            avatarPath: "/1kks3YnVkpyQxzw36CObFPvhL5f.jpg",
            rating: 7),
        content: "FULL SPOILER-FREE REVIEW @ https://fandomwire.com/godzilla-x-kong-the-new-empire-review/\r\n\r\n\"Godzilla x Kong: The New Empire is a “more” version of the previous installment. More Hollow Earth, more Titans, more gloriously giant fights filled with fantastic visual effects… and much more nonsense too.\r\n\r\nThrough an openly absurd narrative, Adam Wingard takes the charm and chemistry of his cast to help focus the film’s main spotlight on the titanic protagonists, Godzilla and Kong, delivering two hours of pure, unadulterated entertainment.\r\n\r\nIt won’t convert the most skeptical, but it will certainly solidify the unashamed passion of MonsterVerse fans.\"\r\n\r\nRating: B",
        createdAt: "2024-03-28T18:01:31.827Z",
        id: "6605b07b3fe797017bcb584b",
        updatedAt: "",
        url: "")
    
    let recommend = Recommended(
        name: "Inception",
        year: "2010")
}

///rULWuutDcN5NvtiZi4FRPzRYWSh.jpg
