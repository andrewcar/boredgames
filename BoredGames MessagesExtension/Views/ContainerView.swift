//
//  ContainerView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/21/22.
//

import UIKit

protocol ContainerDelegate {
    func didTapSendButton()
    func didTapLogoButton()
    func didTapWordGuessButton()
    func didTapTicTacToeButton()
    func didTapTTTSquareButton()
    func showTTTWin()
    func showTTTLoss()
    func showTTTCatsGame()
}

class ContainerView: UIView {
    
    // MARK: - ❇️
    var containerDelegate: ContainerDelegate!
    
    private var logoView = LogoView(frame: .zero)
    private var logoPortraitConstraints: [NSLayoutConstraint] = []
    private var logoLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var wordGuessButton = GameButton(frame: .zero)
    private var wordGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var wordGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var ticTacToeButton = GameButton(frame: .zero)
    private var ticTacToeButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var dotsButton = GameButton(frame: .zero)
    private var dotsButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var dotsButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    var wordGuessView = WordGuessView(frame: .zero)
    private var wordGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var wordGuessLandscapeConstraints: [NSLayoutConstraint] = []
    
    var ticTacToeView = TicTacToeView(frame: .zero)
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []

    private var smallLogoView = SmallLogoView(frame: .zero)
    private var smallLogoPortraitConstraints: [NSLayoutConstraint] = []
    private var smallLogoLandscapeConstraints: [NSLayoutConstraint] = []
        
    private var versionLabel = UILabel(frame: .zero)
    private var versionLabelPortraitConstraints: [NSLayoutConstraint] = []
    private var versionLabelLandscapeConstraints: [NSLayoutConstraint] = []

    private var debugView = DebugView(frame: .zero)
    private var debugViewPortraitConstraints: [NSLayoutConstraint] = []
    private var debugViewLandscapeConstraints: [NSLayoutConstraint] = []

    // MARK: - 1️⃣
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .containerBackground
        addLogoView()
        addWordGuessButton()
        addTicTacToeButton()
        addDotsButton()
        addWordGuessView()
        addTicTacToeView()
        addDebugView()
        addSmallLogoView()
        addVersionLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 📜 🔄
    override func updateConstraints() {
        super.updateConstraints()
        
        let isLandscape = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? false : true

        updateBackgroundColor()
        updateLogoView(isLandscape: isLandscape)
        updateWordGuessButton(isLandscape: isLandscape)
        updateTicTacToeButton(isLandscape: isLandscape)
        updateDotsButton(isLandscape: isLandscape)
        updateWordGuessView(isLandscape: isLandscape)
        updateTicTacToeView(isLandscape: isLandscape)
        activateSmallLogoViewConstraints(isLandscape: isLandscape)
        activateVersionLabelConstraints(isLandscape: isLandscape)
        activateDebugConstraints(isLandscape: isLandscape)

        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - 🪟 🟩 🔄
    private func updateBackgroundColor() {
        var newColor: UIColor?
        switch Model.shared.appState {
        case .container:
            newColor = .containerBackground
        case .wordGuess:
            newColor = .wordGuessBackground
        case .ticTacToe:
            newColor = .ticTacToeBackground
        case .dots:
            newColor = .dotsBackground
        case .debug:
            newColor = .containerBackground
        }
        guard let newColor = newColor else { return }
        UIView.animate(withDuration: 0.426, delay: 0, options: .curveEaseOut) {
            self.backgroundColor = newColor
        } completion: { _ in
        }
    }

    // MARK: - 🅱️ 🪟
    private func addLogoView() {
        addSubview(logoView)
        activateLogoConstraints(isLandscape: false)
    }
    
    // MARK: - 🅱️ 🔄
    private func updateLogoView(isLandscape: Bool) {
        activateLogoConstraints(isLandscape: isLandscape)
        logoView.updateConstraints()
    }
    
    // MARK: - 🅱️ 📜
    private func activateLogoConstraints(isLandscape: Bool) {
        deactivateLogoConstraints()
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.width
        if isLandscape {
            logoLandscapeConstraints = [
                logoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset),
                logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.width),
                logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.height)
            ]
            NSLayoutConstraint.activate(logoLandscapeConstraints)
        } else {
            logoPortraitConstraints = [
                logoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset),
                logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.width),
                logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.height)
            ]
            NSLayoutConstraint.activate(logoPortraitConstraints)
        }
    }
    
    // MARK: - 🅱️ 📜 🙅🏻‍♂️
    private func deactivateLogoConstraints() {
        NSLayoutConstraint.deactivate(logoPortraitConstraints)
        NSLayoutConstraint.deactivate(logoLandscapeConstraints)
        logoPortraitConstraints.removeAll()
        logoLandscapeConstraints.removeAll()
    }
    
    // MARK: - 👌🅱️ 🪟
    private func addSmallLogoView() {
        smallLogoView.smallLogoDelegate = self
        addSubview(smallLogoView)
        activateSmallLogoViewConstraints(isLandscape: false)
    }
    
    // MARK: - 👌🅱️ 🪟 📜
    private func activateSmallLogoViewConstraints(isLandscape: Bool) {
        deactivateSmallLogoViewConstraints()
        let wgOffset = Model.shared.wordGuessState == .grid ? 0 : UIScreen.main.bounds.width
        let tttOffset = TicTacToeModel.shared.ticTacToeState == .grid ? 0 : UIScreen.main.bounds.width
        if isLandscape {
            smallLogoLandscapeConstraints = [
                smallLogoView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
                smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
                smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
            ]
            switch Model.shared.appState {
            case .container:
                let trailingConstraint = smallLogoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding)
                smallLogoLandscapeConstraints.append(trailingConstraint)
            case .wordGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: wordGuessView.gridView.trailingAnchor, constant: Frame.Logo.upperPadding - wgOffset)
                smallLogoLandscapeConstraints.append(leadingConstraint)
            case .ticTacToe:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - tttOffset)
                smallLogoLandscapeConstraints.append(leadingConstraint)
            case .debug:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding)
                smallLogoLandscapeConstraints.append(leadingConstraint)
            default: ()
            }
            NSLayoutConstraint.activate(smallLogoLandscapeConstraints)
        } else {
            smallLogoPortraitConstraints = [
                smallLogoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
                smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
            ]
            switch Model.shared.appState {
            case .container:
                let trailingConstraint = smallLogoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding)
                smallLogoPortraitConstraints.append(trailingConstraint)
            case .wordGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - wgOffset)
                smallLogoPortraitConstraints.append(leadingConstraint)
            case .ticTacToe:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - tttOffset)
                smallLogoPortraitConstraints.append(leadingConstraint)
            case .debug:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding)
                smallLogoPortraitConstraints.append(leadingConstraint)
            default: ()
            }
            NSLayoutConstraint.activate(smallLogoPortraitConstraints)
        }
        smallLogoView.updateConstraints()
    }
    
    // MARK: - 👌🅱️ 🪟 📜 🙅🏻‍♂️
    private func deactivateSmallLogoViewConstraints() {
        NSLayoutConstraint.deactivate(smallLogoPortraitConstraints)
        NSLayoutConstraint.deactivate(smallLogoLandscapeConstraints)
        smallLogoPortraitConstraints.removeAll()
        smallLogoLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🅰️ ▶️
    private func addWordGuessButton() {
        wordGuessButton.addTarget(self, action: #selector(didTapWordGuessButton(sender:)), for: .touchUpInside)
        if let image = UIImage.wordGuess {
            wordGuessButton.setImage(image, for: .normal)
        }
        addSubview(wordGuessButton)
        activateWordGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🅰️ ▶️ 🔄
    private func updateWordGuessButton(isLandscape: Bool) {
        activateWordGuessButtonConstraints(isLandscape: isLandscape)
        if let image = UIImage.wordGuess {
            wordGuessButton.setImage(image, for: .normal)
        }
        wordGuessView.updateConstraints()
    }
    
    // MARK: - 🅰️ ▶️ 📜
    private func activateWordGuessButtonConstraints(isLandscape: Bool) {
        deactivateWordGuessButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            wordGuessButtonLandscapeConstraints = [
                wordGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                wordGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.gameButtonPadding - offset),
                wordGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                wordGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(wordGuessButtonLandscapeConstraints)
        } else {
            wordGuessButtonPortraitConstraints = [
                wordGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                wordGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.gameButtonPadding - offset),
                wordGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                wordGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(wordGuessButtonPortraitConstraints)
        }
    }
    
    // MARK: - 🅰️ ▶️ 📜 🙅🏻‍♂️
    private func deactivateWordGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(wordGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(wordGuessButtonLandscapeConstraints)
        wordGuessButtonPortraitConstraints.removeAll()
        wordGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🅰️ ▶️ 👇
    @objc private func didTapWordGuessButton(sender: UIButton) {
        Model.shared.appState = .wordGuess
        updateConstraints()
        containerDelegate.didTapWordGuessButton()
    }
    
    // MARK: - 🅰️ 🪟
    private func addWordGuessView() {
        wordGuessView.wordGuessDelegate = self
        addSubview(wordGuessView)
        activateWordGuessViewConstraints(isLandscape: false)
    }
    
    // MARK: - 🅰️ 🪟 🔄
    private func updateWordGuessView(isLandscape: Bool) {
        activateWordGuessViewConstraints(isLandscape: isLandscape)
        wordGuessView.updateConstraints()
    }
    
    // MARK: - 🅰️ 🪟 📜
    private func activateWordGuessViewConstraints(isLandscape: Bool) {
        deactivateWordGuessViewConstraints()
        let offset = Model.shared.appState == .wordGuess ? 0 : -UIScreen.main.bounds.width
        if isLandscape {
            wordGuessLandscapeConstraints = [
                wordGuessView.topAnchor.constraint(equalTo: topAnchor),
                wordGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                wordGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                wordGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
            ]
            NSLayoutConstraint.activate(wordGuessLandscapeConstraints)
        } else {
            wordGuessPortraitConstraints = [
                wordGuessView.topAnchor.constraint(equalTo: topAnchor),
                wordGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                wordGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                wordGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
            ]
            NSLayoutConstraint.activate(wordGuessPortraitConstraints)
        }
    }
    
    // MARK: - 🅰️ 🪟 📜 🙅🏻‍♂️
    private func deactivateWordGuessViewConstraints() {
        NSLayoutConstraint.deactivate(wordGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(wordGuessLandscapeConstraints)
        wordGuessPortraitConstraints.removeAll()
        wordGuessLandscapeConstraints.removeAll()
    }
    
    // MARK: - ❌ ▶️
    private func addTicTacToeButton() {
        ticTacToeButton.addTarget(self, action: #selector(didTapTicTacToeButton(sender:)), for: .touchUpInside)
        if let image = UIImage.ticTacToe {
            ticTacToeButton.setImage(image, for: .normal)
        }
        addSubview(ticTacToeButton)
        activateTicTacToeButtonConstraints(isLandscape: false)
    }
    
    // MARK: - ❌ ▶️ 🔄
    private func updateTicTacToeButton(isLandscape: Bool) {
        activateTicTacToeButtonConstraints(isLandscape: isLandscape)
        if let image = UIImage.ticTacToe {
            ticTacToeButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: - ❌ ▶️ 📜
    private func activateTicTacToeButtonConstraints(isLandscape: Bool) {
        deactivateTicTacToeButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            ticTacToeButtonLandscapeConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -offset),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
        } else {
            ticTacToeButtonPortraitConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -offset),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(ticTacToeButtonPortraitConstraints)
        }
    }
    
    // MARK: - ❌ ▶️ 📜 🙅🏻‍♂️
    private func deactivateTicTacToeButtonConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        ticTacToeButtonPortraitConstraints.removeAll()
        ticTacToeButtonLandscapeConstraints.removeAll()
    }

    // MARK: - ❌ ▶️ 👇
    @objc private func didTapTicTacToeButton(sender: UIButton) {
        Model.shared.appState = .ticTacToe
        updateConstraints()
        containerDelegate.didTapTicTacToeButton()
    }
    
    // MARK: - ❌ 🪟
    private func addTicTacToeView() {
        ticTacToeView.ticTacToeViewDelegate = self
        addSubview(ticTacToeView)
        activateTicTacToeViewConstraints(isLandscape: false)
    }
    
    // MARK: - ❌ 🪟 🔄
    private func updateTicTacToeView(isLandscape: Bool) {
        activateTicTacToeViewConstraints(isLandscape: isLandscape)
        ticTacToeView.updateConstraints()
    }
    
    // MARK: - ❌ 🪟 📜
    private func activateTicTacToeViewConstraints(isLandscape: Bool) {
        deactivateTicTacToeViewConstraints()
        let offset = Model.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        if isLandscape {
            ticTacToeLandscapeConstraints = [
                ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
                ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
                ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
            NSLayoutConstraint.activate(ticTacToeLandscapeConstraints)
        } else {
            ticTacToePortraitConstraints = [
                ticTacToeView.topAnchor.constraint(equalTo: topAnchor),
                ticTacToeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                ticTacToeView.bottomAnchor.constraint(equalTo: bottomAnchor),
                ticTacToeView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
            NSLayoutConstraint.activate(ticTacToePortraitConstraints)
        }
    }
    
    // MARK: - ❌ 🪟 📜 🙅🏻‍♂️
    private func deactivateTicTacToeViewConstraints() {
        NSLayoutConstraint.deactivate(ticTacToePortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeLandscapeConstraints)
        ticTacToePortraitConstraints.removeAll()
        ticTacToeLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🔴 ▶️
    private func addDotsButton() {
        dotsButton.addTarget(self, action: #selector(didTapDotsButton(sender:)), for: .touchUpInside)
        if let image = UIImage.dots {
            dotsButton.setImage(image, for: .normal)
        }
        addSubview(dotsButton)
        activateDotsButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🔴 ▶️ 🔄
    private func updateDotsButton(isLandscape: Bool) {
        activateDotsButtonConstraints(isLandscape: isLandscape)
        if let image = UIImage.dots {
            dotsButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: - 🔴 ▶️ 📜
    private func activateDotsButtonConstraints(isLandscape: Bool) {
        deactivateDotsButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            dotsButtonLandscapeConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + Frame.gameButtonPadding - offset),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(dotsButtonLandscapeConstraints)
        } else {
            dotsButtonPortraitConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + Frame.gameButtonPadding - offset),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(dotsButtonPortraitConstraints)
        }
        NSLayoutConstraint.activate(dotsButtonPortraitConstraints)
    }
    
    // MARK: - 🔴 ▶️ 📜 🙅🏻‍♂️
    private func deactivateDotsButtonConstraints() {
        NSLayoutConstraint.deactivate(dotsButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(dotsButtonLandscapeConstraints)
        dotsButtonPortraitConstraints.removeAll()
        dotsButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🔴 ▶️ 👇
    @objc private func didTapDotsButton(sender: UIButton) {
        dotsButton.shake()
    }
    
    // MARK: - ℹ️ 🆒
    private func addVersionLabel() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.text = "\(Bundle.main.appVersionLong) (\(Bundle.main.appBuild))"
        versionLabel.font = .systemFont(ofSize: 12, weight: .medium)
        versionLabel.textColor = .versionLabel
        addSubview(versionLabel)
        activateVersionLabelConstraints(isLandscape: false)
    }
    
    // MARK: - ℹ️ 🆒 📜
    private func activateVersionLabelConstraints(isLandscape: Bool) {
        deactivateVersionLabelConstraints()
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.height * 2
        if isLandscape {
            versionLabelLandscapeConstraints = [
                versionLabel.heightAnchor.constraint(equalToConstant: Frame.versionHeight),
                versionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: -offset),
                versionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding - (Frame.padding * 2)),
                versionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.Logo.upperPadding * 2) - offset)
            ]
            NSLayoutConstraint.activate(versionLabelLandscapeConstraints)
        } else {
            versionLabelPortraitConstraints = [
                versionLabel.heightAnchor.constraint(equalToConstant: Frame.versionHeight),
                versionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: -offset),
                versionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding - (Frame.padding * 2)),
                versionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.Logo.upperPadding * 2) - offset)
            ]
            NSLayoutConstraint.activate(versionLabelPortraitConstraints)
        }
    }
    
    // MARK: - ℹ️ 🆒 📜 🙅🏻‍♂️
    private func deactivateVersionLabelConstraints() {
        NSLayoutConstraint.deactivate(versionLabelPortraitConstraints)
        NSLayoutConstraint.deactivate(versionLabelLandscapeConstraints)
        versionLabelPortraitConstraints.removeAll()
        versionLabelLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🫥 🪟
    private func addDebugView() {
        addSubview(debugView)
        activateDebugConstraints(isLandscape: false)
    }
    
    // MARK: - DEBUG VIEW CONSTRAINTS
    private func activateDebugConstraints(isLandscape: Bool) {
        deactivateDebugConstraints()
        let offset = Model.shared.appState == .debug ? 0 : UIScreen.main.bounds.height * 2
        if isLandscape {
            debugViewLandscapeConstraints = [
                debugView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
                debugView.leadingAnchor.constraint(equalTo: leadingAnchor),
                debugView.trailingAnchor.constraint(equalTo: trailingAnchor),
                debugView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
            NSLayoutConstraint.activate(debugViewLandscapeConstraints)
        } else {
            debugViewPortraitConstraints = [
                debugView.topAnchor.constraint(equalTo: topAnchor, constant: offset),
                debugView.leadingAnchor.constraint(equalTo: leadingAnchor),
                debugView.trailingAnchor.constraint(equalTo: trailingAnchor),
                debugView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
            NSLayoutConstraint.activate(debugViewPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE DEBUG CONSTRAINTS
    private func deactivateDebugConstraints() {
        NSLayoutConstraint.deactivate(debugViewPortraitConstraints)
        NSLayoutConstraint.deactivate(debugViewLandscapeConstraints)
        debugViewPortraitConstraints.removeAll()
        debugViewLandscapeConstraints.removeAll()
    }
}

extension ContainerView: SmallLogoViewDelegate {
    
    // MARK: - 🅱️ ▶️ 👇
    func didTapLogoButton() {
        containerDelegate.didTapLogoButton()
    }
}

extension ContainerView: WordGuessDelegate {
    
    // MARK: - ⤴️ ▶️ 👇
    func didTapWGSendButton() {
        containerDelegate.didTapSendButton()
    }
    
    // MARK: - 📈 ▶️ 👇
    func didTapWGStatsButton() {
        updateConstraints()
    }
    
    // MARK: - 🔢 ▶️ 👇
    func didTapWGGridButton() {
        updateConstraints()
    }
}

extension ContainerView: TicTacToeViewDelegate {
    
    // MARK: - 🔳 ▶️ 👇
    func didTapTTTSquareButton() {
        containerDelegate.didTapTTTSquareButton()
    }
    
    // MARK: - 📈 ▶️ 👇
    func didTapTTTStatsButton() {
        updateConstraints()
    }
    
    // MARK: - 🔢 ▶️ 👇
    func didTapTTTGridButton() {
        updateConstraints()
    }
    
    func showTheWin() {
        containerDelegate.showTTTWin()
    }
    
    func showTheLoss() {
        containerDelegate.showTTTLoss()
    }
    
    func showCatsGame() {
        containerDelegate.showTTTCatsGame()
    }
}
