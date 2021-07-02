//
//  NetworkError.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

enum NetworkError {
    case decodingError
    case httpError(statusCode: Int)
    case incorrectRequest
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the service"
        case .httpError(statusCode: let statusCode):
            return "Error code: \(statusCode) - Something went wrong"
        case .incorrectRequest:
            return "The URL request is invalid"
        case .unknown:
            return "The unknown error has occured"
        }
    }
}
