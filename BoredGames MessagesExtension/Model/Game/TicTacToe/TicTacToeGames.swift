//
//  TicTacToeGames.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/24/22.
//

import Foundation

struct TicTacToeGames: Hashable, Codable {
    var value: [TicTacToeGame]
    var gameCount: Int = 0
    var winCount: Int = 0
    var lossCount: Int = 0
    var catsGameCount: Int = 0
    var streakCount: Int = 0
    var longestStreak: Int = 0
}
