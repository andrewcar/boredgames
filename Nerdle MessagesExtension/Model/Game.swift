//
//  Game.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/3/22.
//

import Foundation

struct Games: Hashable, Codable {
    var value: [Game]
    var gameCount: Int = 0
    var winCount: Int = 0
    var lossCount: Int = 0
}

struct Game: Hashable, Codable {
    var number: Int = 0
    var answer: String? = nil
    var guess1: String? = nil
    var guess2: String? = nil
    var guess3: String? = nil
    var guess4: String? = nil
    var guess5: String? = nil
    var guess6: String? = nil
    var guessNumber: Guess? = Guess.first
    var currentLetter: CurrentLetter = .a0
    var state: GameState = .playing
}
