//
//  FiveLetterGuessGame.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 9/2/22.
//

import Foundation

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
    var state: FLGGameState = .playing
    var playerOne = Player(uuidString: nil, color: nil)
    var playerTwo = Player(uuidString: nil, color: nil)
    var currentPlayerUUID: String? = nil
}
