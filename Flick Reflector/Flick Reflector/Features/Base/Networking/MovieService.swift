//
//  MovieService.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/17/24.
//

import Foundation

enum MovieServiceError: Error{
    case invalidResponse
}

actor MovieService{
    func fetchData<T : Decodable>(api : APIConstructor) async throws -> T {
        let url = try DefaultUrlBuilder.build(api: api)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw MovieServiceError.invalidResponse
        }
        
        let JSONDecodedData =  try JSONDecoder().decode(T.self, from: data)
        return JSONDecodedData
        
    }
}
