//
//  ContentView.swift
//  Shared
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cardsViewModel = CardsViewModel()
    
    var body: some View {
        List(cardsViewModel.cardsToExplore) { card in
            CardCellView(cardCell: card)
        }
        .onAppear {
            async {
                do {
                    try await cardsViewModel.exploreCardsList()
                } catch {
                    print(error.localizedDescription)
                    return
                }
                print(cardsViewModel.cardsToExplore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
