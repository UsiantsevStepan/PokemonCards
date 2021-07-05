//
//  CardCell.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import Foundation

struct CardCell: Identifiable {
    let id = UUID()
    
    let name: String
    let imageURL: URL?
    let hp: String
    let types: String?
}
