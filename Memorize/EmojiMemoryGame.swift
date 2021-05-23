//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
        
    @Published private var model: MemoryGame<String> =
        createMemoryGame(theme: theme)
    
    //MARK: - Appearense
    var color: Color { EmojiMemoryGame.theme.color }
    var themeName: String { EmojiMemoryGame.theme.name }
    

    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var score: String {
        "Score: \(model.score)"
    }
    
    //MARK: - Intent (s)
    func choose(card: MemoryGame<String>.Card) {
    //    objectWillChange.send()
        model.choose(card: card)
    }
    func newGame() {
        EmojiMemoryGame.theme = emojiThemes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: EmojiMemoryGame.theme)
    }
}

private extension EmojiMemoryGame {
    static var theme = emojiThemes.randomElement()!
    static func createMemoryGame(theme: EmojiTheme) -> MemoryGame<String> {
        let emojis = theme.emojiSet.shuffled()
        let cardsPair = theme.numberOfCardPair ?? .random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: cardsPair) { pairIndex in emojis[pairIndex]
        }
    }

}
