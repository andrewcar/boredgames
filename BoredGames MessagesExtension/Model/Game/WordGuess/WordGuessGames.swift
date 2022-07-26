//
//  WordGuessGames.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/3/22.
//

import Foundation

struct WordGuessGames: Hashable, Codable {
    var value: [WordGuessGame]
    var gameCount: Int = 0
    var winCount: Int = 0
    var lossCount: Int = 0
    var streakCount: Int = 0
    var longestStreak: Int = 0
}
