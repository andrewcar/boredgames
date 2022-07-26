//
//  GameModel.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import Foundation

class GameModel: NSObject {
    static let shared = GameModel()
    var currentLetter: CurrentLetter = .a1
}
