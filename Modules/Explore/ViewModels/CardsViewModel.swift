//
//  CardsViewModel.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

class CardsViewModel: ObservableObject {
    @Published private(set) var cardsToExplore = [CardCell]()
    @Published private(set) var isFetching = false
    @Published private(set) var cardTypes = [CardType]()
    
    private var pageNumber = 1
    
    private let cardsService = CardsService()
    
    // exploreCardsList() includes cardsService.cards(pageNumber: Int) which runs on a background thread.
    // @MainActor attribute says that .cards(pageNumber: Int) must be executed on the MainActor thread
    // When exploreCardsList() calls .cards() it suspends itself, releasing the main thread to run UI jobs
    // When .cards() finishes, exploreCardsList() again runs on the main thread, where it's allowed to set the Published values.
    @MainActor
    func exploreCardsList() async throws {
        isFetching = true
        defer {
            isFetching = false
            pageNumber += 1
        }
        
        let cards = try await cardsService.cards(pageNumber: pageNumber)
        
        for card in cards {
            let imageURL = URL(string: (card.images.large ?? ""))
            let types = !card.types.isEmpty ? card.types.joined(separator: ",") : nil
            
            cardsToExplore.append(
                CardCell(
                    name: card.name,
                    imageURL: imageURL,
                    hp: card.hp,
                    types: types,
                    cardTypeColor: CardType(name: card.types.first).color
                )
            )
        }
    }
}
