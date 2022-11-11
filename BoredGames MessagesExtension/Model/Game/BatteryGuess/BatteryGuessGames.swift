//
//  BatteryGuessGames.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/12/22.
//

import Foundation

struct BatteryGuessGames: Hashable, Codable {
    var value: [BatteryGuessGame]
    var gameCount: Int = 0
    var myWinCount: Int = 0
    var myLossCount: Int = 0
    var myStreakCount: Int = 0
    var myLongestStreak: Int = 0
    var theirWinCount: Int = 0
    var theirLossCount: Int = 0
    var theirStreakCount: Int = 0
    var theirLongestStreak: Int = 0
}
