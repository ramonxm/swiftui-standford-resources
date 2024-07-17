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
    @State private var dealt = Set<Card.ID>()
    @State private var lastScoreChange = (0, causedByCardId: "")
    @Namespace private var dealingNamespace
    
    
    var body: some View {
        VStack {
            cards.foregroundColor(viewModel.color)
            HStack {
                score
                Spacer()
                deck.foregroundColor(viewModel.color)
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
        AspectVGrid(viewModel.cards, aspectRatio: Constants.aspectRatio) { card in
            if isDealt(card) {
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .aspectRatio(Constants.aspectRatio, contentMode: .fit)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        choose(card)
                    }
            }
        }
    }
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
        .frame(width: Constants.deckWidth, height: Constants.deckWidth / Constants.aspectRatio)
        .onTapGesture {
            deal()
        }
    }
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    private func deal() {
        var delay: TimeInterval = 0
        for card in viewModel.cards {
            withAnimation(Constants.Deal.animation.delay(delay)) {
               _ = dealt.insert(card.id)
            }
            delay += Constants.Deal.interval
        }
    }

    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount,id) = lastScoreChange
        
        return card.id == id ? amount : 0
    }
    
    private struct Constants {
        static let aspectRatio: CGFloat = 2/3
        static let spacing: CGFloat = 4

        struct Deal {
            static let animation: Animation = .easeInOut(duration: 1)
            static let interval: TimeInterval = 0.05
            static let Width: CGFloat = 50
        }
        
        static let deckWidth: CGFloat = 50
    }
    
}


#Preview {
    EmojiMemorizeGameView(viewModel: EmojiMemorizeGame())
}
