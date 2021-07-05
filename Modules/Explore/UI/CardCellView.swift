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
                                .foregroundColor(.gray)
                        }
                    }
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Blur(style: .systemMaterialDark))
                    .frame(width: 300, height: 450, alignment: .bottom)
                    .background(
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(
                        cornerRadius: 30,
                        style: .continuous
                    ))
                    .shadow(
                        color: .black.opacity(0.9),
                        radius: 10,
                        x: 0,
                        y: 10
                    )
                    
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
