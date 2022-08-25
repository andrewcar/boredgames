//
//  TicTacToeModel.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/24/22.
//

import Foundation

protocol TTTGameDelegate {
    func didUpdateGame()
}

class TicTacToeModel: NSObject {
    static let shared = TicTacToeModel()
    var tttGameDelegate: TTTGameDelegate!
    var games = TicTacToeGames(value: [])
    var currentTTTGame: TicTacToeGame?
    
    // MARK: - TAG FOR SQUARE
    func tag(for square: TicTacToeSquare) -> Int {
        switch square {
        case .a0:
            return 0
        case .a1:
            return 1
        case .a2:
            return 2
        case .a3:
            return 3
        case .b1:
            return 4
        case .b2:
            return 5
        case .b3:
            return 6
        case .c1:
            return 7
        case .c2:
            return 8
        case .c3:
            return 9
        }
    }
    
    // MARK: - SQUARE FOR TAG
    func square(for tag: Int) -> TicTacToeSquare {
        switch tag {
        case 1:
            return .a1
        case 2:
            return .a2
        case 3:
            return .a3
        case 4:
            return .b1
        case 5:
            return .b2
        case 6:
            return .b3
        case 7:
            return .c1
        case 8:
            return .c2
        case 9:
            return .c3
        default:
            return .a0
        }
    }
    
    // MARK: - SYMBOL FOR TURN
    func emojiString(for turn: Turn) -> String {
        let x = "❌"
        let o = "⭕️"
        switch turn {
        case .first:
            return x
        case .second:
            return o
        case .third:
            return x
        case .fourth:
            return o
        case .fifth:
            return x
        case .sixth:
            return o
        case .seventh:
            return x
        case .eighth:
            return o
        case .ninth:
            return x
        }
    }
    
    // MARK: - UPDATE GAMES
    func updateGames(with game: TicTacToeGame) {
        guard !games.value.contains(where: { aGame in
            aGame.id == game.id
        }) else {
            return
        }
        games.gameCount += 1
        games.value.append(game)
        
        if game.state == .won {
            games.winCount += 1
            if games.streakCount == games.longestStreak {
                games.longestStreak += 1
            }
            games.streakCount += 1

        } else if game.state == .lost {
            games.lossCount += 1
            games.streakCount = 0
        }
        GamesCache.saveTTTGames(games)
        tttGameDelegate?.didUpdateGame()
    }
    
    // MARK: - RESET GAME
    func resetGame() {
        currentTTTGame = TicTacToeGame()
    }
}
