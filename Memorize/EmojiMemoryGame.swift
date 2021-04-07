//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

class EmojiMemoryGame {

    private var model: MemoryGame<String> = createMemoryGame(numberOfPairsOfCards: 5)// .random(in: 1...5))
    
    static func createMemoryGame(numberOfPairsOfCards cardsPair: Int) -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","💀","🏴‍☠️"]
        let cardsPair = min(cardsPair, emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: cardsPair) { pairIndex in emojis[pairIndex] }
    }
    
    // MARK: — Access to the Model:
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent (s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
        
    }
    
}
