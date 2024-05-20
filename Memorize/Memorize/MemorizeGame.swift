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
        
        for _ in 0..<numberOfPairsOfCards {
            cards.append(Card(content: <#T##CardContent#>))
            cards.append(Card(content: <#T##CardContent#>))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
