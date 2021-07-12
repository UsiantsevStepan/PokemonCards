//
//  DummyData.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 05.07.2021.
//

import Foundation

class DummyData {
    static let cardCell = CardCell(
        name: "Pokemon",
        imageURL: URL(string: "https://images.pokemontcg.io/det1/1_hires.png"),
        hp: "30",
        types: "Grass",
        cardTypeColor: .green
    )
}
