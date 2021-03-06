//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
            
        }
    }
}
