//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Ramon Xavier on 15/05/24.
//

import SwiftUI


class EmojiMemorizeGame: ObservableObject {
    typealias Card = MemorizeGame<String>.Card

    private static let emojis = ["🍎", "🚗", "⌚", "🎈", "📷", "🎲", "🎧", "🍕", "🌺", "⛰️", "🚀", "🎨", "📚", "💡", "🔧", "🎳", "🎸", "🎮", "🏖️"]
    
    private static func createMemoryGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 10) { pairIndex in
            
            if emojis.indices.contains(pairIndex) {
                return EmojiMemorizeGame.emojis[pairIndex]
            } else {
                return ""
            }
        }
    }
    
    
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
