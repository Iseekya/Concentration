//
//  Card.swift
//  Concentration
//
//  Created by Stefan Hitrov on 9.10.20.
//

import Foundation

struct Card: Hashable {
    
    var isFacedUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
