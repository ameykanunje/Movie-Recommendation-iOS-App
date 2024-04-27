//
//  Recommend.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/25/24.
//

import Foundation


struct RecommendResponse : Codable{
    let movies : [Recommended]
}

struct Recommended : Codable{
    let name, year: String
}
