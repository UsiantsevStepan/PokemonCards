//
//  NetworkService.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

protocol Network {
    func getData(endpoint: APIEndpoint) async throws -> Data
}

// Code in an actor runs on a background thread
actor NetworkService: Network {
    func getData(endpoint: APIEndpoint) async throws -> Data {
        guard let url = endpoint.urlRequest.url else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else { throw NetworkError.invalidServerResponse }
        
        return data
    }
}
