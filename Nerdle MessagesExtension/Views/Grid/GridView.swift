//
//  GridView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

protocol GridDelegate {
    func showNotInWordListView()
    func showSuccessView()
    func showAnswer()
    func showSendButton(completion: @escaping () -> ())
}

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
    var gridDelegate: GridDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addLetters()
        addKeyboardView()
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
    
    // MARK: - RESET ROWS
    func resetRows() {
        for gridLetter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            gridLetter?.updateLetter(with: "")
            gridLetter?.updateLetter(to: .blank, animated: false, completion: {})
            gridLetter?.setBorderInactive()
        }
    }

    // MARK: - UPDATE ROWS FROM MESSAGE
    func updateRowsFromMessage(
                    answer: String?,
                    firstGuess: String?,
                    secondGuess: String?,
                    thirdGuess: String?,
                    fourthGuess: String?,
                    fifthGuess: String?,
                    sixthGuess: String?,
                    guessToAnimate: Guess? = .first,
                    completion: @escaping (GameState) -> ()) {
        
        if let firstGuess = firstGuess, let answer = answer {
            let guess = firstGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFirstRow(guess: guess,
                                    animated: guessToAnimate == .first ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let secondGuess = secondGuess, let answer = answer {
            let guess = secondGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateSecondRow(guess: guess,
                                animated: guessToAnimate == .second ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let thirdGuess = thirdGuess, let answer = answer {
            let guess = thirdGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateThirdRow(guess: guess,
                                animated: guessToAnimate == .third ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let fourthGuess = fourthGuess, let answer = answer {
            let guess = fourthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFourthRow(guess: guess,
                                animated: guessToAnimate == .fourth ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let fifthGuess = fifthGuess, let answer = answer {
            let guess = fifthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFifthRow(guess: guess,
                                animated: guessToAnimate == .fifth ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let sixthGuess = sixthGuess, let answer = answer {
            let guess = sixthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateSixthRow(guess: guess,
                                animated: guessToAnimate == .sixth ? true : false) {
                    completion(guess == answer ? .won : .lost)
                }
            }
        }
    }
    
    // MARK: - UPDATE FIRST ROW
    func updateFirstRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateA1(for: guess, animated: animated) {
                self.updateA2(for: guess, animated: animated) {
                    self.updateA3(for: guess, animated: animated) {
                        self.updateA4(for: guess, animated: animated) {
                            self.updateA5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE SECOND ROW
    func updateSecondRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateB1(for: guess, animated: animated) {
                self.updateB2(for: guess, animated: animated) {
                    self.updateB3(for: guess, animated: animated) {
                        self.updateB4(for: guess, animated: animated) {
                            self.updateB5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE THIRD ROW
    func updateThirdRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateC1(for: guess, animated: animated) {
                self.updateC2(for: guess, animated: animated) {
                    self.updateC3(for: guess, animated: animated) {
                        self.updateC4(for: guess, animated: animated) {
                            self.updateC5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FOURTH ROW
    func updateFourthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateD1(for: guess, animated: animated) {
                self.updateD2(for: guess, animated: animated) {
                    self.updateD3(for: guess, animated: animated) {
                        self.updateD4(for: guess, animated: animated) {
                            self.updateD5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FIFTH ROW
    func updateFifthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateE1(for: guess, animated: animated) {
                self.updateE2(for: guess, animated: animated) {
                    self.updateE3(for: guess, animated: animated) {
                        self.updateE4(for: guess, animated: animated) {
                            self.updateE5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE SIXTH ROW
    func updateSixthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateF1(for: guess, animated: animated) {
                self.updateF2(for: guess, animated: animated) {
                    self.updateF3(for: guess, animated: animated) {
                        self.updateF4(for: guess, animated: animated) {
                            self.updateF5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FIRST ROW FROM ENTER
    private func updateFirstRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .a5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess1 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased(), completion: {
            self.updateFirstRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        })
    }
    
    // MARK: - UPDATE SECOND ROW FROM ENTER
    private func updateSecondRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .b5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess2 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSecondRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE THIRD ROW FROM ENTER
    private func updateThirdRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .c5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess3 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateThirdRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE FOURTH ROW FROM ENTER
    private func updateFourthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .d5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess4 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFourthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE FIFTH ROW FROM ENTER
    private func updateFifthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .e5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess5 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFifthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE SIXTH ROW FROM ENTER
    private func updateSixthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .f5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.currentGame?.guess6 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSixthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }



    
    // MARK: - UPDATE ROWS FROM ENTER
    private func updateRowsFromEnter(completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let guessNumber = currentGame.guessNumber else { completion(); return }
        switch guessNumber {
        case .first:
            updateFirstRowFromEnter { completion() }
        case .second:
            updateSecondRowFromEnter { completion() }
        case .third:
            updateThirdRowFromEnter { completion() }
        case .fourth:
            updateFourthRowFromEnter { completion() }
        case .fifth:
            updateFifthRowFromEnter { completion() }
        case .sixth:
            updateSixthRowFromEnter { completion() }
        }
    }
    
    // MARK: - INCREMENT LETTER COUNTS
    private func incrementLetterCounts(guess: String, completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let answer = currentGame.answer else { completion(); return }

        for (letterIndex, letterCharacter) in guess.enumerated() {
            let letter = "\(letterCharacter)"
            
            // Handling Correct Guess Letters:
                // if the guess letter is the same as the answer's letter in that slot, mark it green
            if guess[letterIndex] == answer[letterIndex] {
                GameModel.shared.incrementGreenGuessLetter(letter)
            }
        }
        completion()
    }
    
    // MARK: - UPDATE LETTER VIEW
    private func updateHint(letterView: GridLetterView?, with guess: String?, at guessIndex: Int, animated: Bool, completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let answer = currentGame.answer else { completion(); return }
        if let guess = guess {
            letterView?.updateLetter(with: "\(guess.uppercased()[guessIndex])")
        }
        
        let guess = guess?.lowercased() ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[guessIndex])".lowercased()
        guard let answerLetterCount = GameModel.shared.answerLetterCounts[guessLetter] else { completion(); return }
        guard let guessLetterCount = GameModel.shared.guessLetterCounts[guessLetter] else { completion(); return }
        guard let yellowLetterCount = GameModel.shared.guessYellowLetterCounts[guessLetter] else { completion(); return }
        guard let greenLetterCount = GameModel.shared.guessGreenLetterCounts[guessLetter] else { completion(); return }

        // Handling Correct Guess Letters:
            // if the guess letter is the same as the answer's letter in that slot, mark it green
        if guess[guessIndex] == answer[guessIndex] {
            keyboardView?.setKeyToGreen(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟩"
            letterView?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            
        // Handling Incorrect Guess Letters:
            // if the guess letter is not in the answer, make it gray
        } else if !answer.contains(guessLetter) {
            keyboardView?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            
        // Handling Guess Letter Overflow:
            // if there are more of the guess letter in the guess than in the answer...
            // it's either gray or yellow...
        } else if guessLetterCount > answerLetterCount {
            
            // if there is already the same number of confirmed green guess letters as in the answer...
            // it must be gray
            if greenLetterCount == answerLetterCount {
                keyboardView?.setKeyToGray(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "⬜️"
                letterView?.updateLetter(to: .gray, animated: animated, completion: {
                    completion()
                })
                
            // else if there are less of the confirmed yellow guess letters than in the answer...
            // it must be yellow
            } else if yellowLetterCount < answerLetterCount  {
                GameModel.shared.incrementYellowGuessLetter(guessLetter)
                
                keyboardView?.setKeyToYellow(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "🟨"
                letterView?.updateLetter(to: .yellow, animated: animated, completion: {
                    completion()
                })
                
            // else there are more or the same amount of the confirmed yellow guess letters than in the answer
            } else {
                keyboardView?.setKeyToGray(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "⬜️"
                letterView?.updateLetter(to: .gray, animated: animated, completion: {
                    completion()
                })
            }

        // Handling Guess Letter Scarcity:
            // if there are more of the guess letter in the answer than in the guess...
        } else if answerLetterCount > yellowLetterCount {
            GameModel.shared.incrementYellowGuessLetter(guessLetter)
            
            keyboardView?.setKeyToYellow(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟨"
            letterView?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
        } else if answerLetterCount == yellowLetterCount {
            keyboardView?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
        }
    }
    
    // MARK: - UPDATE GRID
    private func updateA1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateA2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateA3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateA4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateA5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateB1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateB2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateB3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateB4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateB5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateC1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateC2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateC3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateC4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateC5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateD1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateD2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateD3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateD4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateD5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateE1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateE2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateE3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateE4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateE5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateF1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateF2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateF3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateF4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateF5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
}

extension GridView: KeyboardDelegate {
    
    // MARK: - DID TAP LETTER
    func didTapLetter(_ letter: String) {
        guard let currentGame = GameModel.shared.currentGame else { return }
        switch currentGame.currentLetter {
        case .a0:
            GameModel.shared.currentGame?.guessNumber = .first
            a1?.updateLetter(with: letter)
            a1?.setBorderActive()
            a1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .a1
        case .a1:
            a2?.updateLetter(with: letter)
            a2?.setBorderActive()
            a2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .a2
        case .a2:
            a3?.updateLetter(with: letter)
            a3?.setBorderActive()
            a3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .a3
        case .a3:
            a4?.updateLetter(with: letter)
            a4?.setBorderActive()
            a4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .a4
        case .a4:
            a5?.updateLetter(with: letter)
            a5?.setBorderActive()
            a5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .a5
        case .b0:
            GameModel.shared.currentGame?.guessNumber = .second
            b1?.updateLetter(with: letter)
            b1?.setBorderActive()
            b1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .b1
        case .b1:
            b2?.updateLetter(with: letter)
            b2?.setBorderActive()
            b2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .b2
        case .b2:
            b3?.updateLetter(with: letter)
            b3?.setBorderActive()
            b3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .b3
        case .b3:
            b4?.updateLetter(with: letter)
            b4?.setBorderActive()
            b4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .b4
        case .b4:
            b5?.updateLetter(with: letter)
            b5?.setBorderActive()
            b5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .b5
        case .c0:
            GameModel.shared.currentGame?.guessNumber = .third
            c1?.updateLetter(with: letter)
            c1?.setBorderActive()
            c1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .c1
        case .c1:
            c2?.updateLetter(with: letter)
            c2?.setBorderActive()
            c2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .c2
        case .c2:
            c3?.updateLetter(with: letter)
            c3?.setBorderActive()
            c3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .c3
        case .c3:
            c4?.updateLetter(with: letter)
            c4?.setBorderActive()
            c4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .c4
        case .c4:
            c5?.updateLetter(with: letter)
            c5?.setBorderActive()
            c5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .c5
        case .d0:
            GameModel.shared.currentGame?.guessNumber = .fourth
            d1?.updateLetter(with: letter)
            d1?.setBorderActive()
            d1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .d1
        case .d1:
            d2?.updateLetter(with: letter)
            d2?.setBorderActive()
            d2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .d2
        case .d2:
            d3?.updateLetter(with: letter)
            d3?.setBorderActive()
            d3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .d3
        case .d3:
            d4?.updateLetter(with: letter)
            d4?.setBorderActive()
            d4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .d4
        case .d4:
            d5?.updateLetter(with: letter)
            d5?.setBorderActive()
            d5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .d5
        case .e0:
            GameModel.shared.currentGame?.guessNumber = .fifth
            e1?.updateLetter(with: letter)
            e1?.setBorderActive()
            e1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .e1
        case .e1:
            e2?.updateLetter(with: letter)
            e2?.setBorderActive()
            e2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .e2
        case .e2:
            e3?.updateLetter(with: letter)
            e3?.setBorderActive()
            e3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .e3
        case .e3:
            e4?.updateLetter(with: letter)
            e4?.setBorderActive()
            e4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .e4
        case .e4:
            e5?.updateLetter(with: letter)
            e5?.setBorderActive()
            e5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .e5
        case .f0:
            GameModel.shared.currentGame?.guessNumber = .sixth
            f1?.updateLetter(with: letter)
            f1?.setBorderActive()
            f1?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .f1
        case .f1:
            f2?.updateLetter(with: letter)
            f2?.setBorderActive()
            f2?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .f2
        case .f2:
            f3?.updateLetter(with: letter)
            f3?.setBorderActive()
            f3?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .f3
        case .f3:
            f4?.updateLetter(with: letter)
            f4?.setBorderActive()
            f4?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .f4
        case .f4:
            f5?.updateLetter(with: letter)
            f5?.setBorderActive()
            f5?.growAndShrink()
            GameModel.shared.currentGuess += letter
            GameModel.shared.currentGame?.currentLetter = .f5
        case .a5, .b5, .c5, .d5, .e5, .f5: ()
        }
    }
    
    private func shakeLetterView(_ letterView: GridLetterView?) {
        guard let letterView = letterView else { return }

        UIView.animate(withDuration: 0.07, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveLinear) {
            letterView.frame = CGRect(x: letterView.frame.minX - 10, y: letterView.frame.minY, width: letterView.frame.width, height: letterView.frame.height)
        } completion: { _ in
            UIView.animate(withDuration: 0.06, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveLinear) {
                letterView.frame = CGRect(x: letterView.frame.minX + 20, y: letterView.frame.minY, width: letterView.frame.width, height: letterView.frame.height)
            } completion: { _ in
                UIView.animate(withDuration: 0.06, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveLinear) {
                    letterView.frame = CGRect(x: letterView.frame.minX - 20, y: letterView.frame.minY, width: letterView.frame.width, height: letterView.frame.height)
                } completion: { _ in
                    UIView.animate(withDuration: 0.06, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveLinear) {
                        letterView.frame = CGRect(x: letterView.frame.minX + 20, y: letterView.frame.minY, width: letterView.frame.width, height: letterView.frame.height)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveLinear) {
                            letterView.frame = CGRect(x: letterView.frame.minX - 10, y: letterView.frame.minY, width: letterView.frame.width, height: letterView.frame.height)
                        } completion: { _ in
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - SHAKE CURRENT ROW
    private func shakeCurrentRow() {
        guard let currentGame = GameModel.shared.currentGame else { return }
        guard let guessNumber = currentGame.guessNumber else { return }
        
        switch guessNumber {
        case .first:
            for letterView in [a1, a2, a3, a4, a5] {
                shakeLetterView(letterView)
            }
        case .second:
            for letterView in [b1, b2, b3, b4, b5] {
                shakeLetterView(letterView)
            }
        case .third:
            for letterView in [c1, c2, c3, c4, c5] {
                shakeLetterView(letterView)
            }
        case .fourth:
            for letterView in [d1, d2, d3, d4, d5] {
                shakeLetterView(letterView)
            }
        case .fifth:
            for letterView in [e1, e2, e3, e4, e5] {
                shakeLetterView(letterView)
            }
        case .sixth:
            for letterView in [f1, f2, f3, f4, f5] {
                shakeLetterView(letterView)
            }
        }
    }
    
    // MARK: - WORD IS IN LIST
    private func wordIsInList() -> Bool {
        let words: Words = GameModel.shared.load("words.json")
        guard words.list.contains(GameModel.shared.currentGuess.lowercased()) else {
            gridDelegate?.showNotInWordListView()
            shakeCurrentRow()
            return false
        }
        if let guessNumber = GameModel.shared.currentGame?.guessNumber, guessNumber == .first {
            GameModel.shared.setAnswerRandomly()
        }
        return true
    }
    
    // MARK: - SLIDE KEYBOARD TO LEFT
    private func slideKeyboard(completion: @escaping () -> ()) {
        keyboardView?.showing = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveEaseIn) {
            self.keyboardView?.frame = Frame.Keyboard.hiddenFrame(self.frame)
        } completion: { _ in
            completion()
        }
    }
    
    // MARK: - DID TAP ENTER
    func didTapEnter() {
        guard let currentGame = GameModel.shared.currentGame else { return }
        guard GameModel.shared.currentGuess.count == 5 else { return }
        
        guard wordIsInList() else { return }
        
        GameModel.shared.populateGuessLetterCountDictionary(with: GameModel.shared.currentGuess) {
            self.updateRowsFromEnter {
                if GameModel.shared.currentGuess.lowercased() != currentGame.answer {
                    switch currentGame.currentLetter {
                    case .a5:
                        GameModel.shared.currentGame?.guess1 = GameModel.shared.currentGuess
                        GameModel.shared.currentGame?.currentLetter = .b0
                    case .b5:
                        GameModel.shared.currentGame?.guess2 = GameModel.shared.currentGuess
                        GameModel.shared.currentGame?.currentLetter = .c0
                    case .c5:
                        GameModel.shared.currentGame?.guess3 = GameModel.shared.currentGuess
                        GameModel.shared.currentGame?.currentLetter = .d0
                    case .d5:
                        GameModel.shared.currentGame?.guess4 = GameModel.shared.currentGuess
                        GameModel.shared.currentGame?.currentLetter = .e0
                    case .e5:
                        GameModel.shared.currentGame?.guess5 = GameModel.shared.currentGuess
                        GameModel.shared.currentGame?.currentLetter = .f0
                    case .f5:
                        GameModel.shared.currentGame?.guess6 = GameModel.shared.currentGuess
                        self.gridDelegate?.showAnswer()
                        GameModel.shared.currentGame?.state = .lost
                    default: ()
                    }
                }
                
                if GameModel.shared.currentGuess.lowercased() == GameModel.shared.currentGame?.answer {
                    self.gridDelegate?.showSuccessView()
                    GameModel.shared.currentGame?.state = .won
                }
                
                if let updatedCurrentGame = GameModel.shared.currentGame,
                    (updatedCurrentGame.state == .won || updatedCurrentGame.state == .lost) {
                    GameModel.shared.updateGames(with: updatedCurrentGame)
                }
                
                GameModel.shared.currentGuess = ""
                
                self.slideKeyboard {
                    self.gridDelegate?.showSendButton {}
                }
            }
        }
    }
    
    // MARK: - DID TAP BACKSPACE
    func didTapBackspace() {
        guard let currentGame = GameModel.shared.currentGame else { return }
        
        if !GameModel.shared.currentGuess.isEmpty {
            GameModel.shared.currentGuess.removeLast()
        }
        
        switch currentGame.currentLetter {
        case .a1:
            a1?.updateLetter(with: "")
            a1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .a0
        case .a2:
            a2?.updateLetter(with: "")
            a2?.setBorderInactive()
            a1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .a1
        case .a3:
            a3?.updateLetter(with: "")
            a3?.setBorderInactive()
            a2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .a2
        case .a4:
            a4?.updateLetter(with: "")
            a4?.setBorderInactive()
            a3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .a3
        case .a5:
            a5?.updateLetter(with: "")
            a5?.setBorderInactive()
            a4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .a4
        case .b1:
            b1?.updateLetter(with: "")
            b1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .b0
        case .b2:
            b2?.updateLetter(with: "")
            b2?.setBorderInactive()
            b1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .b1
        case .b3:
            b3?.updateLetter(with: "")
            b3?.setBorderInactive()
            b2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .b2
        case .b4:
            b4?.updateLetter(with: "")
            b4?.setBorderInactive()
            b3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .b3
        case .b5:
            b5?.updateLetter(with: "")
            b5?.setBorderInactive()
            b4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .b4
        case .c1:
            c1?.updateLetter(with: "")
            c1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .c0
        case .c2:
            c2?.updateLetter(with: "")
            c2?.setBorderInactive()
            c1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .c1
        case .c3:
            c3?.updateLetter(with: "")
            c3?.setBorderInactive()
            c2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .c2
        case .c4:
            c4?.updateLetter(with: "")
            c4?.setBorderInactive()
            c3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .c3
        case .c5:
            c5?.updateLetter(with: "")
            c5?.setBorderInactive()
            c4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .c4
        case .d1:
            d1?.updateLetter(with: "")
            d1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .d0
        case .d2:
            d2?.updateLetter(with: "")
            d2?.setBorderInactive()
            d1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .d1
        case .d3:
            d3?.updateLetter(with: "")
            d3?.setBorderInactive()
            d2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .d2
        case .d4:
            d4?.updateLetter(with: "")
            d4?.setBorderInactive()
            d3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .d3
        case .d5:
            d5?.updateLetter(with: "")
            d5?.setBorderInactive()
            d4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .d4
        case .e1:
            e1?.updateLetter(with: "")
            e1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .e0
        case .e2:
            e2?.updateLetter(with: "")
            e2?.setBorderInactive()
            e1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .e1
        case .e3:
            e3?.updateLetter(with: "")
            e3?.setBorderInactive()
            e2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .e2
        case .e4:
            e4?.updateLetter(with: "")
            e4?.setBorderInactive()
            e3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .e3
        case .e5:
            e5?.updateLetter(with: "")
            e5?.setBorderInactive()
            e4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .e4
        case .f1:
            f1?.updateLetter(with: "")
            f1?.setBorderInactive()
            GameModel.shared.currentGame?.currentLetter = .f0
        case .f2:
            f2?.updateLetter(with: "")
            f2?.setBorderInactive()
            f1?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .f1
        case .f3:
            f3?.updateLetter(with: "")
            f3?.setBorderInactive()
            f2?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .f2
        case .f4:
            f4?.updateLetter(with: "")
            f4?.setBorderInactive()
            f3?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .f3
        case .f5:
            f5?.updateLetter(with: "")
            f5?.setBorderInactive()
            f4?.setBorderActive()
            GameModel.shared.currentGame?.currentLetter = .f4
        default: ()
        }
    }
}
