//
//  Card.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

struct CardData: Decodable {
    let data: [Card]
}

struct Card: Decodable {
    let name: String
    let images: CardImage
    let hp: String
    let types: [String]
    let evlovesFrom: String?
}

struct CardImage: Decodable {
    let large: String?
}
