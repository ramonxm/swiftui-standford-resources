//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ramon Xavier on 15/05/24.
//

import Foundation

struct MemorizeGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        cards = []
    }
    
    func choose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
