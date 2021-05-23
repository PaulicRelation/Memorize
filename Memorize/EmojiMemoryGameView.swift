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
        VStack {
            
            HStack {
                Text(viewModel.themeName)
                    .padding(5)
                    .foregroundColor(viewModel.color)
                
                Text(viewModel.score)
                    .padding(5)
                    .foregroundColor(viewModel.color)
                
                
            }
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }.padding(5)
                //.aspectRatio(2/3, contentMode: .fit)
            }
            .padding()
            .foregroundColor(viewModel.color)
            
            Button(action: viewModel.newGame) {
                Text("New Game")
            }
            .padding(5)
            .foregroundColor(viewModel.color)
            
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90),
                    endAngle: Angle.degrees(110 - 90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .font(.system(size: min(size.height,
                                    size.width) * 0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        //ForEach(ColorScheme.allCases, id: \.self) {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        
        return EmojiMemoryGameView(viewModel: game).preferredColorScheme(.dark)//($0)
        // }
    }
}
