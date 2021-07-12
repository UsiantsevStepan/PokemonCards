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
        VStack(spacing: 0) {
            AsyncImage(url: cardCell.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    HStack {
                        VStack {
                            Text(cardCell.name)
                                .font(.system(.title3))
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("HP: \(cardCell.hp)")
                                    .font(.system(.title3))
                            }
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        Spacer()
                        VStack {
                            Text("Type: \(cardCell.types!)")
                                .font(.system(.body))
                                .foregroundColor(.white)
                        }
                    }
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Blur(style: .systemThinMaterialDark))
                    .frame(
                        width: 320,
                        height: 520,
                        alignment: .bottom
                    )
                    .background(
                        VStack(spacing: 0) {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 320, height: 450)
                            .background(cardCell.cardTypeColor)
                            .cornerRadius(
                                radius: 30,
                                corners: [.topLeft, .topRight]
                            )
                        cardCell.cardTypeColor
                            .frame(width: 320, height: 60)
                    }
                    )
                    .clipShape(RoundedRectangle(
                        cornerRadius: 30,
                        style: .continuous
                    ))
                    
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardCellView(cardCell: DummyData.cardCell)
                .previewLayout(.sizeThatFits)
        }
    }
}
