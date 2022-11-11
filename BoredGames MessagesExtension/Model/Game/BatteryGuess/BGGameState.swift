//
//  BGGameState.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/12/22.
//

import Foundation

enum BGGameState: String, Hashable, Codable {
    case playing
    case someoneWon
    case nobodyWon
}
