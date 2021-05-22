//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pavel Senchenko on 06.04.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }.padding(5)
            //.aspectRatio(2/3, contentMode: .fit)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    fileprivate func body(for size: CGSize) -> some View {
        // MARK:  Drawing Constants
        let cornerRadius: CGFloat = 10.0
        let edgeLineWidth: CGFloat = 3.0
        let fontScaleFactor: CGFloat = 0.75
        
        return ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }.font(.system(size: min(size.height,
                                 size.width) * fontScaleFactor))
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
