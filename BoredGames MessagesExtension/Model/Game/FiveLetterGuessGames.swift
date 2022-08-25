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

struct FiveLetterGuessGame: Hashable, Codable {
    var gameType: GameType? = nil
    var id = UUID()
    var answer: String? = nil
    var guess1: String? = nil
    var guess2: String? = nil
    var guess3: String? = nil
    var guess4: String? = nil
    var guess5: String? = nil
    var guess6: String? = nil
    var guessNumber: Guess? = Guess.first
    var currentLetter: FiveLetterGuessCurrentLetter = .a0
    var state: GameState = .playing
    var playerOne = Player(uuidString: nil, color: nil)
    var playerTwo = Player(uuidString: nil, color: nil)
    var currentPlayerUUID: String? = nil
}
