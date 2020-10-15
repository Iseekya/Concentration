//
//  Concentration.swift
//  Concentration
//
//  Created by Stefan Hitrov on 9.10.20.
//

import Foundation

class Concentration {
    
   private(set) var cards = [Card]()
    
   private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if cards[index].isFacedUp {
                        guard foundIndex == nil else { return nil }
                        foundIndex = index
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
            if !cards[index].isMatched {
                if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                    // check if cards match
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFacedUp = true
                } else {
                    indexOfOneAndOnlyFaceUpCard = index
                }
            }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) : You must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle of the cards
    }
    
}
