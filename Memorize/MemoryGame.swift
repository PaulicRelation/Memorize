//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import Foundation
struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card choosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
            
        }
    }

    struct Card: Identifiable {
        var id: Int
        let isFaceUp: Bool = true
        let isMatched: Bool = false
        let content: CardContent
        
    }
    
}
