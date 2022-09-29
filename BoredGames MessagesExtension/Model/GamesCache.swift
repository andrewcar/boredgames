//
//  GamesCache.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import Foundation

struct GamesCache {
    static let flgKey = "FiveLetterGuessGames"
    static let tttKey = "TicTacToeGames"
    
    static func saveFLGGames(_ value: FiveLetterGuessGames!) {
        NSUbiquitousKeyValueStore.default.set(try? PropertyListEncoder().encode(value), forKey: flgKey)
    }
    
    static func saveTTTGames(_ value: TicTacToeGames!) {
        NSUbiquitousKeyValueStore.default.set(try? PropertyListEncoder().encode(value), forKey: tttKey)
    }
    
    static func getFLGGames() -> FiveLetterGuessGames? {
        var userData: FiveLetterGuessGames
        if let data = NSUbiquitousKeyValueStore.default.object(forKey: flgKey) as? Data {
            do {
                userData = try PropertyListDecoder().decode(FiveLetterGuessGames.self, from: data)
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

    static func removeFLGGames() {
        NSUbiquitousKeyValueStore.default.removeObject(forKey: flgKey)
    }
    
    static func removeTTTGames() {
        NSUbiquitousKeyValueStore.default.removeObject(forKey: tttKey)
    }
}
