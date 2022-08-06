//
//  GamesCache.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import Foundation

struct GamesCache {
    static let key = "games"
    static func save(_ value: Games!) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    static func get() -> Games! {
        var userData: Games!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode(Games.self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
