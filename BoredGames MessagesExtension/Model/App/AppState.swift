//
//  AppState.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/10/22.
//

import Foundation

enum AppState {
    case container
    case fiveLetterGuess
    case ticTacToe
    case dots
}

enum GameType: String, Hashable, Codable {
    case fiveLetterGuess
    case ticTacToe
    case dots
}
