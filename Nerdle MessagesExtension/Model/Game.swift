//
//  Game.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import Foundation

class Game: NSObject {
    static let shared = Game()
    var currentLetter: CurrentLetter = .a1
}
