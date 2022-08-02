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
    func showSendButton()
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

    // MARK: - UPDATE ROWS
    func updateRows(firstGuess: String?,
                    secondGuess: String?,
                    thirdGuess: String?,
                    fourthGuess: String?,
                    fifthGuess: String?,
                    sixthGuess: String?,
                    guessToAnimate: Guess? = .first,
                    completion: @escaping () -> ()) {
        
        if let firstGuess = firstGuess {
            updateFirstRow(guess: firstGuess.lowercased(),
                           animated: guessToAnimate == .first ? true : false) {
                completion()
            }
        }
        if let secondGuess = secondGuess {
            updateSecondRow(guess: secondGuess.lowercased(),
                            animated: guessToAnimate == .second ? true : false) {
                completion()
            }
        }
        if let thirdGuess = thirdGuess {
            updateThirdRow(guess: thirdGuess.lowercased(),
                           animated: guessToAnimate == .third ? true : false) {
                completion()
            }
        }
        if let fourthGuess = fourthGuess {
            updateFourthRow(guess: fourthGuess.lowercased(),
                            animated: guessToAnimate == .fourth ? true : false) {
                completion()
            }
        }
        if let fifthGuess = fifthGuess {
            updateFifthRow(guess: fifthGuess.lowercased(),
                           animated: guessToAnimate == .fifth ? true : false) {
                completion()
            }
        }
        if let sixthGuess = sixthGuess {
            updateSixthRow(guess: sixthGuess.lowercased(),
                           animated: guessToAnimate == .sixth ? true : false) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE FIRST ROW
    func updateFirstRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementCorrectLetterCounts(guess: guess) {
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
        incrementCorrectLetterCounts(guess: guess) {
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
        incrementCorrectLetterCounts(guess: guess) {
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
        incrementCorrectLetterCounts(guess: guess) {
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
        incrementCorrectLetterCounts(guess: guess) {
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
        incrementCorrectLetterCounts(guess: guess) {
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
    
    // MARK: - CHECK FIRST ROW
    private func checkFirstRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .a5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.firstGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased(), completion: {
            self.updateFirstRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        })
    }
    
    // MARK: - CHECK SECOND ROW
    private func checkSecondRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .b5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.secondGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSecondRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - CHECK THIRD ROW
    private func checkThirdRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .c5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.thirdGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateThirdRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - CHECK FOURTH ROW
    private func checkFourthRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .d5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.fourthGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFourthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - CHECK FIFTH ROW
    private func checkFifthRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .e5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.fifthGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFifthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - CHECK SIXTH ROW
    private func checkSixthRow(completion: @escaping () -> ()) {
        guard GameModel.shared.currentLetter == .f5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        keyboardView?.isUserInteractionEnabled = false
        GameModel.shared.sixthGuess = GameModel.shared.currentGuess.lowercased()
        incrementCorrectLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSixthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }



    
    // MARK: - CHECK ROWS
    private func checkRows(completion: @escaping () -> ()) {
        switch GameModel.shared.guessNumber {
        case .first:
            checkFirstRow { completion() }
        case .second:
            checkSecondRow { completion() }
        case .third:
            checkThirdRow { completion() }
        case .fourth:
            checkFourthRow { completion() }
        case .fifth:
            checkFifthRow { completion() }
        case .sixth:
            checkSixthRow { completion() }
        }
    }
    
    // MARK: - INCREMENT CORRECT LETTER COUNTS
    private func incrementCorrectLetterCounts(guess: String, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        
        for (letterIndex, letterCharacter) in guess.enumerated() {
            let letter = "\(letterCharacter)"
            
            if guess[letterIndex] == answer[letterIndex] {
                GameModel.shared.incrementGuessLetter(letter)
            }
        }
        completion()
    }
    
    // MARK: - UPDATE LETTER VIEW
    private func update(letterView: GridLetterView?, with guess: String?, at guessIndex: Int, animated: Bool, completion: @escaping () -> ()) {
        guard let answer = GameModel.shared.answer else { return }
        
        if let guess = guess {
            letterView?.updateLetter(with: "\(guess.uppercased()[guessIndex])")
        }
        
        let guess = guess?.lowercased() ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[guessIndex])".lowercased()

        // if first guessed letter is same as the word's first letter, make it green
        if guess[guessIndex] == answer[guessIndex] {
            letterView?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGreen(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟩"
            
            // if first guessed letter is not in word, make it gray
        } else if !answer.contains(guessLetter) {
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
                        
        } else if GameModel.shared.answerLetterCounts[guessLetter]! > GameModel.shared.guessCorrectLetterCounts[guessLetter]! {
            letterView?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToYellow(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟨"

        } else {
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            keyboardView?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
        }
    }
    
    // MARK: - UPDATE GRID
    private func updateA1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: a1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateA2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: a2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateA3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: a3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateA4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: a4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateA5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: a5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateB1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: b1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateB2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: b2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateB3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: b3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateB4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: b4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateB5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: b5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateC1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: c1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateC2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: c2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateC3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: c3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateC4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: c4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateC5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: c5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateD1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: d1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateD2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: d2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateD3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: d3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateD4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: d4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateD5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: d5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateE1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: e1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateE2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: e2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateE3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: e3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateE4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: e4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateE5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: e5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateF1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: f1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateF2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: f2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateF3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: f3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateF4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: f4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateF5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        update(letterView: f5, with: guess, at: 4, animated: animated) {
            completion()
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
        switch GameModel.shared.guessNumber {
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
        if GameModel.shared.guessNumber == .first {
            GameModel.shared.setAnswerRandomly()
        }
        return true
    }
    
    // MARK: - SLIDE KEYBOARD TO LEFT
    private func slideKeyboard(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveEaseIn) {
            self.keyboardView?.frame = Frame.Keyboard.hiddenFrame(self.frame)
        } completion: { _ in
            completion()
        }
    }
    
    // MARK: - DID TAP ENTER
    func didTapEnter() {
        guard GameModel.shared.currentGuess.count == 5 else { return }
        
        guard wordIsInList() else { return }
        
        self.checkRows {
            if GameModel.shared.currentGuess == GameModel.shared.answer {
                self.gridDelegate?.showSuccessView()
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
            
            self.slideKeyboard {
                self.gridDelegate?.showSendButton()
            }
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
