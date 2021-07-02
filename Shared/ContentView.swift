//
//  ContentView.swift
//  Shared
//
//  Created by Степан Усьянцев on 02.07.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cardsService = CardsService()
    
    var body: some View {
        Text("Hello")
            .padding()
            .onAppear {
                async {
                    try? await cardsService.cards(pageNumber: 1)
                    print(cardsService.cards)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
