//
//  ContentView.swift
//  Memorize
//
//  Created by Ramon Xavier on 27/03/24.
//

import SwiftUI

struct EmojiMemorizeGameView: View {
    typealias Card = MemorizeGame<String>.Card
    @ObservedObject var viewModel: EmojiMemorizeGame
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(4)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                }
            }
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        0
    }
    
}


#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
