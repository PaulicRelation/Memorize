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
        let chosenIndex: Int = self.index(of: card)
        
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        print(cards[chosenIndex].isFaceUp)
    }
    
    func index (of card: Card)-> Int{
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id { return index }
        }
        return 0 // TODO: remove bogus
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
