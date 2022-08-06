//
//  GameState.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import Foundation

enum GameState: String, Hashable, Codable {
    case playing
    case won
    case lost
}
