//
//  CardsService.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

protocol CardsRequests {
    func cards(pageNumber: Int) async throws
}

class CardsService: CardsRequests, ObservableObject {
    @Published private(set) var cards = [Card]()
    @Published private(set) var isFetching = false
    
    private let networkService = NetworkService()
    
    @MainActor
    func cards(pageNumber: Int) async throws {
        isFetching = true
        defer { isFetching = false }
        
        do {
            let data = try await networkService.getData(endpoint: .getCards(page: pageNumber))
            guard let decodedData = try? JSONDecoder().decode(CardData.self, from: data) else {
                throw CardsServiceError.decodingError
            }
            
            cards += decodedData.data
        } catch {
            throw error
        }
    }
}
