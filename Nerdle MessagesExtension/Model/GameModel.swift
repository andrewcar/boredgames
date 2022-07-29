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
    var firstGuess: String?
    var secondGuess: String?
    var thirdGuess: String?
    var fourthGuess: String?
    var fifthGuess: String?
    var sixthGuess: String?
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
    
    func save(answer: String?) {
        self.answer = answer
        if let answer = answer {
            UserDefaults.standard.set(answer, forKey: "answer")
        } else {
            UserDefaults.standard.removeObject(forKey: "answer")
        }
    }
    
    func retrieveAnswer() -> String? {
        guard let answer = UserDefaults.standard.string(forKey: "answer") else { return nil }
        return answer
    }
    
    func save(firstGuess: String?) {
        self.firstGuess = firstGuess
        if let firstGuess = firstGuess {
            UserDefaults.standard.set(firstGuess, forKey: "firstGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "firstGuess")
        }
    }
    
    func retrieveFirstGuess() -> String? {
        guard let firstGuess = UserDefaults.standard.string(forKey: "firstGuess") else { return nil }
        return firstGuess
    }
    
    func save(secondGuess: String?) {
        self.secondGuess = secondGuess
        if let secondGuess = secondGuess {
            UserDefaults.standard.set(secondGuess, forKey: "secondGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "secondGuess")
        }
    }
    
    func retrieveSecondGuess() -> String? {
        guard let secondGuess = UserDefaults.standard.string(forKey: "secondGuess") else { return nil }
        return secondGuess
    }
    
    func save(thirdGuess: String?) {
        self.thirdGuess = thirdGuess
        if let thirdGuess = thirdGuess {
            UserDefaults.standard.set(thirdGuess, forKey: "thirdGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "thirdGuess")
        }
    }
    
    func retrieveThirdGuess() -> String? {
        guard let thirdGuess = UserDefaults.standard.string(forKey: "thirdGuess") else { return nil }
        return thirdGuess
    }
    
    func save(fourthGuess: String?) {
        self.fourthGuess = fourthGuess
        if let fourthGuess = fourthGuess {
            UserDefaults.standard.set(fourthGuess, forKey: "fourthGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "fourthGuess")
        }
    }
    
    func retrieveFourthGuess() -> String? {
        guard let fourthGuess = UserDefaults.standard.string(forKey: "fourthGuess") else { return nil }
        return fourthGuess
    }
    
    func save(fifthGuess: String?) {
        self.fifthGuess = fifthGuess
        if let fifthGuess = fifthGuess {
            UserDefaults.standard.set(fifthGuess, forKey: "fifthGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "fifthGuess")
        }
    }
    
    func retrieveFifthGuess() -> String? {
        guard let fifthGuess = UserDefaults.standard.string(forKey: "fifthGuess") else { return nil }
        return fifthGuess
    }

    func save(sixthGuess: String?) {
        self.sixthGuess = sixthGuess
        if let sixthGuess = sixthGuess {
            UserDefaults.standard.set(sixthGuess, forKey: "sixthGuess")
        } else {
            UserDefaults.standard.removeObject(forKey: "sixthGuess")
        }
    }
    
    func retrieveSixthGuess() -> String? {
        guard let sixthGuess = UserDefaults.standard.string(forKey: "sixthGuess") else { return nil }
        return sixthGuess
    }
    
    func save(guessNumber: String?) {
        switch guessNumber {
        case "first":
            self.guessNumber = .first
        case "second":
            self.guessNumber = .second
        case "third":
            self.guessNumber = .third
        case "fourth":
            self.guessNumber = .fourth
        case "fifth":
            self.guessNumber = .fifth
        case "sixth":
            self.guessNumber = .sixth
        default: ()
        }
        if let guessNumber = guessNumber {
            UserDefaults.standard.set(guessNumber, forKey: "guessNumber")
        } else {
            UserDefaults.standard.removeObject(forKey: "guessNumber")
        }
    }
    
    func retrieveGuessNumber() -> String? {
        guard let guessNumber = UserDefaults.standard.string(forKey: "guessNumber") else { return nil }
        return guessNumber
    }
    
    func setAnswerRandomly() {
        let words: Words = GameModel.shared.load("words.json")
        guard let randomWord = words.list.randomElement() else { return }
        answer = randomWord
        populateAnswerLetterCountDictionary {}
    }
    
    func resetGame() {
        guessNumber = .first
        currentLetter = .a0
        answer = nil
        currentGuess = ""
        firstGuess = nil
        secondGuess = nil
        thirdGuess = nil
        fourthGuess = nil
        fifthGuess = nil
        sixthGuess = nil
        resetSavedData()
        setAnswerRandomly()
    }
    
    private func resetSavedData() {
        save(answer: nil)
        save(guessNumber: nil)
        save(firstGuess: nil)
        save(secondGuess: nil)
        save(thirdGuess: nil)
        save(fourthGuess: nil)
        save(fifthGuess: nil)
        save(sixthGuess: nil)
    }
    
    func incrementGuessLetter(_ letter: String) {
        guessCorrectLetterCounts[letter.lowercased()]! += 1
    }
    
    // MARK: - Private Methods
    func populateAnswerLetterCountDictionary(completion: @escaping () -> ()) {
        guard let answer = answer else { completion(); return }
        for letter in answer {
            let letterString = "\(letter)"
            answerLetterCounts[letterString]! += 1
        }
        completion()
    }
}
