//
//  ThreeRowGridView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

protocol ThreeRowGridViewDelegate {
    func didTapLetterView(sender: UIButton)
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
    
    private var leftVerticalDottedLine = DottedLineView(frame: .zero)
    private var rightVerticalDottedLine = DottedLineView(frame: .zero)
    private var topHorizontalDottedLine = DottedLineView(frame: .zero)
    private var bottomHorizontalDottedLine = DottedLineView(frame: .zero)
    private var dottedLineConstraints: [NSLayoutConstraint] = []
    
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()

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
        activateGridConstraints()
        addDottedLines()
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
        completion: @escaping (GameState) -> ()) {
            
            if let move = a1 {
                updateLetterView(self.a1, with: move, animated: true) {
                    //
                }
            }
            if let move = a2 {
                updateLetterView(self.a2, with: move, animated: true) {
                    //
                }
            }
            if let move = a3 {
                updateLetterView(self.a3, with: move, animated: true) {
                    //
                }
            }
            if let move = b1 {
                updateLetterView(self.b1, with: move, animated: true) {
                    //
                }
            }
            if let move = b2 {
                updateLetterView(self.b2, with: move, animated: true) {
                    //
                }
            }
            if let move = b3 {
                updateLetterView(self.b3, with: move, animated: true) {
                    //
                }
            }
            if let move = c1 {
                updateLetterView(self.c1, with: move, animated: true) {
                    //
                }
            }
            if let move = c2 {
                updateLetterView(self.c2, with: move, animated: true) {
                    //
                }
            }
            if let move = c3 {
                updateLetterView(self.c3, with: move, animated: true) {
                    //
                }
            }
        }
    
    // MARK: - UPDATE LETTER VIEW
    private func updateLetterView(_ letterView: ThreeRowGridLetterView?, with move: String?, animated: Bool, completion: @escaping () -> ()) {
        if let move = move {
            letterView?.updateLetter(with: move)
        }
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
        a2.button.tag = TicTacToeModel.shared.tag(for: .a2)
        a3.button.tag = TicTacToeModel.shared.tag(for: .a3)
        b1.button.tag = TicTacToeModel.shared.tag(for: .b1)
        b2.button.tag = TicTacToeModel.shared.tag(for: .b2)
        b3.button.tag = TicTacToeModel.shared.tag(for: .b3)
        c1.button.tag = TicTacToeModel.shared.tag(for: .c1)
        c2.button.tag = TicTacToeModel.shared.tag(for: .c2)
        c3.button.tag = TicTacToeModel.shared.tag(for: .c3)
    }
    
    // MARK: - DOTTED LINES
    private func addDottedLines() {
        for dottedLine in [leftVerticalDottedLine, rightVerticalDottedLine, topHorizontalDottedLine, bottomHorizontalDottedLine] {
            dottedLine.translatesAutoresizingMaskIntoConstraints = false
            addSubview(dottedLine)
        }
        activateDottedLinesConstraints()
    }
    
    // MARK: - ACTIVATE DOTTED LINES CONSTRAINTS
    private func activateDottedLinesConstraints() {
        deactivateDottedLinesConstraints()
        let squareGirth = Frame.Grid.ticTacToeGirth / 3
        dottedLineConstraints = [
            leftVerticalDottedLine.topAnchor.constraint(equalTo: topAnchor),
            leftVerticalDottedLine.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -(squareGirth / 2)),
            leftVerticalDottedLine.widthAnchor.constraint(equalToConstant: 2),
            leftVerticalDottedLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightVerticalDottedLine.topAnchor.constraint(equalTo: topAnchor),
            rightVerticalDottedLine.centerXAnchor.constraint(equalTo: centerXAnchor, constant: squareGirth / 2),
            rightVerticalDottedLine.widthAnchor.constraint(equalToConstant: 2),
            rightVerticalDottedLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topHorizontalDottedLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            topHorizontalDottedLine.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(squareGirth / 2)),
            topHorizontalDottedLine.heightAnchor.constraint(equalToConstant: 2),
            topHorizontalDottedLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomHorizontalDottedLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomHorizontalDottedLine.centerYAnchor.constraint(equalTo: centerYAnchor, constant: squareGirth / 2),
            bottomHorizontalDottedLine.heightAnchor.constraint(equalToConstant: 2),
            bottomHorizontalDottedLine.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]
        NSLayoutConstraint.activate(dottedLineConstraints)
    }
    
    // MARK: - DEACTIVATE DOTTED LINES CONSTRAINTS
    private func deactivateDottedLinesConstraints() {
        NSLayoutConstraint.deactivate(dottedLineConstraints)
        dottedLineConstraints.removeAll()
    }
    
    // MARK: - GRID CONSTRAINTS
    private func activateGridConstraints() {
        let size = CGSize(width: Frame.Grid.ticTacToeGirth / 3, height: Frame.Grid.ticTacToeGirth / 3)
        NSLayoutConstraint.deactivate(letterViewConstraints)
        letterViewConstraints = [
            a1.topAnchor.constraint(equalTo: topAnchor),
            a1.leadingAnchor.constraint(equalTo: leadingAnchor),
            a1.widthAnchor.constraint(equalToConstant: size.width),
            a1.heightAnchor.constraint(equalToConstant: size.height),
            
            a2.topAnchor.constraint(equalTo: topAnchor),
            a2.leadingAnchor.constraint(equalTo: a1.trailingAnchor),
            a2.widthAnchor.constraint(equalToConstant: size.width),
            a2.heightAnchor.constraint(equalToConstant: size.height),
            
            a3.topAnchor.constraint(equalTo: topAnchor),
            a3.leadingAnchor.constraint(equalTo: a2.trailingAnchor),
            a3.widthAnchor.constraint(equalToConstant: size.width),
            a3.heightAnchor.constraint(equalToConstant: size.height),
            
            b1.topAnchor.constraint(equalTo: a1.bottomAnchor),
            b1.leadingAnchor.constraint(equalTo: leadingAnchor),
            b1.widthAnchor.constraint(equalToConstant: size.width),
            b1.heightAnchor.constraint(equalToConstant: size.height),
            
            b2.topAnchor.constraint(equalTo: a2.bottomAnchor),
            b2.leadingAnchor.constraint(equalTo: b1.trailingAnchor),
            b2.widthAnchor.constraint(equalToConstant: size.width),
            b2.heightAnchor.constraint(equalToConstant: size.height),
            
            b3.topAnchor.constraint(equalTo: a3.bottomAnchor),
            b3.leadingAnchor.constraint(equalTo: b2.trailingAnchor),
            b3.widthAnchor.constraint(equalToConstant: size.width),
            b3.heightAnchor.constraint(equalToConstant: size.height),
            
            c1.topAnchor.constraint(equalTo: b1.bottomAnchor),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor),
            c1.widthAnchor.constraint(equalToConstant: size.width),
            c1.heightAnchor.constraint(equalToConstant: size.height),
            
            c2.topAnchor.constraint(equalTo: b2.bottomAnchor),
            c2.leadingAnchor.constraint(equalTo: c1.trailingAnchor),
            c2.widthAnchor.constraint(equalToConstant: size.width),
            c2.heightAnchor.constraint(equalToConstant: size.height),
            
            c3.topAnchor.constraint(equalTo: b3.bottomAnchor),
            c3.leadingAnchor.constraint(equalTo: c2.trailingAnchor),
            c3.widthAnchor.constraint(equalToConstant: size.width),
            c3.heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(letterViewConstraints)
    }
}

extension ThreeRowGridView: ThreeRowGridLetterViewDelegate {
    func didTapButton(sender: UIButton) {
        threeRowGridViewDelegate.didTapLetterView(sender: sender)
    }
}
