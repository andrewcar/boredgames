//
//  AppState.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/10/22.
//

import Foundation

enum AppState {
    case container
    case wordGuess
    case ticTacToe
    case dots
    case debug
}

enum GameType: String, Hashable, Codable {
    case wordGuess
    case ticTacToe
    case dots
}
