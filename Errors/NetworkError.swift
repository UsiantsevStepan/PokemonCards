//
//  NetworkError.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

enum NetworkError {
    case invalidServerResponse
    case invalidURL
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "Something went wrong: invalid server response"
        case .invalidURL:
            return "The URL request is invalid"
        case .unknown:
            return "The unknown error has occured"
        }
    }
}
