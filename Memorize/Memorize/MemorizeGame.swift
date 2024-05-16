//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ramon Xavier on 15/05/24.
//

import Foundation

struct MemorizeGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
