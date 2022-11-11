//
//  BatteryGuessGame.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/12/22.
//

import Foundation

struct BatteryGuessGame: Hashable, Codable {
    var gameType: GameType? = nil
    var id = UUID()
    var playerOneBatteryPercentage: String? = nil
    var playerTwoBatteryPercentage: String? = nil
    var playerOneGuess: String? = nil
    var playerTwoGuess: String? = nil
    var state: BGGameState = .playing
    var playerOne = Player(uuidString: nil, color: nil)
    var playerTwo = Player(uuidString: nil, color: nil)
    var currentPlayerUUID: String? = nil
    var winnerUUID: String? = nil
}
