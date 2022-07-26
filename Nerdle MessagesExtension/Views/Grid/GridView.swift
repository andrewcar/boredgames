//
//  GridView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

class GridView: UIView {
    
    // MARK: - Properties
    private var a1: GridLetterView?
    private var a2: GridLetterView?
    private var a3: GridLetterView?
    private var a4: GridLetterView?
    private var a5: GridLetterView?
    private var b1: GridLetterView?
    private var b2: GridLetterView?
    private var b3: GridLetterView?
    private var b4: GridLetterView?
    private var b5: GridLetterView?
    private var c1: GridLetterView?
    private var c2: GridLetterView?
    private var c3: GridLetterView?
    private var c4: GridLetterView?
    private var c5: GridLetterView?
    private var d1: GridLetterView?
    private var d2: GridLetterView?
    private var d3: GridLetterView?
    private var d4: GridLetterView?
    private var d5: GridLetterView?
    private var e1: GridLetterView?
    private var e2: GridLetterView?
    private var e3: GridLetterView?
    private var e4: GridLetterView?
    private var e5: GridLetterView?
    private var f1: GridLetterView?
    private var f2: GridLetterView?
    private var f3: GridLetterView?
    private var f4: GridLetterView?
    private var f5: GridLetterView?
    private var keyboardView: KeyboardView?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addLetters()
        addKeyboardView()
        setupGame()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func addLetters() {

        // first row
        a1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // second row
        b1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // third row
        c1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fourth row
        d1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fifth row
        e1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // sixth row
        f1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            guard let letter = letter else { return }
            addSubview(letter)
        }
    }

    private func addKeyboardView() {
        keyboardView = KeyboardView(frame: Frame.Keyboard.frame(frame))
        keyboardView?.keyboardDelegate = self
        addSubview(keyboardView!)
    }
    
    private func setupGame() {
        GameModel.shared.setAnswerRandomly()
        if let answer = GameModel.shared.answer {
            print(answer)
        }
    }
    
    private func checkWord(completion: @escaping () -> ()) {
        switch GameModel.shared.guessNumber {
        case .first:
            guard GameModel.shared.currentLetter == .a5 && GameModel.shared.guess.count == 5 else { return }
            updateA1 {
                self.updateA2 {
                    self.updateA3 {
                        self.updateA4 {
                            self.updateA5 {
                                completion()
                            }
                        }
                    }
                }
            }
        case .second:
            guard GameModel.shared.currentLetter == .b5 && GameModel.shared.guess.count == 5 else { return }
            updateB1 {
                self.updateB2 {
                    self.updateB3 {
                        self.updateB4 {
                            self.updateB5 {
                                completion()
                            }
                        }
                    }
                }
            }
        case .third:
            guard GameModel.shared.currentLetter == .c5 && GameModel.shared.guess.count == 5 else { return }
            updateC1 {
                self.updateC2 {
                    self.updateC3 {
                        self.updateC4 {
                            self.updateC5 {
                                completion()
                            }
                        }
                    }
                }
            }
        case .fourth:
            guard GameModel.shared.currentLetter == .d5 && GameModel.shared.guess.count == 5 else { return }
            updateD1 {
                self.updateD2 {
                    self.updateD3 {
                        self.updateD4 {
                            self.updateD5 {
                                completion()
                            }
                        }
                    }
                }
            }
        case .fifth:
            guard GameModel.shared.currentLetter == .e5 && GameModel.shared.guess.count == 5 else { return }
            updateE1 {
                self.updateE2 {
                    self.updateE3 {
                        self.updateE4 {
                            self.updateE5 {
                                completion()
                            }
                        }
                    }
                }
            }
        case .sixth:
            guard GameModel.shared.currentLetter == .f5 && GameModel.shared.guess.count == 5 else { return }
            updateF1 {
                self.updateF2 {
                    self.updateF3 {
                        self.updateF4 {
                            self.updateF5 {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func updateA1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            a1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            a1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            a1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateA2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            a2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            a2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            a2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            a2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateA3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            a3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            a3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            a3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            a3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateA4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            a4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            a4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            a4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            a4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateA5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            a5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            a5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            a5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            a5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateB1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            b1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            b1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            b1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateB2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            b2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            b2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            b2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            b2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateB3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            b3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            b3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            b3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            b3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateB4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            b4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            b4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            b4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            b4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateB5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            b5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            b5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            b5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            b5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateC1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            c1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            c1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            c1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateC2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            c2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            c2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            c2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            c2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateC3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            c3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            c3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            c3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            c3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateC4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            c4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            c4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            c4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            c4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateC5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            c5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            c5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            c5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            c5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateD1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            d1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            d1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            d1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateD2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            d2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            d2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            d2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            d2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateD3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            d3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            d3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            d3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            d3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateD4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            d4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            d4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            d4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            d4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateD5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            d5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            d5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            d5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            d5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateE1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            e1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            e1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            e1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateE2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            e2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            e2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            e2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            e2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateE3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            e3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            e3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            e3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            e3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateE4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            e4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            e4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            e4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            e4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateE5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            e5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            e5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            e5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            e5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateF1(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            print("first letter correct")
            f1?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            print("first letter is not in word")
            f1?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        // if first guessed letter is not correct, but is in the word, make it yellow
        } else {
            print("first letter is wrong but is in word")
            f1?.updateLetter(to: .yellow, completion: {
                completion()
            })
        }
    }
    
    private func updateF2(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[1])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            print("second letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            f2?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            print("second letter is not in word")
            f2?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            f2?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            f2?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateF3(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[2])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            print("third letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            f3?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            print("third letter is not in word")
            f3?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            f3?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            f3?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateF4(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[3])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            print("fourth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            f4?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            print("fourth letter is not in word")
            f4?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            f4?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            f4?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
    
    private func updateF5(completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = GameModel.shared.guess.lowercased()
        let guessLetter = "\(guess[4])"
        print("answer = \(answer)")
        print("guess = \(guess)")

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            print("fifth letter correct")
            GameModel.shared.incrementGuessLetter(guessLetter)
            f5?.updateLetter(to: .green, completion: {
                completion()
            })
            
        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            print("fifth letter is not in word")
            f5?.updateLetter(to: .gray, completion: {
                completion()
            })
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            f5?.updateLetter(to: .yellow, completion: {
                completion()
            })
            
        } else {
            f5?.updateLetter(to: .gray, completion: {
                completion()
            })
        }
    }
}

// MARK: - KeyboardDelegate
extension GridView: KeyboardDelegate {
    func didTapLetter(_ letter: String) {
        switch GameModel.shared.currentLetter {
        case .a0:
            GameModel.shared.guessNumber = .first
            a1?.updateLetter(with: letter)
            a1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .a1
        case .a1:
            GameModel.shared.guessNumber = .first
            a2?.updateLetter(with: letter)
            a1?.setBorderInactive()
            a2?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .a2
        case .a2:
            GameModel.shared.guessNumber = .first
            a3?.updateLetter(with: letter)
            a2?.setBorderInactive()
            a3?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .a3
        case .a3:
            GameModel.shared.guessNumber = .first
            a4?.updateLetter(with: letter)
            a3?.setBorderInactive()
            a4?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .a4
        case .a4:
            GameModel.shared.guessNumber = .first
            a5?.updateLetter(with: letter)
            a4?.setBorderInactive()
            a5?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .a5
        case .a5:
            GameModel.shared.guessNumber = .first
            b1?.updateLetter(with: letter)
            a5?.setBorderInactive()
            b1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .b1
        case .b1:
            GameModel.shared.guessNumber = .second
            b2?.updateLetter(with: letter)
            b1?.setBorderInactive()
            b2?.setBorderActive()
            GameModel.shared.currentLetter = .b2
        case .b2:
            GameModel.shared.guessNumber = .second
            b3?.updateLetter(with: letter)
            b2?.setBorderInactive()
            b3?.setBorderActive()
            GameModel.shared.currentLetter = .b3
        case .b3:
            GameModel.shared.guessNumber = .second
            b4?.updateLetter(with: letter)
            b3?.setBorderInactive()
            b4?.setBorderActive()
            GameModel.shared.currentLetter = .b4
        case .b4:
            GameModel.shared.guessNumber = .second
            b5?.updateLetter(with: letter)
            b4?.setBorderInactive()
            b5?.setBorderActive()
            GameModel.shared.currentLetter = .b5
        case .b5:
            GameModel.shared.guessNumber = .second
            c1?.updateLetter(with: letter)
            b5?.setBorderInactive()
            c1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .c1
        case .c1:
            GameModel.shared.guessNumber = .third
            c2?.updateLetter(with: letter)
            c1?.setBorderInactive()
            c2?.setBorderActive()
            GameModel.shared.currentLetter = .c2
        case .c2:
            GameModel.shared.guessNumber = .third
            c3?.updateLetter(with: letter)
            c2?.setBorderInactive()
            c3?.setBorderActive()
            GameModel.shared.currentLetter = .c3
        case .c3:
            GameModel.shared.guessNumber = .third
            c4?.updateLetter(with: letter)
            c3?.setBorderInactive()
            c4?.setBorderActive()
            GameModel.shared.currentLetter = .c4
        case .c4:
            GameModel.shared.guessNumber = .third
            c5?.updateLetter(with: letter)
            c4?.setBorderInactive()
            c5?.setBorderActive()
            GameModel.shared.currentLetter = .c5
        case .c5:
            GameModel.shared.guessNumber = .third
            d1?.updateLetter(with: letter)
            c5?.setBorderInactive()
            d1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .d1
        case .d1:
            GameModel.shared.guessNumber = .fourth
            d2?.updateLetter(with: letter)
            d1?.setBorderInactive()
            d2?.setBorderActive()
            GameModel.shared.currentLetter = .d2
        case .d2:
            GameModel.shared.guessNumber = .fourth
            d3?.updateLetter(with: letter)
            d2?.setBorderInactive()
            d3?.setBorderActive()
            GameModel.shared.currentLetter = .d3
        case .d3:
            GameModel.shared.guessNumber = .fourth
            d4?.updateLetter(with: letter)
            d3?.setBorderInactive()
            d4?.setBorderActive()
            GameModel.shared.currentLetter = .d4
        case .d4:
            GameModel.shared.guessNumber = .fourth
            d5?.updateLetter(with: letter)
            d4?.setBorderInactive()
            d5?.setBorderActive()
            GameModel.shared.currentLetter = .d5
        case .d5:
            GameModel.shared.guessNumber = .fourth
            e1?.updateLetter(with: letter)
            d5?.setBorderInactive()
            e1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .e1
        case .e1:
            GameModel.shared.guessNumber = .fifth
            e2?.updateLetter(with: letter)
            e1?.setBorderInactive()
            e2?.setBorderActive()
            GameModel.shared.currentLetter = .e2
        case .e2:
            GameModel.shared.guessNumber = .fifth
            e3?.updateLetter(with: letter)
            e2?.setBorderInactive()
            e3?.setBorderActive()
            GameModel.shared.currentLetter = .e3
        case .e3:
            GameModel.shared.guessNumber = .fifth
            e4?.updateLetter(with: letter)
            e3?.setBorderInactive()
            e4?.setBorderActive()
            GameModel.shared.currentLetter = .e4
        case .e4:
            GameModel.shared.guessNumber = .fifth
            e5?.updateLetter(with: letter)
            e4?.setBorderInactive()
            e5?.setBorderActive()
            GameModel.shared.currentLetter = .e5
        case .e5:
            GameModel.shared.guessNumber = .fifth
            f1?.updateLetter(with: letter)
            e5?.setBorderInactive()
            f1?.setBorderActive()
            GameModel.shared.guess += letter
            GameModel.shared.currentLetter = .f1
        case .f1:
            GameModel.shared.guessNumber = .sixth
            f2?.updateLetter(with: letter)
            f1?.setBorderInactive()
            f2?.setBorderActive()
            GameModel.shared.currentLetter = .f2
        case .f2:
            GameModel.shared.guessNumber = .sixth
            f3?.updateLetter(with: letter)
            f2?.setBorderInactive()
            f3?.setBorderActive()
            GameModel.shared.currentLetter = .f3
        case .f3:
            GameModel.shared.guessNumber = .sixth
            f4?.updateLetter(with: letter)
            f3?.setBorderInactive()
            f4?.setBorderActive()
            GameModel.shared.currentLetter = .f4
        case .f4:
            GameModel.shared.guessNumber = .sixth
            f5?.updateLetter(with: letter)
            f4?.setBorderInactive()
            f5?.setBorderActive()
            GameModel.shared.currentLetter = .f5
        case .f5:
            GameModel.shared.guessNumber = .sixth
            f5?.setBorderInactive()
            GameModel.shared.guess += letter
        }
    }
    
    func didTapEnter() {
        guard GameModel.shared.guess.count == 5 else { return }
        self.checkWord {
            print("Checked word.")
            GameModel.shared.guess = ""
        }
    }
    
    func didTapBackspace() {
        //
    }
}
