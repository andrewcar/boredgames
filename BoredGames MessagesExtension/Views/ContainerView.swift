//
//  ContainerView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/21/22.
//

import UIKit

protocol ContainerDelegate {
    func didTapSendButton()
}

class ContainerView: UIView {
    
    // MARK: - Properties
    var containerDelegate: ContainerDelegate!
    
    private var fiveLetterGuessButton = UIButton(frame: .zero)
    private var fiveLetterGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var ticTacToeButton = UIButton(frame: .zero)
    private var ticTacToeButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    var fiveLetterGuessView = FiveLetterGuessView()
    private var fiveLetterGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessLandscapeConstraints: [NSLayoutConstraint] = []
    
    var ticTacToeView = TicTacToeView()
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []

    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setBackgroundColor()
        addFiveLetterGuessButton()
        addTicTacToeButton()
        addFiveLetterGuessView()
        addTicTacToeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        // portrait
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height {
            updateFiveLetterGuessButton(isLandscape: false)
            updateTicTacToeButton(isLandscape: false)
            
            activateFiveLetterGuessViewPortraitConstraints()
            fiveLetterGuessView.updateConstraints()
            
            activateTicTacToeViewPortraitConstraints()
            ticTacToeView.updateConstraints()
            
        // landscape
        } else {
            updateFiveLetterGuessButton(isLandscape: true)
            updateTicTacToeButton(isLandscape: true)

            activateFiveLetterGuessViewLandscapeConstraints()
            fiveLetterGuessView.updateConstraints()
            
            activateTicTacToeViewLandscapeConstraints()
            ticTacToeView.updateConstraints()
        }
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - BACKGROUND COLOR
    private func setBackgroundColor() {
        backgroundColor = UIColor(named: "background")
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON
    private func addFiveLetterGuessButton() {
        fiveLetterGuessButton.translatesAutoresizingMaskIntoConstraints = false
        fiveLetterGuessButton.addTarget(self, action: #selector(didTapFiveLetterGuessButton(sender:)), for: .touchUpInside)
        fiveLetterGuessButton.setImage(fiveLetterGuessButtonImage(), for: .normal)
        fiveLetterGuessButton.setTitleColor(.clear, for: .normal)
        addSubview(fiveLetterGuessButton)
        activateFiveLetterGuessButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE FIVE LETTER GUESS BUTTON
    private func updateFiveLetterGuessButton(isLandscape: Bool) {
        if isLandscape {
            activateFiveLetterGuessButtonLandscapeConstraints()
        } else {
            activateFiveLetterGuessButtonPortraitConstraints()
        }
        fiveLetterGuessButton.setImage(fiveLetterGuessButtonImage(), for: .normal)
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON IMAGE
    private func fiveLetterGuessButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "a.square",
            size: Frame.buttonSize,
            weight: .regular,
            color: .systemIconButton)
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON PORTRAIT CONSTRAINTS
    private func activateFiveLetterGuessButtonPortraitConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        let offset = GameModel.shared.appState == .container ? 0 : (UIScreen.main.bounds.width * 2)
        fiveLetterGuessButtonPortraitConstraints = [
            fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
            fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - offset),
            fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
        ]
        NSLayoutConstraint.activate(fiveLetterGuessButtonPortraitConstraints)
    }

    // MARK: - FIVE LETTER GUESS BUTTON LANDSCAPE CONSTRAINTS
    func activateFiveLetterGuessButtonLandscapeConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        let offset = GameModel.shared.appState == .container ? 0 : (UIScreen.main.bounds.width * 2)
        fiveLetterGuessButtonLandscapeConstraints = [
            fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
            fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - offset),
            fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
        ]
        NSLayoutConstraint.activate(fiveLetterGuessButtonLandscapeConstraints)
    }
    
    // MARK: - FIVE LETTER GUESS VIEW
    private func addFiveLetterGuessView() {
        fiveLetterGuessView = FiveLetterGuessView(frame: .zero)
        fiveLetterGuessView.fiveLetterGuessDelegate = self
        addSubview(fiveLetterGuessView)
        activateFiveLetterGuessViewPortraitConstraints()
    }
    
    // MARK: - FIVE LETTER GUESS VIEW PORTRAIT CONSTRAINTS
    private func activateFiveLetterGuessViewPortraitConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessLandscapeConstraints)
        let offset = GameModel.shared.appState == .fiveLetterGuess ? 0 : UIScreen.main.bounds.width
        fiveLetterGuessPortraitConstraints = [
            fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
            fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
        ]
        NSLayoutConstraint.activate(fiveLetterGuessPortraitConstraints)
    }
    
    // MARK: - FIVE LETTER GUESS VIEW LANDSCAPE CONSTRAINTS
    private func activateFiveLetterGuessViewLandscapeConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessLandscapeConstraints)
        let offset = GameModel.shared.appState == .fiveLetterGuess ? 0 : UIScreen.main.bounds.width
        fiveLetterGuessLandscapeConstraints = [
            fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
            fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
        ]
        NSLayoutConstraint.activate(fiveLetterGuessLandscapeConstraints)
    }
    
    // MARK: - DID TAP FIVE LETTER GUESS BUTTON
    @objc private func didTapFiveLetterGuessButton(sender: UIButton) {
        GameModel.shared.appState = .fiveLetterGuess
        updateConstraints()
    }
    
    // MARK: - TIC TAC TOE BUTTON
    private func addTicTacToeButton() {
        ticTacToeButton.translatesAutoresizingMaskIntoConstraints = false
        ticTacToeButton.addTarget(self, action: #selector(didTapTicTacToeButton(sender:)), for: .touchUpInside)
        ticTacToeButton.setImage(ticTacToeButtonImage(), for: .normal)
        ticTacToeButton.setTitleColor(.clear, for: .normal)
        addSubview(ticTacToeButton)
        activateTicTacToeButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE TIC TAC TOE BUTTON
    private func updateTicTacToeButton(isLandscape: Bool) {
        if isLandscape {
            activateTicTacToeButtonLandscapeConstraints()
        } else {
            activateTicTacToeButtonPortraitConstraints()
        }
        ticTacToeButton.setImage(ticTacToeButtonImage(), for: .normal)
    }
    
    // MARK: - TIC TAC TOE BUTTON IMAGE
    private func ticTacToeButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "square.grid.3x3.topleft.filled",
            size: Frame.buttonSize,
            weight: .regular,
            color: .systemIconButton)
    }
    
    // MARK: - TIC TAC TOE BUTTON PORTRAIT CONSTRAINTS
    private func activateTicTacToeButtonPortraitConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        let offset = GameModel.shared.appState == .container ? 0 : (UIScreen.main.bounds.width * 2)
        ticTacToeButtonPortraitConstraints = [
            ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
            ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + offset),
            ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
        ]
        NSLayoutConstraint.activate(ticTacToeButtonPortraitConstraints)
    }

    // MARK: - TIC TAC TOE BUTTON LANDSCAPE CONSTRAINTS
    func activateTicTacToeButtonLandscapeConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        let offset = GameModel.shared.appState == .container ? 0 : (UIScreen.main.bounds.width * 2)
        ticTacToeButtonLandscapeConstraints = [
            ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
            ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + offset),
            ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
        ]
        NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
    }

    
    // MARK: - TIC TAC TOE VIEW
    private func addTicTacToeView() {
        ticTacToeView = TicTacToeView(frame: .zero)
        addSubview(ticTacToeView)
        activateTicTacToeViewPortraitConstraints()
    }
    
    // MARK: - TIC TAC TOE VIEW PORTRAIT CONSTRAINTS
    private func activateTicTacToeViewPortraitConstraints() {
        NSLayoutConstraint.deactivate(ticTacToePortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeLandscapeConstraints)
        let offset = GameModel.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        ticTacToePortraitConstraints = [
            ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
            ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(ticTacToePortraitConstraints)
    }
    
    // MARK: - TIC TAC TOE VIEW LANDSCAPE CONSTRAINTS
    private func activateTicTacToeViewLandscapeConstraints() {
        NSLayoutConstraint.deactivate(ticTacToePortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeLandscapeConstraints)
        let offset = GameModel.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        ticTacToeLandscapeConstraints = [
            ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
            ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(ticTacToeLandscapeConstraints)
    }
    
    // MARK: - DID TAP TIC TAC TOE BUTTON
    @objc private func didTapTicTacToeButton(sender: UIButton) {
        GameModel.shared.appState = .ticTacToe
        updateConstraints()
    }
}

extension ContainerView: FiveLetterGuessDelegate {
    func didTapSendButton() {
        containerDelegate.didTapSendButton()
    }
}
