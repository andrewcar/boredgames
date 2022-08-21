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
    private var fiveLetterGuessButtonShowing = true
    
    private var ticTacToeButton = UIButton(frame: .zero)
    private var ticTacToeButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeButtonLandscapeConstraints: [NSLayoutConstraint] = []
    private var ticTacToeButtonShowing = true
    
    var fiveLetterGuessView = FiveLetterGuessView()
    private var fiveLetterGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessLandscapeConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessShowing = false
    
    var ticTacToeView = TicTacToeView()
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []
    private var ticTacToeShowing = false

    
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
            activateFiveLetterGuessButtonPortraitConstraints()
            activateTicTacToeButtonPortraitConstraints()
            fiveLetterGuessView.updateConstraints()
            ticTacToeView.updateConstraints()
            
        // landscape
        } else {
            activateFiveLetterGuessButtonLandscapeConstraints()
            activateTicTacToeButtonLandscapeConstraints()
            fiveLetterGuessView.updateConstraints()
            ticTacToeView.updateConstraints()
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
        fiveLetterGuessButton.layer.borderColor = UIColor.systemRed.cgColor
        fiveLetterGuessButton.layer.borderWidth = 2
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
    
    // MARK: - DID TAP FIVE LETTER GUESS BUTTON
    @objc private func didTapFiveLetterGuessButton(sender: UIButton) {
        fiveLetterGuessShowing = true
        updateConstraints()
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON PORTRAIT CONSTRAINTS
    private func activateFiveLetterGuessButtonPortraitConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        fiveLetterGuessButtonPortraitConstraints = [
            fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            fiveLetterGuessButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.padding * 13),
        ]
        let offset: CGFloat = GameModel.shared.appState == .container ? 0 : UIScreen.main.bounds.width
        let constraint = fiveLetterGuessButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2.5) + offset)
        fiveLetterGuessButtonPortraitConstraints.append(constraint)
        NSLayoutConstraint.activate(fiveLetterGuessButtonPortraitConstraints)
    }

    // MARK: - FIVE LETTER GUESS BUTTON LANDSCAPE CONSTRAINTS
    func activateFiveLetterGuessButtonLandscapeConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        fiveLetterGuessButtonLandscapeConstraints = [
            fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width),
            fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
        ]
        let offset: CGFloat = GameModel.shared.appState == .container ? 0 : UIScreen.main.bounds.width
        var trailingConstraint: NSLayoutConstraint
        if UIDevice.current.userInterfaceIdiom == .pad {
            trailingConstraint = fiveLetterGuessButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 12) + offset)
        } else {
            trailingConstraint = fiveLetterGuessButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2) + offset)
        }
        fiveLetterGuessButtonLandscapeConstraints.append(trailingConstraint)
        NSLayoutConstraint.activate(fiveLetterGuessButtonLandscapeConstraints)
    }
    
    // MARK: - FIVE LETTER GUESS VIEW
    private func addFiveLetterGuessView() {
        fiveLetterGuessView = FiveLetterGuessView(frame: .zero)
        fiveLetterGuessView.fiveLetterGuessDelegate = self
        fiveLetterGuessView.layer.borderColor = UIColor.systemCyan.cgColor
        fiveLetterGuessView.layer.borderWidth = 2
        addSubview(fiveLetterGuessView)
        activateFiveLetterGuessViewPortraitConstraints()
    }
    
    // MARK: - FIVE LETTER GUESS VIEW PORTRAIT CONSTRAINTS
    private func activateFiveLetterGuessViewPortraitConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessLandscapeConstraints)
        fiveLetterGuessPortraitConstraints = [
            fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
            fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        let offset: CGFloat = GameModel.shared.appState == .fiveLetterGuess ? 0 : UIScreen.main.bounds.width
        let leadingConstraint = fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        fiveLetterGuessPortraitConstraints.append(leadingConstraint)
        NSLayoutConstraint.activate(fiveLetterGuessPortraitConstraints)
    }
    
    // MARK: - FIVE LETTER GUESS VIEW LANDSCAPE CONSTRAINTS
    private func activateFiveLetterGuessViewLandscapeConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessLandscapeConstraints)
        fiveLetterGuessLandscapeConstraints = [
            fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
            fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        let offset: CGFloat = GameModel.shared.appState == .fiveLetterGuess ? 0 : UIScreen.main.bounds.width
        let leadingConstraint = fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        fiveLetterGuessLandscapeConstraints.append(leadingConstraint)
        NSLayoutConstraint.activate(fiveLetterGuessLandscapeConstraints)
    }
    
    // MARK: - TIC TAC TOE BUTTON
    private func addTicTacToeButton() {
        ticTacToeButton.translatesAutoresizingMaskIntoConstraints = false
        ticTacToeButton.addTarget(self, action: #selector(didTapTicTacToeButton(sender:)), for: .touchUpInside)
        ticTacToeButton.setImage(ticTacToeButtonImage(), for: .normal)
        ticTacToeButton.setTitleColor(.clear, for: .normal)
        ticTacToeButton.layer.borderColor = UIColor.systemPurple.cgColor
        ticTacToeButton.layer.borderWidth = 2
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
    
    // MARK: - DID TAP TIC TAC TOE BUTTON
    @objc private func didTapTicTacToeButton(sender: UIButton) {
        ticTacToeShowing = true
        updateConstraints()
    }
    
    // MARK: - TIC TAC TOE BUTTON PORTRAIT CONSTRAINTS
    private func activateTicTacToeButtonPortraitConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        ticTacToeButtonPortraitConstraints = [
            ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            ticTacToeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.padding * 13),
        ]
        let offset: CGFloat = GameModel.shared.appState == .container ? 0 : UIScreen.main.bounds.width
        let constraint = ticTacToeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2.5) + offset)
        ticTacToeButtonPortraitConstraints.append(constraint)
        NSLayoutConstraint.activate(ticTacToeButtonPortraitConstraints)
    }

    // MARK: - TIC TAC TOE BUTTON LANDSCAPE CONSTRAINTS
    func activateTicTacToeButtonLandscapeConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        ticTacToeButtonLandscapeConstraints = [
            ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width),
            ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
        ]
        let offset: CGFloat = GameModel.shared.appState == .container ? 0 : UIScreen.main.bounds.width
        var trailingConstraint: NSLayoutConstraint
        if UIDevice.current.userInterfaceIdiom == .pad {
            trailingConstraint = ticTacToeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 12) + offset)
        } else {
            trailingConstraint = ticTacToeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2) + offset)
        }
        ticTacToeButtonLandscapeConstraints.append(trailingConstraint)
        NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
    }

    
    // MARK: - TIC TAC TOE VIEW
    private func addTicTacToeView() {
        ticTacToeView = TicTacToeView(frame: .zero)
        ticTacToeView.layer.borderColor = UIColor.systemBlue.cgColor
        ticTacToeView.layer.borderWidth = 2
        addSubview(ticTacToeView)
        activateTicTacToePortraitConstraints()
    }
    
    // MARK: - TIC TAC TOE PORTRAIT CONSTRAINTS
    private func activateTicTacToePortraitConstraints() {
        NSLayoutConstraint.deactivate(ticTacToePortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeLandscapeConstraints)
        ticTacToePortraitConstraints = [
            ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
            ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        let offset: CGFloat = GameModel.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        let leadingConstraint = ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        ticTacToePortraitConstraints.append(leadingConstraint)
        NSLayoutConstraint.activate(ticTacToePortraitConstraints)
    }
    
    // MARK: - TIC TAC TOE LANDSCAPE CONSTRAINTS
    private func activateTicTacToeLandscapeConstraints() {
        NSLayoutConstraint.deactivate(ticTacToePortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeLandscapeConstraints)
        ticTacToeLandscapeConstraints = [
            ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
            ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        let offset: CGFloat = GameModel.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        let leadingConstraint = ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        ticTacToePortraitConstraints.append(leadingConstraint)
        NSLayoutConstraint.activate(ticTacToeLandscapeConstraints)
    }
}

extension ContainerView: FiveLetterGuessDelegate {
    func didTapSendButton() {
        containerDelegate.didTapSendButton()
    }
}
