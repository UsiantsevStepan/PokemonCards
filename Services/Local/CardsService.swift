//
//  CardsService.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

protocol CardsRequests {
    func cards(pageNumber: Int) async throws -> [Card]
}

actor CardsService: CardsRequests {
    private let networkService = NetworkService()
    private let jsonDecoder = JSONDecoder()
    
    func cards(pageNumber: Int) async throws -> [Card] {
        let data = try await networkService.getData(endpoint: .getCards(page: pageNumber))
        guard let decodedData = try? jsonDecoder.decode(CardData.self, from: data) else {
            throw CardsServiceError.decodingError
        }
        
        return decodedData.data
    }
}
