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
          emojiSet: ["π»","π","π·","π","π΄ββ οΈ","πΉ","πΈ","π","πͺ¦","π§ββοΈ","β°οΈ","β οΈ"].shuffled(),
          numberOfCardPair: 7, color: .orange),
    EmojiTheme(name: "Animals",
          emojiSet: ["π±","π","πΆ","π¦","π","πΈ","π΅","π","π£","π¦","π΄","π¦"].shuffled(),
          numberOfCardPair: nil, color: .green),
    EmojiTheme(name: "Sport",
          emojiSet: ["β½οΈ","π","π","βΎοΈ","πΎ","π","π","π₯","π±","πͺ","π","πΈ"].shuffled(),
          numberOfCardPair: 4, color: .blue),
    EmojiTheme(name: "Technic",
          emojiSet: ["βοΈ","π»","β¨οΈ","π₯","π¨","π±","π²","π·","π₯","π ","π‘","πΊ"].shuffled(),
          numberOfCardPair: 5, color: .gray),
    EmojiTheme(name: "Fruit",
          emojiSet: ["π","π","π","π","π","π","π","π","π«","π","π","π₯₯"].shuffled(),
          numberOfCardPair: nil, color: .red),
    EmojiTheme(name: "Food",
          emojiSet: ["π₯","π₯―","π","π₯","π₯¨","π§","π­","π","π","π","π₯ͺ","π₯"].shuffled(),
          numberOfCardPair: 6, color: .yellow),
].shuffled()

