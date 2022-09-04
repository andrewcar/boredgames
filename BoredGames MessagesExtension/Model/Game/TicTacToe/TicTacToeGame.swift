//
//  TicTacToeGame.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 9/2/22.
//

import Foundation

struct TicTacToeGame: Hashable, Codable {
    var gameType: GameType? = nil
    var id = UUID()
    var a1: String? = nil
    var a2: String? = nil
    var a3: String? = nil
    var b1: String? = nil
    var b2: String? = nil
    var b3: String? = nil
    var c1: String? = nil
    var c2: String? = nil
    var c3: String? = nil
    var turnNumber: Turn? = Turn.first
    var playerOne = Player(uuidString: nil, color: nil)
    var playerTwo = Player(uuidString: nil, color: nil)
    var currentPlayerUUID: String? = nil
    var winnerUUID: String? = nil
}
