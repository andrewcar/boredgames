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
    var keyboardView: KeyboardView?
    
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
    
    
    // MARK: - ADD LETTERS
    private func addLetters() {

        // first row
        a1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // second row
        b1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // third row
        c1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fourth row
        d1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fifth row
        e1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // sixth row
        f1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame),
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding(frame) + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            guard let letter = letter else { return }
            addSubview(letter)
        }
    }

    // MARK: - ADD KEYBOARD VIEW
    private func addKeyboardView() {
        keyboardView = KeyboardView(frame: Frame.Keyboard.frame(frame))
        keyboardView?.keyboardDelegate = self
        addSubview(keyboardView!)
    }
    
    // MARK: - SETUP GAME
    private func setupGame() {
        GameModel.shared.setAnswerRandomly()
    }
    
    // MARK: - INSTANT CHECK ALL WORDS
    func instantlyCheckAllWords(firstGuess: String?,
                                secondGuess: String?,
                                thirdGuess: String?,
                                fourthGuess: String?,
                                fifthGuess: String?,
                                sixthGuess: String?) {
        
        if let firstGuess = firstGuess {
            instantlyCheckFirstWord(guess: firstGuess.lowercased()) {}
        }
        if let secondGuess = secondGuess {
            instantlyCheckSecondWord(guess: secondGuess.lowercased()) {}
        }
        if let thirdGuess = thirdGuess {
            instantlyCheckThirdWord(guess: thirdGuess.lowercased()) {}
        }
        if let fourthGuess = fourthGuess {
            instantlyCheckFourthWord(guess: fourthGuess.lowercased()) {}
        }
        if let fifthGuess = fifthGuess {
            instantlyCheckFifthWord(guess: fifthGuess.lowercased()) {}
        }
        if let sixthGuess = sixthGuess {
            instantlyCheckSixthWord(guess: sixthGuess.lowercased()) {}
        }
    }
    
    // MARK: - INSTANT CHECK FIRST WORD
    func instantlyCheckFirstWord(guess: String, completion: @escaping () -> ()) {
        updateA1(for: guess, animated: false) {
            self.updateA2(for: guess, animated: false) {
                self.updateA3(for: guess, animated: false) {
                    self.updateA4(for: guess, animated: false) {
                        self.updateA5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INSTANT CHECK SECOND WORD
    func instantlyCheckSecondWord(guess: String, completion: @escaping () -> ()) {
        updateB1(for: guess, animated: false) {
            self.updateB2(for: guess, animated: false) {
                self.updateB3(for: guess, animated: false) {
                    self.updateB4(for: guess, animated: false) {
                        self.updateB5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INSTANT CHECK THIRD WORD
    func instantlyCheckThirdWord(guess: String, completion: @escaping () -> ()) {
        updateC1(for: guess, animated: false) {
            self.updateC2(for: guess, animated: false) {
                self.updateC3(for: guess, animated: false) {
                    self.updateC4(for: guess, animated: false) {
                        self.updateC5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INSTANT CHECK FOURTH WORD
    func instantlyCheckFourthWord(guess: String, completion: @escaping () -> ()) {
        updateD1(for: guess, animated: false) {
            self.updateD2(for: guess, animated: false) {
                self.updateD3(for: guess, animated: false) {
                    self.updateD4(for: guess, animated: false) {
                        self.updateD5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INSTANT CHECK FIFTH WORD
    func instantlyCheckFifthWord(guess: String, completion: @escaping () -> ()) {
        updateE1(for: guess, animated: false) {
            self.updateE2(for: guess, animated: false) {
                self.updateE3(for: guess, animated: false) {
                    self.updateE4(for: guess, animated: false) {
                        self.updateE5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INSTANT CHECK SIXTH WORD
    func instantlyCheckSixthWord(guess: String, completion: @escaping () -> ()) {
        updateF1(for: guess, animated: false) {
            self.updateF2(for: guess, animated: false) {
                self.updateF3(for: guess, animated: false) {
                    self.updateF4(for: guess, animated: false) {
                        self.updateF5(for: guess, animated: false) {
                            completion()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - CHECK WORD
    private func checkWord(animated: Bool = true, completion: @escaping () -> ()) {
        switch GameModel.shared.guessNumber {
        case .first:
            guard GameModel.shared.currentLetter == .a5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.firstGuess = GameModel.shared.currentGuess.lowercased()
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
            guard GameModel.shared.currentLetter == .b5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.secondGuess = GameModel.shared.currentGuess.lowercased()
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
            guard GameModel.shared.currentLetter == .c5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.thirdGuess = GameModel.shared.currentGuess.lowercased()
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
            guard GameModel.shared.currentLetter == .d5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.fourthGuess = GameModel.shared.currentGuess.lowercased()
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
            guard GameModel.shared.currentLetter == .e5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.fifthGuess = GameModel.shared.currentGuess.lowercased()
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
            guard GameModel.shared.currentLetter == .f5 && GameModel.shared.currentGuess.count == 5 else { return }
            keyboardView?.isUserInteractionEnabled = false
            GameModel.shared.sixthGuess = GameModel.shared.currentGuess.lowercased()
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
    
    // MARK: - UPDATE GRID
    private func updateA1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)
            
            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            a1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            a1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateA2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            a2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            a2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateA3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            a3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            a3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateA4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            a4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            a4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateA5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            a5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            a5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            a5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateB1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            b1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
            
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            b1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateB2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            b2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            b2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateB3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            b3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            b3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateB4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            b4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)
            
        } else {
            b4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateB5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            b5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            b5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            b5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateC1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            c1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            c1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateC2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            c2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            c2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateC3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            c3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            c3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateC4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            c4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            c4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateC5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            c5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            c5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            c5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateD1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            d1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            d1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateD2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            d2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            d2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateD3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            d3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            d3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateD4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            d4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            d4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateD5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            d5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            d5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            d5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateE1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            e1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)
            
        } else {
            e1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateE2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            e2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            e2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateE3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            e3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            e3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateE4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            e4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            e4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateE5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            e5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            e5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            e5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateF1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[0])"
        
        // if first guessed letter is same as the word's first letter, make it green
        if guess[0] == answer[0] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f1?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guess[0]) {
            f1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f1?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            f1?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateF2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[1])"

        // if second guessed letter is same as the word's first letter, make it green
        if guess[1] == answer[1] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f2?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if second guessed letter is not in word, make it gray
        } else if !answer.contains(guess[1]) {
            f2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f2?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            f2?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateF3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[2])"

        // if third guessed letter is same as the word's first letter, make it green
        if guess[2] == answer[2] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f3?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if third guessed letter is not in word, make it gray
        } else if !answer.contains(guess[2]) {
            f3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f3?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            f3?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateF4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[3])"

        // if fourth guessed letter is same as the word's first letter, make it green
        if guess[3] == answer[3] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f4?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fourth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[3]) {
            f4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f4?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            f4?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
    
    private func updateF5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        let guess = guess ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[4])"

        // if fifth guessed letter is same as the word's first letter, make it green
        if guess[4] == answer[4] {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f5?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)

        // if fifth guessed letter is not in word, make it gray
        } else if !answer.contains(guess[4]) {
            f5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)

        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            GameModel.shared.incrementGuessLetter(guessLetter)
            f5?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)

        } else {
            f5?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
        }
    }
}

extension GridView: KeyboardDelegate {
    
    // MARK: - DID TAP LETTER
    func didTapLetter(_ letter: String) {
        switch GameModel.shared.currentLetter {
        case .a0:
            GameModel.shared.guessNumber = .first
            a1?.updateLetter(with: letter)
            a1?.setBorderActive()
            a1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .a1
        case .a1:
            a2?.updateLetter(with: letter)
            a2?.setBorderActive()
            a2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .a2
        case .a2:
            a3?.updateLetter(with: letter)
            a3?.setBorderActive()
            a3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .a3
        case .a3:
            a4?.updateLetter(with: letter)
            a4?.setBorderActive()
            a4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .a4
        case .a4:
            a5?.updateLetter(with: letter)
            a5?.setBorderActive()
            a5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .a5
        case .b0:
            GameModel.shared.guessNumber = .second
            b1?.updateLetter(with: letter)
            b1?.setBorderActive()
            b1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .b1
        case .b1:
            b2?.updateLetter(with: letter)
            b2?.setBorderActive()
            b2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .b2
        case .b2:
            b3?.updateLetter(with: letter)
            b3?.setBorderActive()
            b3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .b3
        case .b3:
            b4?.updateLetter(with: letter)
            b4?.setBorderActive()
            b4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .b4
        case .b4:
            b5?.updateLetter(with: letter)
            b5?.setBorderActive()
            b5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .b5
        case .c0:
            GameModel.shared.guessNumber = .third
            c1?.updateLetter(with: letter)
            c1?.setBorderActive()
            c1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .c1
        case .c1:
            c2?.updateLetter(with: letter)
            c2?.setBorderActive()
            c2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .c2
        case .c2:
            c3?.updateLetter(with: letter)
            c3?.setBorderActive()
            c3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .c3
        case .c3:
            c4?.updateLetter(with: letter)
            c4?.setBorderActive()
            c4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .c4
        case .c4:
            c5?.updateLetter(with: letter)
            c5?.setBorderActive()
            c5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .c5
        case .d0:
            GameModel.shared.guessNumber = .fourth
            d1?.updateLetter(with: letter)
            d1?.setBorderActive()
            d1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .d1
        case .d1:
            d2?.updateLetter(with: letter)
            d2?.setBorderActive()
            d2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .d2
        case .d2:
            d3?.updateLetter(with: letter)
            d3?.setBorderActive()
            d3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .d3
        case .d3:
            d4?.updateLetter(with: letter)
            d4?.setBorderActive()
            d4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .d4
        case .d4:
            d5?.updateLetter(with: letter)
            d5?.setBorderActive()
            d5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .d5
        case .e0:
            GameModel.shared.guessNumber = .fifth
            e1?.updateLetter(with: letter)
            e1?.setBorderActive()
            e1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .e1
        case .e1:
            e2?.updateLetter(with: letter)
            e2?.setBorderActive()
            e2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .e2
        case .e2:
            e3?.updateLetter(with: letter)
            e3?.setBorderActive()
            e3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .e3
        case .e3:
            e4?.updateLetter(with: letter)
            e4?.setBorderActive()
            e4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .e4
        case .e4:
            e5?.updateLetter(with: letter)
            e5?.setBorderActive()
            e5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .e5
        case .f0:
            GameModel.shared.guessNumber = .sixth
            f1?.updateLetter(with: letter)
            f1?.setBorderActive()
            f1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .f1
        case .f1:
            f2?.updateLetter(with: letter)
            f2?.setBorderActive()
            f2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .f2
        case .f2:
            f3?.updateLetter(with: letter)
            f3?.setBorderActive()
            f3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .f3
        case .f3:
            f4?.updateLetter(with: letter)
            f4?.setBorderActive()
            f4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .f4
        case .f4:
            f5?.updateLetter(with: letter)
            f5?.setBorderActive()
            f5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentLetter = .f5
        case .a5, .b5, .c5, .d5, .e5, .f5: ()
        }
    }
    
    // MARK: - DID TAP ENTER
    func didTapEnter() {
        guard GameModel.shared.currentGuess.count == 5 else { return }
        
        self.checkWord {
            if GameModel.shared.currentGuess == GameModel.shared.answer {
                print("You win!")
            } else {
                switch GameModel.shared.currentLetter {
                case .a5:
                    GameModel.shared.currentLetter = .b0
                case .b5:
                    GameModel.shared.currentLetter = .c0
                case .c5:
                    GameModel.shared.currentLetter = .d0
                case .d5:
                    GameModel.shared.currentLetter = .e0
                case .e5:
                    GameModel.shared.currentLetter = .f0
                default: ()
                }
            }
            GameModel.shared.currentGuess = ""
        }
    }
    
    // MARK: - DID TAP BACKSPACE
    func didTapBackspace() {
        if !GameModel.shared.currentGuess.isEmpty {
            GameModel.shared.currentGuess.removeLast()
        }
        
        switch GameModel.shared.currentLetter {
        case .a1:
            a1?.updateLetter(with: "")
            a1?.setBorderInactive()
            GameModel.shared.currentLetter = .a0
        case .a2:
            a2?.updateLetter(with: "")
            a2?.setBorderInactive()
            a1?.setBorderActive()
            GameModel.shared.currentLetter = .a1
        case .a3:
            a3?.updateLetter(with: "")
            a3?.setBorderInactive()
            a2?.setBorderActive()
            GameModel.shared.currentLetter = .a2
        case .a4:
            a4?.updateLetter(with: "")
            a4?.setBorderInactive()
            a3?.setBorderActive()
            GameModel.shared.currentLetter = .a3
        case .a5:
            a5?.updateLetter(with: "")
            a5?.setBorderInactive()
            a4?.setBorderActive()
            GameModel.shared.currentLetter = .a4
        case .b1:
            b1?.updateLetter(with: "")
            b1?.setBorderInactive()
            GameModel.shared.currentLetter = .b0
        case .b2:
            b2?.updateLetter(with: "")
            b2?.setBorderInactive()
            b1?.setBorderActive()
            GameModel.shared.currentLetter = .b1
        case .b3:
            b3?.updateLetter(with: "")
            b3?.setBorderInactive()
            b2?.setBorderActive()
            GameModel.shared.currentLetter = .b2
        case .b4:
            b4?.updateLetter(with: "")
            b4?.setBorderInactive()
            b3?.setBorderActive()
            GameModel.shared.currentLetter = .b3
        case .b5:
            b5?.updateLetter(with: "")
            b5?.setBorderInactive()
            b4?.setBorderActive()
            GameModel.shared.currentLetter = .b4
        case .c1:
            c1?.updateLetter(with: "")
            c1?.setBorderInactive()
            GameModel.shared.currentLetter = .c0
        case .c2:
            c2?.updateLetter(with: "")
            c2?.setBorderInactive()
            c1?.setBorderActive()
            GameModel.shared.currentLetter = .c1
        case .c3:
            c3?.updateLetter(with: "")
            c3?.setBorderInactive()
            c2?.setBorderActive()
            GameModel.shared.currentLetter = .c2
        case .c4:
            c4?.updateLetter(with: "")
            c4?.setBorderInactive()
            c3?.setBorderActive()
            GameModel.shared.currentLetter = .c3
        case .c5:
            c5?.updateLetter(with: "")
            c5?.setBorderInactive()
            c4?.setBorderActive()
            GameModel.shared.currentLetter = .c4
        case .d1:
            d1?.updateLetter(with: "")
            d1?.setBorderInactive()
            GameModel.shared.currentLetter = .d0
        case .d2:
            d2?.updateLetter(with: "")
            d2?.setBorderInactive()
            d1?.setBorderActive()
            GameModel.shared.currentLetter = .d1
        case .d3:
            d3?.updateLetter(with: "")
            d3?.setBorderInactive()
            d2?.setBorderActive()
            GameModel.shared.currentLetter = .d2
        case .d4:
            d4?.updateLetter(with: "")
            d4?.setBorderInactive()
            d3?.setBorderActive()
            GameModel.shared.currentLetter = .d3
        case .d5:
            d5?.updateLetter(with: "")
            d5?.setBorderInactive()
            d4?.setBorderActive()
            GameModel.shared.currentLetter = .d4
        case .e1:
            e1?.updateLetter(with: "")
            e1?.setBorderInactive()
            GameModel.shared.currentLetter = .e0
        case .e2:
            e2?.updateLetter(with: "")
            e2?.setBorderInactive()
            e1?.setBorderActive()
            GameModel.shared.currentLetter = .e1
        case .e3:
            e3?.updateLetter(with: "")
            e3?.setBorderInactive()
            e2?.setBorderActive()
            GameModel.shared.currentLetter = .e2
        case .e4:
            e4?.updateLetter(with: "")
            e4?.setBorderInactive()
            e3?.setBorderActive()
            GameModel.shared.currentLetter = .e3
        case .e5:
            e5?.updateLetter(with: "")
            e5?.setBorderInactive()
            e4?.setBorderActive()
            GameModel.shared.currentLetter = .e4
        case .f1:
            f1?.updateLetter(with: "")
            f1?.setBorderInactive()
            GameModel.shared.currentLetter = .f0
        case .f2:
            f2?.updateLetter(with: "")
            f2?.setBorderInactive()
            f1?.setBorderActive()
            GameModel.shared.currentLetter = .f1
        case .f3:
            f3?.updateLetter(with: "")
            f3?.setBorderInactive()
            f2?.setBorderActive()
            GameModel.shared.currentLetter = .f2
        case .f4:
            f4?.updateLetter(with: "")
            f4?.setBorderInactive()
            f3?.setBorderActive()
            GameModel.shared.currentLetter = .f3
        case .f5:
            f5?.updateLetter(with: "")
            f5?.setBorderInactive()
            f4?.setBorderActive()
            GameModel.shared.currentLetter = .f4
        default: ()
        }
    }
}
