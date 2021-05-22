//
//  Array+Only.swift
//  Memorize
//
//  Created by Pavel Senchenko on 22.05.2021.
//

import Foundation

extension Array{
    var only: Element? {
        count == 1 ? first : nil
    }
}
