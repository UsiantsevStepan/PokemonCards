//
//  CardType.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 05.07.2021.
//

import SwiftUI

struct CardType {
    let name: String?
    
    var color: Color {
        switch self.name {
        case "Colorless":
            return .gray
        case "Darkness":
            return .black.opacity(0.7)
        case "Dragon":
            return .yellow
        case "Fairy":
            return .pink
        case "Fighting":
            return .red
        case "Fire":
            return .orange
        case "Grass":
            return .green
        case "Lightning":
            return .yellow.opacity(0.7)
        case "Metal":
            return .brown.opacity(0.5)
        case "Psychic":
            return .purple
        case "Water":
            return .blue
        default:
            return .black
        }
    }
}
