//
//  Cardify.swift
//  Memorize
//
//  Created by Pavel Senchenko on 23.05.2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius:cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius:cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                    RoundedRectangle(cornerRadius:cornerRadius).fill()
            }
        }
    }
    
    // MARK:  Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
