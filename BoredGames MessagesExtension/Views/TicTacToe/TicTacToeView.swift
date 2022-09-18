//
//  TicTacToeView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

protocol TicTacToeViewDelegate {
    func didTapTTTSquareButton()
    func didTapTTTStatsButton()
    func didTapTTTGridButton()
    func showTheWin()
    func showTheLoss()
    func showCatsGame()
}

class TicTacToeView: UIView {
    
    // MARK: - Properties
    var ticTacToeViewDelegate: TicTacToeViewDelegate!
    var threeRowGridView = ThreeRowGridView(frame: .zero)
    private var threeRowGridConstraints: [NSLayoutConstraint] = []
    
    private var successView = SuccessView(frame: .zero)
    private var successPortraitConstraints: [NSLayoutConstraint] = []
    private var successLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var newGameButton = UIButton(frame: .zero)
    private var newGameButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var newGameButtonLandscapeConstraints: [NSLayoutConstraint] = []
    var newGameButtonShowing = false
    
    private var statsButton = UIButton(frame: .zero)
    private var statsButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var statsButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var gridButton = UIButton(frame: .zero)
    private var gridButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var gridButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var statsView = TTTStatsView(frame: .zero)
    private var statsViewPortraitConstraints: [NSLayoutConstraint] = []
    private var statsViewLandscapeConstraints: [NSLayoutConstraint] = []


    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addThreeRowGridView()
        addSuccessView()
        addNewGameButton()
        addStatsButton()
        addStatsView()
        addGridButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        activateThreeRowGridConstraints(isLandscape: Model.shared.isLandscape)
        activateSuccessConstraints(isLandscape: Model.shared.isLandscape)
        activateNewGameButtonConstraints(isLandscape: Model.shared.isLandscape)
        activateStatsButtonConstraints(isLandscape: Model.shared.isLandscape)
        statsView.updateConstraints()
        activateStatsViewConstraints(isLandscape: Model.shared.isLandscape)
        activateGridButtonConstraints(isLandscape: Model.shared.isLandscape)

        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - THREE ROW GRID
    private func addThreeRowGridView() {
        threeRowGridView.threeRowGridViewDelegate = self
        addSubview(threeRowGridView)
        activateThreeRowGridConstraints(isLandscape: false)
    }
    
    // MARK: - THREE ROW GRID CONSTRAINTS
    private func activateThreeRowGridConstraints(isLandscape: Bool) {
        let offset = Model.shared.appState == .ticTacToe && TicTacToeModel.shared.ticTacToeState == .grid ? 0 : -(UIScreen.main.bounds.width * 2)
        deactivateGridConstraints()
        
        if isLandscape {
            threeRowGridConstraints = [
                threeRowGridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                threeRowGridView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
                threeRowGridView.widthAnchor.constraint(equalToConstant: Frame.Grid.ticTacToeGridGirth(isLandscape: true)),
                threeRowGridView.heightAnchor.constraint(equalToConstant: Frame.Grid.ticTacToeGridGirth(isLandscape: true))
            ]
        } else {
            threeRowGridConstraints = [
                threeRowGridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.targetTallSize.height + (Frame.Logo.upperPadding * 2)),
                threeRowGridView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
                threeRowGridView.widthAnchor.constraint(equalToConstant: Frame.Grid.ticTacToeGridGirth(isLandscape: false)),
                threeRowGridView.heightAnchor.constraint(equalToConstant: Frame.Grid.ticTacToeGridGirth(isLandscape: false))
            ]
        }
        NSLayoutConstraint.activate(threeRowGridConstraints)
        
        threeRowGridView.activateGridConstraints(isLandscape: isLandscape)
    }
    
    // MARK: - DEACTIVATE GRID CONSTRAINTS
    private func deactivateGridConstraints() {
        NSLayoutConstraint.deactivate(threeRowGridConstraints)
        threeRowGridConstraints.removeAll()
    }
    
    func showNewGameButton() {
        newGameButtonShowing = true
        activateNewGameButtonConstraints(isLandscape: Model.shared.isLandscape)
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - STATS BUTTON
    private func addStatsButton() {
        statsButton.translatesAutoresizingMaskIntoConstraints = false
        statsButton.addTarget(self, action: #selector(didTapStatsButton(sender:)), for: .touchUpInside)
        statsButton.setImage(statsButtonImage(), for: .normal)
        statsButton.setTitleColor(.clear, for: .normal)
        addSubview(statsButton)
        activateStatsButtonConstraints(isLandscape: false)
    }
    
    // MARK: - UPDATE STATS BUTTON
    private func updateStatsButton(isLandscape: Bool) {
        activateStatsButtonConstraints(isLandscape: isLandscape)
        statsButton.setImage(statsButtonImage(), for: .normal)
    }
    
    // MARK: - STATS BUTTON IMAGE
    private func statsButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "books.vertical.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .fiveLetterGuessButton)
    }
    
    // MARK: - STATS BUTTON CONSTRAINTS
    private func activateStatsButtonConstraints(isLandscape: Bool) {
        deactivateStatsButtonConstraints()
        let offset = Model.shared.appState == .ticTacToe && TicTacToeModel.shared.ticTacToeState == .grid ? 0 : (UIScreen.main.bounds.width * 2)
        if isLandscape {
            statsButtonLandscapeConstraints = [
                statsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                statsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                statsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding),
                statsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
            ]
            NSLayoutConstraint.activate(statsButtonLandscapeConstraints)
        } else {
            statsButtonPortraitConstraints = [
                statsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                statsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                statsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(Frame.Logo.upperPadding * 2)),
                statsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
            ]
            NSLayoutConstraint.activate(statsButtonPortraitConstraints)
        }
    }
    
    // MARK: - DID TAP STATS BUTTON
    @objc
    private func didTapStatsButton(sender: UIButton) {
        TicTacToeModel.shared.ticTacToeState = .stats
        statsView.isHidden = false
        ticTacToeViewDelegate.didTapTTTStatsButton()
        updateConstraints()
    }
    
    // MARK: - DEACTIVATE STATS BUTTON CONSTRAINTS
    private func deactivateStatsButtonConstraints() {
        NSLayoutConstraint.deactivate(statsButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(statsButtonLandscapeConstraints)
        statsButtonPortraitConstraints.removeAll()
        statsButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - GRID BUTTON
    private func addGridButton() {
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        gridButton.addTarget(self, action: #selector(didTapGridButton(sender:)), for: .touchUpInside)
        gridButton.setImage(gridButtonImage(), for: .normal)
        gridButton.setTitleColor(.clear, for: .normal)
        addSubview(gridButton)
        activateGridButtonConstraints(isLandscape: false)
    }
    
    // MARK: - UPDATE GRID BUTTON
    private func updateGridButton(isLandscape: Bool) {
        activateGridButtonConstraints(isLandscape: isLandscape)
        gridButton.setImage(gridButtonImage(), for: .normal)
    }
    
    // MARK: - GRID BUTTON IMAGE
    private func gridButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "gamecontroller.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .fiveLetterGuessButton)
    }
    
    // MARK: - GRID BUTTON CONSTRAINTS
    private func activateGridButtonConstraints(isLandscape: Bool) {
        deactivateGridButtonConstraints()
        let offset = TicTacToeModel.shared.ticTacToeState == .stats ? 0 : UIScreen.main.bounds.width * 2
        if isLandscape {
            gridButtonLandscapeConstraints = [
                gridButton.centerYAnchor.constraint(equalTo: statsButton.centerYAnchor),
                gridButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                gridButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                gridButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
            ]
            NSLayoutConstraint.activate(gridButtonLandscapeConstraints)
        } else {
            gridButtonPortraitConstraints = [
                gridButton.centerYAnchor.constraint(equalTo: statsButton.centerYAnchor),
                gridButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                gridButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                gridButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
            ]
            NSLayoutConstraint.activate(gridButtonPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE GRID BUTTON CONSTRAINTS
    private func deactivateGridButtonConstraints() {
        NSLayoutConstraint.deactivate(gridButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(gridButtonLandscapeConstraints)
    }
    
    // MARK: - DID TAP GRID BUTTON
    @objc
    private func didTapGridButton(sender: UIButton) {
        TicTacToeModel.shared.ticTacToeState = .grid
        statsView.isHidden = true
        ticTacToeViewDelegate.didTapTTTGridButton()
        updateConstraints()
    }
    
    // MARK: - NEW GAME BUTTON
    private func addNewGameButton() {
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.addTarget(self, action: #selector(didTapNewGameButton(sender:)), for: .touchUpInside)
        newGameButton.setImage(newGameButtonImage(), for: .normal)
        newGameButton.setTitleColor(.clear, for: .normal)
        addSubview(newGameButton)
        activateNewGameButtonConstraints(isLandscape: false)
    }
    
    // MARK: - UPDATE NEW GAME BUTTON
    private func updateNewGameButton(isLandscape: Bool) {
        activateNewGameButtonConstraints(isLandscape: isLandscape)
        newGameButton.setImage(newGameButtonImage(), for: .normal)
    }
    
    // MARK: - NEW GAME BUTTON IMAGE
    private func newGameButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "arrow.clockwise.circle.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .fiveLetterGuessButton)
    }
    
    // MARK: - NEW GAME BUTTON CONSTRAINTS
    private func activateNewGameButtonConstraints(isLandscape: Bool) {
        deactivateNewGameButtonConstraints()
        let offset = TicTacToeModel.shared.ticTacToeState == .grid && newGameButtonShowing ? 0 : (UIScreen.main.bounds.width * 2)
        if isLandscape {
            newGameButtonLandscapeConstraints = [
                newGameButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                newGameButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                newGameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding),
                newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
            ]
            NSLayoutConstraint.activate(newGameButtonLandscapeConstraints)
        } else {
            newGameButtonPortraitConstraints = [
                newGameButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                newGameButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                newGameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(Frame.Logo.upperPadding * 2)),
                newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
            ]
            NSLayoutConstraint.activate(newGameButtonPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE NEW GAME BUTTON CONSTRAINTS
    private func deactivateNewGameButtonConstraints() {
        NSLayoutConstraint.deactivate(newGameButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(newGameButtonLandscapeConstraints)
        newGameButtonPortraitConstraints.removeAll()
        newGameButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP NEW GAME BUTTON
    @objc
    private func didTapNewGameButton(sender: UIButton) {
        resetGame()
        updateConstraints()
    }
    
    // MARK: - SUCCESS VIEW
    private func addSuccessView() {
        addSubview(successView)
        activateSuccessConstraints(isLandscape: false)
    }
    
    // MARK: - SUCCESS CONSTRAINTS
    private func activateSuccessConstraints(isLandscape: Bool) {
        deactivateSuccessConstraints()
        let offset = TicTacToeModel.shared.ticTacToeState == .grid ? 0 : -UIScreen.main.bounds.width
        if isLandscape {
            successLandscapeConstraints = [
                successView.topAnchor.constraint(equalTo: threeRowGridView.bottomAnchor, constant: Frame.padding + offset),
                successView.centerXAnchor.constraint(equalTo: threeRowGridView.centerXAnchor),
                successView.widthAnchor.constraint(equalToConstant: Frame.Success.size.width),
                successView.heightAnchor.constraint(equalToConstant: Frame.Success.size.height)
            ]
            NSLayoutConstraint.activate(successLandscapeConstraints)
        } else {
            successPortraitConstraints = [
                successView.topAnchor.constraint(equalTo: threeRowGridView.bottomAnchor, constant: Frame.padding * 3),
                successView.centerXAnchor.constraint(equalTo: threeRowGridView.centerXAnchor, constant: offset),
                successView.widthAnchor.constraint(equalToConstant: Frame.Success.size.width),
                successView.heightAnchor.constraint(equalToConstant: Frame.Success.size.height)
            ]
            NSLayoutConstraint.activate(successPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE SUCCESS CONSTRAINTS
    private func deactivateSuccessConstraints() {
        NSLayoutConstraint.deactivate(successPortraitConstraints)
        NSLayoutConstraint.deactivate(successLandscapeConstraints)
    }
    
    // MARK: - STATS VIEW
    private func addStatsView() {
        statsView.isHidden = true
        addSubview(statsView)
        activateStatsViewConstraints(isLandscape: false)
    }
    
    // MARK: - STATS VIEW CONSTRAINTS
    private func activateStatsViewConstraints(isLandscape: Bool) {
        deactivateStatsViewConstraints()
        if isLandscape {
            let offset = Model.shared.appState == .ticTacToe && TicTacToeModel.shared.ticTacToeState == .stats ? 0 : Model.shared.appState == .container ? -(UIScreen.main.bounds.width * 2) : UIScreen.main.bounds.width * 3
            statsViewLandscapeConstraints = [
                statsView.topAnchor.constraint(equalTo: topAnchor),
                statsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                statsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset),
                statsView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
            NSLayoutConstraint.activate(statsViewLandscapeConstraints)
        } else {
            let offset = Model.shared.appState == .ticTacToe && TicTacToeModel.shared.ticTacToeState == .stats ? 0 : Model.shared.appState == .container ? -(UIScreen.main.bounds.width * 2) : UIScreen.main.bounds.width * 3
            statsViewPortraitConstraints = [
                statsView.topAnchor.constraint(equalTo: topAnchor),
                statsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                statsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset),
                statsView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
            NSLayoutConstraint.activate(statsViewPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE STATS VIEW CONSTRAINTS
    private func deactivateStatsViewConstraints() {
        NSLayoutConstraint.deactivate(statsViewPortraitConstraints)
        NSLayoutConstraint.deactivate(statsViewLandscapeConstraints)
        statsViewPortraitConstraints.removeAll()
        statsViewLandscapeConstraints.removeAll()
    }
    
    // MARK: - SHOW THE WIN
    func showTheWin(currentGame: TicTacToeGame, completion: @escaping () -> ()) {
        showSuccessView()
        showNewGameButton()
        threeRowGridView.jumpForJoy {
            self.updateConstraints()
            completion()
        }
    }
    
    // MARK: - SHOW THE LOSS
    func showTheLoss(currentGame: TicTacToeGame, completion: @escaping () -> ()) {
        showSuccessView()
        successView.showLoss()
        showNewGameButton()
        updateConstraints()
        completion()
    }
    
    // MARK: - SHOW CATS GAME
    func showCatsGame(currentGame: TicTacToeGame, completion: @escaping () -> ()) {
        showSuccessView()
        successView.showCatsGame()
        showNewGameButton()
        updateConstraints()
        completion()
    }
    
    func enableGrid() {
        TicTacToeModel.shared.gridEnabled = true
    }
    
    func disableGrid() {
        TicTacToeModel.shared.gridEnabled = false
    }
    
    // MARK: - RESET GAME
    func resetGame() {
        TicTacToeModel.shared.resetGame {
            self.threeRowGridView.isUserInteractionEnabled = true
            self.threeRowGridView.resetRows()
            self.successView.isHidden = true
        }
    }
}

extension TicTacToeView: ThreeRowGridViewDelegate {
    
    func showTheirTurn() {
        successView.showTheirTurn()
    }
    
    private func showSuccessView() {
        successView.isHidden = false
    }
    
    func gameWon() {
        ticTacToeViewDelegate.showTheWin()
    }
    
    func gameLost() {
        ticTacToeViewDelegate.showTheLoss()
    }
    
    func catsGame() {
        ticTacToeViewDelegate.showCatsGame()
    }
    
    func didTapLetterView(sender: UIButton) {
        threeRowGridView.isUserInteractionEnabled = false
        
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }
        guard let turnNumber = currentGame.turnNumber else { return }
        
        let currentSquare = TicTacToeModel.shared.square(for: sender.tag)
        let symbolString = TicTacToeModel.shared.symbolString(for: turnNumber)
        let turnImage = TicTacToeModel.shared.symbolImage(for: turnNumber)
        
        // update model and label with move as emoji string
        switch currentSquare {
        case .a1:
            TicTacToeModel.shared.currentTTTGame?.a1 = symbolString
            threeRowGridView.a1.letterImageView.image = turnImage
        case .a2:
            TicTacToeModel.shared.currentTTTGame?.a2 = symbolString
            threeRowGridView.a2.letterImageView.image = turnImage
        case .a3:
            TicTacToeModel.shared.currentTTTGame?.a3 = symbolString
            threeRowGridView.a3.letterImageView.image = turnImage
        case .b1:
            TicTacToeModel.shared.currentTTTGame?.b1 = symbolString
            threeRowGridView.b1.letterImageView.image = turnImage
        case .b2:
            TicTacToeModel.shared.currentTTTGame?.b2 = symbolString
            threeRowGridView.b2.letterImageView.image = turnImage
        case .b3:
            TicTacToeModel.shared.currentTTTGame?.b3 = symbolString
            threeRowGridView.b3.letterImageView.image = turnImage
        case .c1:
            TicTacToeModel.shared.currentTTTGame?.c1 = symbolString
            threeRowGridView.c1.letterImageView.image = turnImage
        case .c2:
            TicTacToeModel.shared.currentTTTGame?.c2 = symbolString
            threeRowGridView.c2.letterImageView.image = turnImage
        case .c3:
            TicTacToeModel.shared.currentTTTGame?.c3 = symbolString
            threeRowGridView.c3.letterImageView.image = turnImage
        }
        
        switch currentSquare {
        case .a1:
            TicTacToeModel.shared.currentTTTGame?.a1 = symbolString
        case .a2:
            TicTacToeModel.shared.currentTTTGame?.a2 = symbolString
        case .a3:
            TicTacToeModel.shared.currentTTTGame?.a3 = symbolString
        case .b1:
            TicTacToeModel.shared.currentTTTGame?.b1 = symbolString
        case .b2:
            TicTacToeModel.shared.currentTTTGame?.b2 = symbolString
        case .b3:
            TicTacToeModel.shared.currentTTTGame?.b3 = symbolString
        case .c1:
            TicTacToeModel.shared.currentTTTGame?.c1 = symbolString
        case .c2:
            TicTacToeModel.shared.currentTTTGame?.c2 = symbolString
        case .c3:
            TicTacToeModel.shared.currentTTTGame?.c3 = symbolString
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.ticTacToeViewDelegate.didTapTTTSquareButton()
        }
    }
}
