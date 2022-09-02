//
//  FiveLetterGuessGames.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/3/22.
//

import Foundation

struct FiveLetterGuessGames: Hashable, Codable {
    var value: [FiveLetterGuessGame]
    var gameCount: Int = 0
    var winCount: Int = 0
    var lossCount: Int = 0
    var streakCount: Int = 0
    var longestStreak: Int = 0
}
