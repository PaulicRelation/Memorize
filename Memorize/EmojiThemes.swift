//
//  EmojiThemes.swift
//  Memorize
//
//  Created by Pavel Senchenko on 23.05.2021.
//

import SwiftUI

struct EmojiTheme {
    let name: String
    let emojiSet: [String]
    let numberOfCardPair: Int?
    let color: Color
}

let emojiThemes: [EmojiTheme] = [
    EmojiTheme(name: "Helloween",
          emojiSet: ["👻","🎃","🕷","💀","🏴‍☠️","👹","🕸","👁","🪦","🧟‍♂️","⚰️","☠️"].shuffled(),
          numberOfCardPair: 7, color: .orange),
    EmojiTheme(name: "Animals",
          emojiSet: ["🐱","🐈","🐶","🦊","🐔","🐸","🐵","🙊","🐣","🦆","🐴","🦋"].shuffled(),
          numberOfCardPair: nil, color: .green),
    EmojiTheme(name: "Sport",
          emojiSet: ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸"].shuffled(),
          numberOfCardPair: 4, color: .blue),
    EmojiTheme(name: "Technic",
          emojiSet: ["⌚️","💻","⌨️","🖥","🖨","🖱","🖲","📷","🎥","🛠","📡","📺"].shuffled(),
          numberOfCardPair: 5, color: .gray),
    EmojiTheme(name: "Fruit",
          emojiSet: ["🍏","🍎","🍐","🍋","🍌","🍉","🍇","🍓","🫐","🍒","🍍","🥥"].shuffled(),
          numberOfCardPair: nil, color: .red),
    EmojiTheme(name: "Food",
          emojiSet: ["🥐","🥯","🍞","🥖","🥨","🧀","🌭","🍔","🍟","🍕","🥪","🥙"].shuffled(),
          numberOfCardPair: 6, color: .yellow),
].shuffled()

