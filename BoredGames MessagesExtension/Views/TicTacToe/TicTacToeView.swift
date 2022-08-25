//
//  TicTacToeView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

protocol TicTacToeViewDelegate {
    func didTapSquareButton()
}

class TicTacToeView: UIView {
    
    // MARK: - Properties
    var ticTacToeViewDelegate: TicTacToeViewDelegate!
    var threeRowGridView = ThreeRowGridView(frame: .zero)
    private var threeRowGridConstraints: [NSLayoutConstraint] = []
    
    private var newGameButton = UIButton()
    private var newGameButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var newGameButtonLandscapeConstraints: [NSLayoutConstraint] = []
    var newGameButtonShowing = false

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addThreeRowGridView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        activateThreeRowGridConstraints(isLandscape: Model.shared.isLandscape)

        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - THREE ROW GRID
    private func addThreeRowGridView() {
        threeRowGridView.layer.borderColor = UIColor.red.cgColor
        threeRowGridView.layer.borderWidth = 2
        threeRowGridView.threeRowGridViewDelegate = self
        addSubview(threeRowGridView)
        activateThreeRowGridConstraints(isLandscape: false)
    }
    
    // MARK: - THREE ROW GRID CONSTRAINTS
    private func activateThreeRowGridConstraints(isLandscape: Bool) {
        let offset = Model.shared.appState == .ticTacToe && Model.shared.ticTacToeState == .grid ? 0 : -(UIScreen.main.bounds.width * 2)
        let girth = UIScreen.main.bounds.width - Frame.Logo.targetTallSize.width - (Frame.Logo.upperPadding * 2)
        let size = CGSize(width: girth, height: girth)
        NSLayoutConstraint.deactivate(threeRowGridConstraints)
        threeRowGridConstraints.removeAll()
        
        if isLandscape {
            threeRowGridConstraints = [
                threeRowGridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                threeRowGridView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.targetTallSize.width + Frame.Logo.upperPadding),
                threeRowGridView.widthAnchor.constraint(equalToConstant: size.width * 1.3),
                threeRowGridView.heightAnchor.constraint(equalToConstant: size.width * 1.3)
            ]
        } else {
            threeRowGridConstraints = [
                threeRowGridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                threeRowGridView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset),
                threeRowGridView.widthAnchor.constraint(equalToConstant: size.width),
                threeRowGridView.heightAnchor.constraint(equalToConstant: size.width)
            ]
        }
        NSLayoutConstraint.activate(threeRowGridConstraints)
    }
    
    func showNewGameButton() {
        newGameButtonShowing = true
//        if Model.shared.isLandscape {
//            activateNewGameButtonLandscapeConstraints()
//        } else {
//            activateNewGameButtonPortraitConstraints()
//        }
//        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
//            self.layoutIfNeeded()
//        } completion: { _ in
//        }
    }
    
    // MARK: - SHOW THE WIN
    func showTheWin(currentGame: TicTacToeGame, completion: @escaping () -> ()) {
                
        // update stats
        if let currentGame = TicTacToeModel.shared.currentTTTGame {
            TicTacToeModel.shared.updateGames(with: currentGame)
        }
        
//        showNewGameButton()

        threeRowGridView.jumpForJoy {
            completion()
        }
    }
    
    // MARK: - SHOW THE LOSS
    func showTheLoss(currentGame: TicTacToeGame, completion: @escaping () -> ()) {
        
        // update stats
        if let currentGame = TicTacToeModel.shared.currentTTTGame {
            TicTacToeModel.shared.updateGames(with: currentGame)
        }
        
//        showNewGameButton()
    }
}

extension TicTacToeView: ThreeRowGridViewDelegate {
    func didTapLetterView(sender: UIButton) {
        threeRowGridView.isUserInteractionEnabled = false
        
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }
        guard let turnNumber = currentGame.turnNumber else { return }
        
        let currentSquare = TicTacToeModel.shared.square(for: sender.tag)
        let emojiString = TicTacToeModel.shared.emojiString(for: turnNumber)
        
        // update model and label with move as emoji string
        switch currentSquare {
        case .a1:
            TicTacToeModel.shared.currentTTTGame?.a1 = emojiString
            threeRowGridView.a1.letterLabel.text = emojiString
        case .a2:
            TicTacToeModel.shared.currentTTTGame?.a2 = emojiString
            threeRowGridView.a2.letterLabel.text = emojiString
        case .a3:
            TicTacToeModel.shared.currentTTTGame?.a3 = emojiString
            threeRowGridView.a3.letterLabel.text = emojiString
        case .b1:
            TicTacToeModel.shared.currentTTTGame?.b1 = emojiString
            threeRowGridView.b1.letterLabel.text = emojiString
        case .b2:
            TicTacToeModel.shared.currentTTTGame?.b2 = emojiString
            threeRowGridView.b2.letterLabel.text = emojiString
        case .b3:
            TicTacToeModel.shared.currentTTTGame?.b3 = emojiString
            threeRowGridView.b3.letterLabel.text = emojiString
        case .c1:
            TicTacToeModel.shared.currentTTTGame?.c1 = emojiString
            threeRowGridView.c1.letterLabel.text = emojiString
        case .c2:
            TicTacToeModel.shared.currentTTTGame?.c2 = emojiString
            threeRowGridView.c2.letterLabel.text = emojiString
        case .c3:
            TicTacToeModel.shared.currentTTTGame?.c3 = emojiString
            threeRowGridView.c3.letterLabel.text = emojiString
        default:
            break
        }
        
        advanceTurnNumber(turnNumber)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.ticTacToeViewDelegate.didTapSquareButton()
        }
    }
    
    // MARK: - ADVANCE TURN NUMBER
    private func advanceTurnNumber(_ turnNumber: Turn) {
        switch turnNumber {
        case .first:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "second")
        case .second:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "third")
        case .third:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "fourth")
        case .fourth:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "fifth")
        case .fifth:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "sixth")
        case .sixth:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "seventh")
        case .seventh:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "eighth")
        case .eighth:
            TicTacToeModel.shared.currentTTTGame?.turnNumber = Turn(rawValue: "ninth")
        default: ()
        }
    }
}
