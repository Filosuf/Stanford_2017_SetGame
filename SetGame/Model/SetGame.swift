//
//  SetGame.swift
//  SetGame
//
//  Created by 1234 on 19.05.2022.
//

import Foundation

class SetGame {

    var deckOfCards = [Card]()
    var cardsOnTable = [Card?]()
    var selectedCards = [Card]()

    //Создаем колоду из 3ˆ4 = 81 карты
    init() {
        startGame()
    }

    func startGame() {
        deckOfCards = []
        cardsOnTable = []
        selectedCards = []

        for number in Variant.allCases {
            for color in Variant.allCases {
                for shape in Variant.allCases {
                    for fill in Variant.allCases {
                        deckOfCards.append(Card(number: number,
                                                color: color,
                                                shape: shape,
                                                fill: fill))
                    }
                }
            }
        }

        for _ in 1...12{
            dealCard()
        }
    }

    func selectCard(card: Card) {
        if selectedCards.count == 3 {
            //remove card
            if isSet() {
                for card in selectedCards {
                    let index = cardsOnTable.firstIndex(of: card)!
                    cardsOnTable[index] = nil
                }
            }
            selectedCards = [card]
            //add card
            if deckOfCards.count > 0 {
                dealCard()
                dealCard()
                dealCard()
            }
        } else {
            selectedCards.append(card)
        }
    }
    
    func dealCard() {
        guard deckOfCards.count > 0 else { return }
        let randomIndex = Int.random(in: 0 ..< deckOfCards.count)
        var card = deckOfCards.remove(at: randomIndex)
        card.isFaceUp = true
        for cardOnTable in cardsOnTable {
            if cardOnTable == nil {
                if let vacantIndex = cardsOnTable.firstIndex(of: cardOnTable){
                    cardsOnTable[vacantIndex] = card
                    return
                }
            }
        }
        cardsOnTable.append(card)
        return
    }

    //Проверяем поочередно свойства карт, если все три карты разные, то сумма rawValue трёх разных вариантов будет равна 1 + 2 + 3 = 6, в случае когда все карты будут иметь одинкове варианты свойств сумма будет равна 3, 6 или 9 и в каждом случае сумма будет кратна 3. В Другом случае сет не собран
    func isSet() -> Bool {
        guard (selectedCards.count == 3) else {return false}

        var (sumNumber, sumColor, sumShape, sumFill) = (0, 0, 0, 0)

        for card in selectedCards {
            sumNumber += card.number.rawValue
            sumColor += card.color.rawValue
            sumShape += card.shape.rawValue
//            sumFill += card.fill.rawValue
        }
//        return sumNumber % 3 == 0 && sumColor % 3 == 0 && sumShape % 3 == 0 && sumFill % 3 == 0
//        print(#function)
//        for card in selectedCards {
//            print(card)
//        }
        return sumNumber % 3 == 0 && sumColor % 3 == 0 && sumShape % 3 == 0
    }

}
