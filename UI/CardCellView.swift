//
//  CardCellView.swift
//  PokemonCards (iOS)
//
//  Created by Степан Усьянцев on 05.07.2021.
//

import SwiftUI

struct CardCellView: View {
    var cardCell: CardCell
    
    var body: some View {
        VStack {
            AsyncImage(url: cardCell.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 300)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
