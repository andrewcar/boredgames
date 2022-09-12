//
//  ThreeRowGridView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

protocol ThreeRowGridViewDelegate {
    func didTapLetterView(sender: UIButton)
    func gameWon()
    func gameLost()
    func catsGame()
}

class ThreeRowGridView: UIView {
    
    // MARK: - Properties
    var threeRowGridViewDelegate: ThreeRowGridViewDelegate!
    var a1 = ThreeRowGridLetterView(frame: .zero)
    var a2 = ThreeRowGridLetterView(frame: .zero)
    var a3 = ThreeRowGridLetterView(frame: .zero)
    var b1 = ThreeRowGridLetterView(frame: .zero)
    var b2 = ThreeRowGridLetterView(frame: .zero)
    var b3 = ThreeRowGridLetterView(frame: .zero)
    var c1 = ThreeRowGridLetterView(frame: .zero)
    var c2 = ThreeRowGridLetterView(frame: .zero)
    var c3 = ThreeRowGridLetterView(frame: .zero)
    private var letterViewConstraints: [NSLayoutConstraint] = []
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let heavyImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addLetterViews()
    }
    
    // MARK: - UPDATE SQUARES FROM MESSAGE
    func updateSquaresFromMessage(
        a1: String?,
        a2: String?,
        a3: String?,
        b1: String?,
        b2: String?,
        b3: String?,
        c1: String?,
        c2: String?,
        c3: String?,
        completion: @escaping (TTTGameState) -> ()) {
        
        if let move = a1 {
            updateLetterView(self.a1, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = a2 {
            updateLetterView(self.a2, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = a3 {
            updateLetterView(self.a3, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = b1 {
            updateLetterView(self.b1, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = b2 {
            updateLetterView(self.b2, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = b3 {
            updateLetterView(self.b3, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = c1 {
            updateLetterView(self.c1, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = c2 {
            updateLetterView(self.c2, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        if let move = c3 {
            updateLetterView(self.c3, with: move, animated: false) { gameState in
                if gameState == .someoneWon || gameState == .catsGame {
                    completion(gameState)
                }
            }
        }
        completion(.playing)
    }
    
    // MARK: - CATS GAME
    private func wasCatsGame() -> Bool {
        // if any letter view letter label texts are empty, the game isn't over, so no cats game
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return false }
        guard let a1 = currentGame.a1 else { return false }
        guard let a2 = currentGame.a2 else { return false }
        guard let a3 = currentGame.a3 else { return false }
        guard let b1 = currentGame.b1 else { return false }
        guard let b2 = currentGame.b2 else { return false }
        guard let b3 = currentGame.b3 else { return false }
        guard let c1 = currentGame.c1 else { return false }
        guard let c2 = currentGame.c2 else { return false }
        guard let c3 = currentGame.c3 else { return false }

        let allLetterViews = [a1, a2, a3, b1, b2, b3, c1, c2, c3]
        let blankLetterViews = allLetterViews.filter {
            guard $0.isEmpty else { return false }
            return true
        }
        
        // if none of the label texts were empty, cats game
        // because this is used after all path checks
        return blankLetterViews.isEmpty
    }
    
    // MARK: - UPDATE LETTER VIEW
    private func updateLetterView(_ letterView: ThreeRowGridLetterView?, with move: String?, animated: Bool, completion: @escaping (TTTGameState) -> ()) {
        guard let ticTacToeMove = move else { completion(.playing); return }
        guard let move = TTTMove(rawValue: ticTacToeMove) else { completion(.playing); return }
        
        letterView?.updateLetter(with: ticTacToeMove)
        
        guard let square = letterView?.square else { completion(.playing); return }
                
        switch square {
        case .a1:
            topHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.leftVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)

                    self.backslashWin(square: square, move: move) { win in
                        decideFate(from: win)
                    }
                }
            }
        case .a2:
            topHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.middleVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)
                }
            }
        case .a3:
            topHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.rightVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)

                    self.forwardSlashWin(square: square, move: move) { win in
                        decideFate(from: win)
                    }
                }
            }
        case .b1:
            leftVerticalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.middleHorizontalWin(square: square, move: move) { win in
                    decideFate(from: win)
                }
            }
        case .b2:
            middleHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.middleVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)

                    self.backslashWin(square: square, move: move) { win in
                        decideFate(from: win)

                        self.forwardSlashWin(square: square, move: move) { win in
                            decideFate(from: win)
                        }
                    }
                }
            }
        case .b3:
            middleHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.rightVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)
                }
            }
        case .c1:
            bottomHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.leftVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)

                    self.forwardSlashWin(square: square, move: move) { win in
                        decideFate(from: win)
                    }
                }
            }
        case .c2:
            bottomHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.middleVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)
                }
            }
        case .c3:
            bottomHorizontalWin(square: square, move: move) { win in
                decideFate(from: win)

                self.rightVerticalWin(square: square, move: move) { win in
                    decideFate(from: win)

                    self.backslashWin(square: square, move: move) { win in
                        decideFate(from: win)
                    }
                }
            }
        }
        
        func decideFate(from win: Bool) {
            if win {
                completion(.someoneWon)
            } else if self.wasCatsGame() {
                self.threeRowGridViewDelegate.catsGame()
                completion(.catsGame)
            } else {
                completion(.playing)
            }
        }
    }
    
    // a1, a2, a3
    private func topHorizontalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a1 = currentGame.a1 else { completion(false); return }
        guard let a2 = currentGame.a2 else { completion(false); return }
        guard let a3 = currentGame.a3 else { completion(false); return }
        switch square {
        case .a1:
            if move.rawValue == a2,
                move.rawValue == a3 {
                completion(true)
            }
        case .a2:
            if move.rawValue == a1,
                move.rawValue == a3 {
                completion(true)
            }
        case .a3:
            if move.rawValue == a1,
                move.rawValue == a2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // b1, b2, b3
    private func middleHorizontalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let b1 = currentGame.b1 else { completion(false); return }
        guard let b2 = currentGame.b2 else { completion(false); return }
        guard let b3 = currentGame.b3 else { completion(false); return }
        switch square {
        case .b1:
            if move.rawValue == b2,
                move.rawValue == b3 {
                completion(true)
            }
        case .b2:
            if move.rawValue == b1,
                move.rawValue == b3 {
                completion(true)
            }
        case .b3:
            if move.rawValue == b1,
                move.rawValue == b2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // c1, c2, c3
    private func bottomHorizontalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let c1 = currentGame.c1 else { completion(false); return }
        guard let c2 = currentGame.c2 else { completion(false); return }
        guard let c3 = currentGame.c3 else { completion(false); return }
        switch square {
        case .c1:
            if move.rawValue == c2,
                move.rawValue == c3 {
                completion(true)
            }
        case .c2:
            if move.rawValue == c1,
                move.rawValue == c3 {
                completion(true)
            }
        case .c3:
            if move.rawValue == c1,
                move.rawValue == c2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // a1, b1, c1
    private func leftVerticalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a1 = currentGame.a1 else { completion(false); return }
        guard let b1 = currentGame.b1 else { completion(false); return }
        guard let c1 = currentGame.c1 else { completion(false); return }
        switch square {
        case .a1:
            if move.rawValue == b1,
                move.rawValue == c1 {
                completion(true)
            }
        case .b1:
            if move.rawValue == a1,
                move.rawValue == c1 {
                completion(true)
            }
        case .c1:
            if move.rawValue == a1,
                move.rawValue == b1 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // a2, b2, c2
    private func middleVerticalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a2 = currentGame.a2 else { completion(false); return }
        guard let b2 = currentGame.b2 else { completion(false); return }
        guard let c2 = currentGame.c2 else { completion(false); return }
        switch square {
        case .a2:
            if move.rawValue == b2,
                move.rawValue == c2 {
                completion(true)
            }
        case .b2:
            if move.rawValue == a2,
                move.rawValue == c2 {
                completion(true)
            }
        case .c2:
            if move.rawValue == a2,
                move.rawValue == b2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // a3, b3, c3
    private func rightVerticalWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a3 = currentGame.a3 else { completion(false); return }
        guard let b3 = currentGame.b3 else { completion(false); return }
        guard let c3 = currentGame.c3 else { completion(false); return }
        switch square {
        case .a3:
            if move.rawValue == b3,
                move.rawValue == c3 {
                completion(true)
            }
        case .b3:
            if move.rawValue == a3,
                move.rawValue == c3 {
                completion(true)
            }
        case .c3:
            if move.rawValue == a3,
                move.rawValue == b3 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // a1, b2, c3
    private func backslashWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a1 = currentGame.a1 else { completion(false); return }
        guard let b2 = currentGame.b2 else { completion(false); return }
        guard let c3 = currentGame.c3 else { completion(false); return }
        switch square {
        case .a1:
            if move.rawValue == b2,
                move.rawValue == c3 {
                completion(true)
            }
        case .b2:
            if move.rawValue == a1,
                move.rawValue == c3 {
                completion(true)
            }
        case .c3:
            if move.rawValue == a1,
                move.rawValue == b2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // a3, b2, c1
    private func forwardSlashWin(square: TicTacToeSquare, move: TTTMove, completion: @escaping (Bool) -> ()) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { completion(false); return }
        guard let a3 = currentGame.a3 else { completion(false); return }
        guard let b2 = currentGame.b2 else { completion(false); return }
        guard let c1 = currentGame.c1 else { completion(false); return }
        switch square {
        case .a3:
            if move.rawValue == b2,
                move.rawValue == c1 {
                completion(true)
            }
        case .b2:
            if move.rawValue == a3,
                move.rawValue == c1 {
                completion(true)
            }
        case .c1:
            if move.rawValue == a3,
                move.rawValue == b2 {
                completion(true)
            }
        default:
            completion(false)
        }
        completion(false)
    }
    
    // MARK: - JUMP FOR JOY
    func jumpForJoy(completion: @escaping () -> ()) {
        a1.jumpForJoy() {
            self.selectionFeedbackGenerator.selectionChanged()
        }
        a2.jumpForJoy(delay: 0.1) {
            self.selectionFeedbackGenerator.selectionChanged()
        }
        a3.jumpForJoy(delay: 0.2) {
            self.selectionFeedbackGenerator.selectionChanged()
        }
        
        b1.jumpForJoy() {}
        b2.jumpForJoy(delay: 0.1) {}
        b3.jumpForJoy(delay: 0.2) {}
        
        c1.jumpForJoy() {}
        c2.jumpForJoy(delay: 0.1) {}
        c3.jumpForJoy(delay: 0.2) {
            completion()
        }
    }
    
    // MARK: - LETTER VIEWS
    private func addLetterViews() {
        for letterView in [a1, a2, a3, b1, b2, b3, c1, c2, c3] {
            letterView.letterViewDelegate = self
            addSubview(letterView)
        }
        setLetterViewButtonTags()
    }
    
    // MARK: - LETTER VIEW BUTTON TAGS
    private func setLetterViewButtonTags() {
        a1.button.tag = TicTacToeModel.shared.tag(for: .a1)
        a1.square = .a1
        
        a2.button.tag = TicTacToeModel.shared.tag(for: .a2)
        a2.square = .a2
        
        a3.button.tag = TicTacToeModel.shared.tag(for: .a3)
        a3.square = .a3

        b1.button.tag = TicTacToeModel.shared.tag(for: .b1)
        b1.square = .b1

        b2.button.tag = TicTacToeModel.shared.tag(for: .b2)
        b2.square = .b2

        b3.button.tag = TicTacToeModel.shared.tag(for: .b3)
        b3.square = .b3

        c1.button.tag = TicTacToeModel.shared.tag(for: .c1)
        c1.square = .c1

        c2.button.tag = TicTacToeModel.shared.tag(for: .c2)
        c2.square = .c2

        c3.button.tag = TicTacToeModel.shared.tag(for: .c3)
        c3.square = .c3
    }
        
    // MARK: - GRID CONSTRAINTS
    func activateGridConstraints(isLandscape: Bool) {
        let girth = Frame.Grid.ticTacToeSquareGirth(isLandscape: isLandscape)
        NSLayoutConstraint.deactivate(letterViewConstraints)
        letterViewConstraints = [
            a1.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            a1.widthAnchor.constraint(equalToConstant: girth),
            a1.heightAnchor.constraint(equalToConstant: girth),
            
            a2.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a2.leadingAnchor.constraint(equalTo: a1.trailingAnchor, constant: Frame.padding),
            a2.widthAnchor.constraint(equalToConstant: girth),
            a2.heightAnchor.constraint(equalToConstant: girth),
            
            a3.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: Frame.padding),
            a3.widthAnchor.constraint(equalToConstant: girth),
            a3.heightAnchor.constraint(equalToConstant: girth),
            
            b1.topAnchor.constraint(equalTo: a1.bottomAnchor, constant: Frame.padding),
            b1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            b1.widthAnchor.constraint(equalToConstant: girth),
            b1.heightAnchor.constraint(equalToConstant: girth),
            
            b2.topAnchor.constraint(equalTo: a2.bottomAnchor, constant: Frame.padding),
            b2.leadingAnchor.constraint(equalTo: b1.trailingAnchor, constant: Frame.padding),
            b2.widthAnchor.constraint(equalToConstant: girth),
            b2.heightAnchor.constraint(equalToConstant: girth),
            
            b3.topAnchor.constraint(equalTo: a3.bottomAnchor, constant: Frame.padding),
            b3.leadingAnchor.constraint(equalTo: b2.trailingAnchor, constant: Frame.padding),
            b3.widthAnchor.constraint(equalToConstant: girth),
            b3.heightAnchor.constraint(equalToConstant: girth),
            
            c1.topAnchor.constraint(equalTo: b1.bottomAnchor, constant: Frame.padding),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            c1.widthAnchor.constraint(equalToConstant: girth),
            c1.heightAnchor.constraint(equalToConstant: girth),
            
            c2.topAnchor.constraint(equalTo: b2.bottomAnchor, constant: Frame.padding),
            c2.leadingAnchor.constraint(equalTo: c1.trailingAnchor, constant: Frame.padding),
            c2.widthAnchor.constraint(equalToConstant: girth),
            c2.heightAnchor.constraint(equalToConstant: girth),
            
            c3.topAnchor.constraint(equalTo: b3.bottomAnchor, constant: Frame.padding),
            c3.leadingAnchor.constraint(equalTo: c2.trailingAnchor, constant: Frame.padding),
            c3.widthAnchor.constraint(equalToConstant: girth),
            c3.heightAnchor.constraint(equalToConstant: girth)
        ]
        NSLayoutConstraint.activate(letterViewConstraints)
    }
    
    // MARK: - RESET ROWS
    func resetRows() {
        for gridLetter in [a1, a2, a3, b1, b2, b3, c1, c2, c3] {
            gridLetter.updateLetter(with: "")
//            gridLetter.setBorderInactive()
        }
    }
}

extension ThreeRowGridView: ThreeRowGridLetterViewDelegate {
    func didTapButton(sender: UIButton) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }
        guard let turnNumber = currentGame.turnNumber else { return }
        let letterView = letterView(for: TicTacToeModel.shared.square(for: sender.tag))
        let symbolString = TicTacToeModel.shared.symbolString(for: turnNumber)
        
        heavyImpactFeedbackGenerator.impactOccurred()

        threeRowGridViewDelegate.didTapLetterView(sender: sender)
        updateLetterView(letterView, with: symbolString, animated: false) { gameState in
            if gameState == .someoneWon {
                self.threeRowGridViewDelegate.gameWon()
            } else if gameState == .catsGame {
                self.threeRowGridViewDelegate.catsGame()
            }
        }
    }
    
    private func letterView(for square: TicTacToeSquare) -> ThreeRowGridLetterView {
        switch square {
        case .a1:
            return a1
        case .a2:
            return a2
        case .a3:
            return a3
        case .b1:
            return b1
        case .b2:
            return b2
        case .b3:
            return b3
        case .c1:
            return c1
        case .c2:
            return c2
        case .c3:
            return c3
        }
    }
}
