//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var fontSize: Font {  
        viewModel.cards.count <= 4 * 2 ? .largeTitle : .body
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.aspectRatio(2/3, contentMode: .fit
                )
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(fontSize)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ForEach(ColorScheme.allCases, id: \.self) {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.dark)//($0)
        // }
    }
}
