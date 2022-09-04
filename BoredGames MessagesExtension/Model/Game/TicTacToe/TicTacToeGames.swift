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
    var catsGameCount: Int = 0
    var myWinCount: Int = 0
    var myLossCount: Int = 0
    var myStreakCount: Int = 0
    var myLongestStreak: Int = 0
    var theirWinCount: Int = 0
    var theirLossCount: Int = 0
    var theirStreakCount: Int = 0
    var theirLongestStreak: Int = 0
}
