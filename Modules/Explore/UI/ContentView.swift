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
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("Card details")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.leading)
                    Spacer()
                    Button("See All") {
                        
                    }
                }
                .padding(.trailing)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        HStack {
                            ForEach(cardsViewModel.cardsToExplore, id: \.self) { card in
                                CardCellView(cardCell: card)
                                    .padding()
                                    .padding(.top, 0)
                            }
                        }
                        Spacer()
                    }
                }
                .onAppear {
                    async {
                        do {
                            try await cardsViewModel.exploreCardsList()
                        } catch {
                            print(error.localizedDescription)
                            return
                        }
                    }
                }
            }
            .navigationBarTitle("Explore")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}
