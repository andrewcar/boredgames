//
//  GameModel.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import UIKit

protocol GameDelegate {
    func didUpdateGame()
}

class GameModel: NSObject {
    
    // MARK: - Properties
    static let shared = GameModel()
    
    var gameDelegate: GameDelegate!
    var isLandscape: Bool = false
    var words: Words?
    var games = Games(value: [])
    var customAnswer: String?
    var currentGame: Game?
    var currentGuess = ""
    var lastGuessInEmojis = ""
    var lastLastGuessInEmojis = ""
    var resetAvailable: Bool = false
    var answerLetterCounts: [String: Int] = [
        "a": 0,
        "b": 0,
        "c": 0,
        "d": 0,
        "e": 0,
        "f": 0,
        "g": 0,
        "h": 0,
        "i": 0,
        "j": 0,
        "k": 0,
        "l": 0,
        "m": 0,
        "n": 0,
        "o": 0,
        "p": 0,
        "q": 0,
        "r": 0,
        "s": 0,
        "t": 0,
        "u": 0,
        "v": 0,
        "w": 0,
        "x": 0,
        "y": 0,
        "z": 0
    ]
    var guessLetterCounts: [String: Int] = [
        "a": 0,
        "b": 0,
        "c": 0,
        "d": 0,
        "e": 0,
        "f": 0,
        "g": 0,
        "h": 0,
        "i": 0,
        "j": 0,
        "k": 0,
        "l": 0,
        "m": 0,
        "n": 0,
        "o": 0,
        "p": 0,
        "q": 0,
        "r": 0,
        "s": 0,
        "t": 0,
        "u": 0,
        "v": 0,
        "w": 0,
        "x": 0,
        "y": 0,
        "z": 0
    ]
    var guessGreenLetterCounts: [String: Int] = [
        "a": 0,
        "b": 0,
        "c": 0,
        "d": 0,
        "e": 0,
        "f": 0,
        "g": 0,
        "h": 0,
        "i": 0,
        "j": 0,
        "k": 0,
        "l": 0,
        "m": 0,
        "n": 0,
        "o": 0,
        "p": 0,
        "q": 0,
        "r": 0,
        "s": 0,
        "t": 0,
        "u": 0,
        "v": 0,
        "w": 0,
        "x": 0,
        "y": 0,
        "z": 0
    ]
    var guessYellowLetterCounts: [String: Int] = [
        "a": 0,
        "b": 0,
        "c": 0,
        "d": 0,
        "e": 0,
        "f": 0,
        "g": 0,
        "h": 0,
        "i": 0,
        "j": 0,
        "k": 0,
        "l": 0,
        "m": 0,
        "n": 0,
        "o": 0,
        "p": 0,
        "q": 0,
        "r": 0,
        "s": 0,
        "t": 0,
        "u": 0,
        "v": 0,
        "w": 0,
        "x": 0,
        "y": 0,
        "z": 0
    ]
    
    // MARK: - LOAD FILE
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    // MARK: - UPDATE GAMES
    func updateGames(with game: Game) {
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
        GamesCache.save(games)
        gameDelegate?.didUpdateGame()
    }
    
    // MARK: - UPDATE GAMES FROM USER DEFAULTS
    func updateGamesFromUserDefaults() {
        if let cachedGames = GamesCache.get() {
            games = cachedGames
        }
    }

    // MARK: - SET ANSWER RANDOMLY 
    func setAnswerRandomly() {
        words = GameModel.shared.load("words.json")
        guard let randomWord = words?.list.randomElement() else { return }
        if let customAnswer = customAnswer {
            currentGame?.answer = customAnswer.lowercased()
        } else {
            currentGame?.answer = randomWord
        }
        populateAnswerLetterCountDictionary {}
    }
    
    // MARK: - POPULATE ANSWER LETTER COUNTS
    func populateAnswerLetterCountDictionary(completion: @escaping () -> ()) {
        guard let answer = currentGame?.answer else { completion(); return }
        for letter in answer {
            let letterString = "\(letter)"
            answerLetterCounts[letterString]! += 1
        }
        completion()
    }
    
    // MARK: - POPULATE GUESS LETTER COUNTS
    func populateGuessLetterCountDictionary(with guess: String, completion: @escaping () -> ()) {
        let lowercasedGuess = guess.lowercased()
        for letter in lowercasedGuess {
            let letterString = "\(letter)"
            guessLetterCounts[letterString]! += 1
        }
        completion()
    }
    
    // MARK: - RESET ANSWER LETTER COUNTS
    func resetAnswerLetterCountDictionary(completion: @escaping () -> ()) {
        for (key, _) in answerLetterCounts {
            answerLetterCounts[key] = 0
        }
        completion()
    }
        
    // MARK: - RESET GUESS GREEN/YELLOW LETTER COUNTS
    func resetGuessLetterCountDictionary(completion: @escaping () -> ()) {
        for (key, _) in guessLetterCounts {
            guessLetterCounts[key] = 0
        }
        for (key, _) in guessGreenLetterCounts {
            guessGreenLetterCounts[key] = 0
        }
        for (key, _) in guessYellowLetterCounts {
            guessYellowLetterCounts[key] = 0
        }
        completion()
    }
    
    // MARK: - INCREMENT GREEN GUESS LETTER
    func incrementGreenGuessLetter(_ letter: String) {
        guessGreenLetterCounts[letter.lowercased()]! += 1
    }
    
    // MARK: - INCREMENT YELLOW GUESS LETTER
    func incrementYellowGuessLetter(_ letter: String) {
        guessYellowLetterCounts[letter.lowercased()]! += 1
    }
    
    // MARK: - RESET GAME
    func resetGame(completion: @escaping () -> ()) {
        currentGame = Game()
        currentGuess = ""
        lastGuessInEmojis = ""
        resetAnswerLetterCountDictionary {
            self.resetGuessLetterCountDictionary {
                completion()
            }
        }
    }
}
