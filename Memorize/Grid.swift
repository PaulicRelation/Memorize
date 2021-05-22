//
//  Grid.swift
//  Memorize
//
//  Created by Pavel Senchenko on 21.05.2021.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    fileprivate func body(for layaut: GridLayout) -> some View {
        return ForEach(items) { item in
            body(for: item, in: layaut)
        }
    }
    
    fileprivate func body(for item: Item, in layaut: GridLayout) -> some View {
        return viewForItem(item)
            .frame(width: layaut.itemSize.width,
                   height: layaut.itemSize.height,
                   alignment: .center)
            .position(layaut.location(ofItemAt: index(of: item)))
    }
    
    func index (of item: Item)-> Int {
        for index in 0..<self.items.count {
            if self.items[index].id == item.id { return index }
        }
        return 0 // TODO: remove bogus
    }
    
}

