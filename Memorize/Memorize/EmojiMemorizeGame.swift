//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Ramon Xavier on 15/05/24.
//

import SwiftUI

class EmojiMemorizeGame {
    private var model: MemorizeGame<String> = MemorizeGame(numberOfPairsOfCards: 4)
    
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
}
