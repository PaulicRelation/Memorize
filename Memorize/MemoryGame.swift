//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import Foundation
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card choosen: \(card)")
        if let chosenIndex = self.cards.firstIndex(matching: card) {
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        print(cards[chosenIndex].isFaceUp)
        }

    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp: Bool = true
        let isMatched: Bool = false
        let content: CardContent
    }
    
}
