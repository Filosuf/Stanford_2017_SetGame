//
//  Card.swift
//  SetGame
//
//  Created by 1234 on 19.05.2022.
//

import Foundation

struct Card: Equatable {

    let number: Variant // number - 1, 2, 3
    let color: Variant  // color  - 1, 2, 3 (например, red, green, purple)
    let shape: Variant  // symbol - 1, 2, 3 (например, diamond, squiggle, oval)
    let fill: Variant   // fill   - 1, 2, 3 (например, solid, striped, open)

    var isFaceUp = false
//    var isSelected = false
    
//    static func isSet(cards: [Card]) -> Bool {
//        guard cards.count == 3 else {return false}
//        print(cards.reduce(0, { $0 + $1.number.rawValue}))
//        let sum = [
//        cards.reduce(0, { $0 + $1.number.rawValue}),
//        cards.reduce(0, { $0 + $1.color.rawValue}),
//        cards.reduce(0, { $0 + $1.shape.rawValue}),
//        cards.reduce(0, { $0 + $1.fill.rawValue})
//        ]
//        print(sum)
//        return sum.reduce(true, { $0 && ($1 % 3 == 0) })
//    }
}

//enum Variant: Int, CaseIterable, CustomStringConvertible {
    enum Variant: Int, CaseIterable {
//    var description: String { "5" }

    case v1 = 1
    case v2 = 2
    case v3 = 3
}
