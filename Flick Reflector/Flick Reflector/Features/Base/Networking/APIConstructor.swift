//
//  APIConstructor.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/16/24.
//

import Foundation


typealias Parameters = [String : String]

struct APIConstructor{
    let endPoint : Endpoint
    var params : Parameters = [:]
}
