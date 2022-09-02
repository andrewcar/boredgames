//
//  Words.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import Foundation

struct Words: Hashable, Codable {
    var list: [String]
    
    enum CodingKeys: String, CodingKey {
        case list = "words"
    }
}
