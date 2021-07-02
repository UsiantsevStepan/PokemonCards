//
//  CardsServiceError.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

enum CardsServiceError {
    case decodingError
}

extension CardsServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the service"
        }
    }
}
