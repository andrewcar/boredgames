//
//  GamesCache.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import Foundation

struct GamesCache {
    static let wgKey = "WordGuessGames"
    static let tttKey = "TicTacToeGames"
    
    static func saveWGGames(_ value: WordGuessGames!) {
        NSUbiquitousKeyValueStore.default.set(try? PropertyListEncoder().encode(value), forKey: wgKey)
    }
    
    static func saveTTTGames(_ value: TicTacToeGames!) {
        NSUbiquitousKeyValueStore.default.set(try? PropertyListEncoder().encode(value), forKey: tttKey)
    }
    
    static func getWGGames() -> WordGuessGames? {
        var userData: WordGuessGames
        if let data = NSUbiquitousKeyValueStore.default.object(forKey: wgKey) as? Data {
            do {
                userData = try PropertyListDecoder().decode(WordGuessGames.self, from: data)
                return userData
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    static func getTTTGames() -> TicTacToeGames? {
        var userData: TicTacToeGames
        if let data = NSUbiquitousKeyValueStore.default.object(forKey: tttKey) as? Data {
            do {
                userData = try PropertyListDecoder().decode(TicTacToeGames.self, from: data)
                return userData
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
        return nil
    }

    static func removeWGGames() {
        NSUbiquitousKeyValueStore.default.removeObject(forKey: wgKey)
    }
    
    static func removeTTTGames() {
        NSUbiquitousKeyValueStore.default.removeObject(forKey: tttKey)
    }
}
