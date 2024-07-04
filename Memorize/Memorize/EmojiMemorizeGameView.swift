//
//  ContentView.swift
//  Memorize
//
//  Created by Ramon Xavier on 27/03/24.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
    }
}


#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
