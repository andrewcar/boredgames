//
//  GameModel.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import Foundation

class GameModel: NSObject {
    
    // MARK: - Properties
    static let shared = GameModel()
    var guessNumber: Guess = .first
    var currentLetter: CurrentLetter = .a0
    var answer: String?
    var currentGuess = ""
    var firstGuess = ""
    var secondGuess = ""
    var thirdGuess = ""
    var fourthGuess = ""
    var fifthGuess = ""
    var sixthGuess = ""
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
    var guessCorrectLetterCounts: [String: Int] = [
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
    
    // MARK: - Public Methods
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
    
    func setAnswerRandomly() {
        let words: Words = GameModel.shared.load("words.json")
        guard let randomWord = words.list.randomElement() else { return }
        answer = randomWord
        populateAnswerLetterCountDictionary {}
    }
    
    func incrementGuessLetter(_ letter: String) {
        guard !currentGuess.isEmpty else { return }
        guessCorrectLetterCounts[letter.lowercased()]! += 1
    }
    
    // MARK: - Private Methods
    private func populateAnswerLetterCountDictionary(completion: @escaping () -> ()) {
        guard let answer = answer else { completion(); return }
        for letter in answer {
            let letterString = "\(letter)"
            answerLetterCounts[letterString]! += 1
        }
        completion()
    }
}
