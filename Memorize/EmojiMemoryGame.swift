//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
   
    @Published private var model: MemoryGame<String> =
        
        createMemoryGame(numberOfPairsOfCards: .random(in: 1...5))
    
    private static func createMemoryGame(numberOfPairsOfCards cardsPair: Int) -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","💀","🏴‍☠️","👹","🕸","👁","🪦","🧟‍♂️","⚰️","☠️"].shuffled()
        let cardsPair = min(cardsPair, emojis.count)
        
        return MemoryGame<String>(numberOfPairsOfCards: cardsPair) { pairIndex in emojis[pairIndex]
        }
    }
    
    // MARK: — Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent (s)
    func choose(card: MemoryGame<String>.Card) {
    //    objectWillChange.send()
        model.choose(card: card)
        
    }
    
}
