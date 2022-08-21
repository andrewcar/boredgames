//
//  Player.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/18/22.
//

import Foundation

struct Player: Hashable, Codable {
    var uuidString: String?
    var color: PlayerColor?
}
