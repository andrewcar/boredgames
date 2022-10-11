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
    func didTapBatteryGuessButton()
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
    
    private var batteryGuessButton = GameButton(frame: .zero)
    private var batteryGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var batteryGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var songGuessButton = GameButton(frame: .zero)
    private var songGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var songGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var placeGuessButton = GameButton(frame: .zero)
    private var placeGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var placeGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    var wordGuessView = WordGuessView(frame: .zero)
    private var wordGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var wordGuessLandscapeConstraints: [NSLayoutConstraint] = []
    
    var ticTacToeView = TicTacToeView(frame: .zero)
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []
    
    var batteryGuessView = BatteryGuessView(frame: .zero)
    private var batteryGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var batteryGuessLandscapeConstraints: [NSLayoutConstraint] = []

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
        addBatteryGuessButton()
        addPlaceGuessButton()
        addSongGuessButton()
        addWordGuessView()
        addTicTacToeView()
        addBatteryGuessView()
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
        updateBatteryGuessButton(isLandscape: isLandscape)
        updateSongGuessButton(isLandscape: isLandscape)
        updatePlaceGuessButton(isLandscape: isLandscape)
        updateWordGuessView(isLandscape: isLandscape)
        updateTicTacToeView(isLandscape: isLandscape)
        updateBatteryGuessView(isLandscape: isLandscape)
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
        case .batteryGuess:
            newColor = .batteryGuessBackground
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
            case .batteryGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding)
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
            case .batteryGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding)
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
        wordGuessButton.setImage(wordGuessButtonImage(), for: .normal)
        addSubview(wordGuessButton)
        activateWordGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🅰️ ▶️ 🔄
    private func updateWordGuessButton(isLandscape: Bool) {
        activateWordGuessButtonConstraints(isLandscape: isLandscape)
        wordGuessButton.setImage(wordGuessButtonImage(), for: .normal)
        wordGuessView.updateConstraints()
    }
    
    // MARK: - 🅰️ ▶️ 🌄
    private func wordGuessButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "w.square.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .gameButton)
    }
    
    // MARK: - 🅰️ ▶️ 📜
    private func activateWordGuessButtonConstraints(isLandscape: Bool) {
        deactivateWordGuessButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            wordGuessButtonLandscapeConstraints = [
                wordGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 3)),
                wordGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.gameButtonPadding - offset),
                wordGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                wordGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(wordGuessButtonLandscapeConstraints)
        } else {
            wordGuessButtonPortraitConstraints = [
                wordGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 2)),
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
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 3)),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -offset),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width * 0.8),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height * 0.8)
            ]
            NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
        } else {
            ticTacToeButtonPortraitConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 2)),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -offset),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width * 0.8),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height * 0.8)
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
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 3)),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + Frame.gameButtonPadding - offset),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width * 0.8),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height * 0.8)
            ]
            NSLayoutConstraint.activate(dotsButtonLandscapeConstraints)
        } else {
            dotsButtonPortraitConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(Frame.gameButtonPadding / 2)),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width + Frame.gameButtonPadding - offset),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width * 0.8),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height * 0.8)
            ]
            NSLayoutConstraint.activate(dotsButtonPortraitConstraints)
        }
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
    
    // MARK: - 🔋 ▶️
    private func addBatteryGuessButton() {
        batteryGuessButton.addTarget(self, action: #selector(didTapBatteryGuessButton(sender:)), for: .touchUpInside)
        batteryGuessButton.setImage(batteryGuessButtonImage(), for: .normal)
        addSubview(batteryGuessButton)
        activateBatteryGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🔋 ▶️ 🔄
    private func updateBatteryGuessButton(isLandscape: Bool) {
        activateBatteryGuessButtonConstraints(isLandscape: isLandscape)
        batteryGuessButton.setImage(batteryGuessButtonImage(), for: .normal)
    }
    
    // MARK: - 🔋 ▶️ 🌄
    private func batteryGuessButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "battery.75",
            size: Frame.buttonSize,
            weight: .regular,
            color: .gameButton)
    }
    
    // MARK: - 🔋 ▶️ 📜
    private func activateBatteryGuessButtonConstraints(isLandscape: Bool) {
        deactivateBatteryGuessButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            batteryGuessButtonLandscapeConstraints = [
                batteryGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.bigPadding),
                batteryGuessButton.centerXAnchor.constraint(equalTo: wordGuessButton.centerXAnchor, constant: -offset),
                batteryGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                batteryGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(batteryGuessButtonLandscapeConstraints)
        } else {
            batteryGuessButtonPortraitConstraints = [
                batteryGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.gameButtonPadding / 2),
                batteryGuessButton.centerXAnchor.constraint(equalTo: wordGuessButton.centerXAnchor, constant: -offset),
                batteryGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                batteryGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(batteryGuessButtonPortraitConstraints)
        }
    }
    
    // MARK: - 🔋 ▶️ 📜 🙅🏻‍♂️
    private func deactivateBatteryGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(batteryGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(batteryGuessButtonLandscapeConstraints)
        batteryGuessButtonPortraitConstraints.removeAll()
        batteryGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🔋 ▶️ 👇
    @objc private func didTapBatteryGuessButton(sender: UIButton) {
        Model.shared.appState = .batteryGuess
        updateConstraints()
        containerDelegate.didTapBatteryGuessButton()
    }
    
    // MARK: - 🔋 🪟
    private func addBatteryGuessView() {
//        batteryGuessView.batteryGuessViewDelegate = self
        addSubview(batteryGuessView)
        activateBatteryGuessViewConstraints(isLandscape: false)
    }
    
    // MARK: - 🔋 🪟 🔄
    private func updateBatteryGuessView(isLandscape: Bool) {
        activateBatteryGuessViewConstraints(isLandscape: isLandscape)
        batteryGuessView.updateConstraints()
    }
    
    // MARK: - 🔋 🪟 📜
    private func activateBatteryGuessViewConstraints(isLandscape: Bool) {
        deactivateBatteryGuessViewConstraints()
        let offset = Model.shared.appState == .batteryGuess ? 0 : UIScreen.main.bounds.width * 2
        if isLandscape {
            batteryGuessLandscapeConstraints = [
                batteryGuessView.topAnchor.constraint(equalTo: topAnchor),
                batteryGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                batteryGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                batteryGuessView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
            NSLayoutConstraint.activate(batteryGuessLandscapeConstraints)
        } else {
            batteryGuessPortraitConstraints = [
                batteryGuessView.topAnchor.constraint(equalTo: topAnchor),
                batteryGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                batteryGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                batteryGuessView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
            NSLayoutConstraint.activate(batteryGuessPortraitConstraints)
        }
    }
    
    // MARK: - 🔋 🪟 📜 🙅🏻‍♂️
    private func deactivateBatteryGuessViewConstraints() {
        NSLayoutConstraint.deactivate(batteryGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(batteryGuessLandscapeConstraints)
        batteryGuessPortraitConstraints.removeAll()
        batteryGuessLandscapeConstraints.removeAll()
    }

    // MARK: - 🎶 ▶️
    private func addSongGuessButton() {
        songGuessButton.addTarget(self, action: #selector(didTapSongGuessButton(sender:)), for: .touchUpInside)
        songGuessButton.setImage(songGuessButtonImage(), for: .normal)
        addSubview(songGuessButton)
        activateSongGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🎶 ▶️ 🔄
    private func updateSongGuessButton(isLandscape: Bool) {
        activateSongGuessButtonConstraints(isLandscape: isLandscape)
        songGuessButton.setImage(songGuessButtonImage(), for: .normal)
    }
    
    // MARK: - 🎶 ▶️ 🌄
    private func songGuessButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "music.quarternote.3",
            size: Frame.buttonSize,
            weight: .regular,
            color: .gameButtonDisabled)
    }
    
    // MARK: - 🎶 ▶️ 📜
    private func activateSongGuessButtonConstraints(isLandscape: Bool) {
        deactivateSongGuessButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            songGuessButtonLandscapeConstraints = [
                songGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.bigPadding),
                songGuessButton.centerXAnchor.constraint(equalTo: ticTacToeButton.centerXAnchor, constant: -offset),
                songGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                songGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(songGuessButtonLandscapeConstraints)
        } else {
            songGuessButtonPortraitConstraints = [
                songGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.gameButtonPadding / 2),
                songGuessButton.centerXAnchor.constraint(equalTo: ticTacToeButton.centerXAnchor, constant: -offset),
                songGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                songGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(songGuessButtonPortraitConstraints)
        }
    }
    
    // MARK: - 🎶 ▶️ 📜 🙅🏻‍♂️
    private func deactivateSongGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(songGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(songGuessButtonLandscapeConstraints)
        songGuessButtonPortraitConstraints.removeAll()
        songGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🎶 ▶️ 👇
    @objc private func didTapSongGuessButton(sender: UIButton) {
        songGuessButton.shake()
    }
    
    // MARK: - 🌎 ▶️
    private func addPlaceGuessButton() {
        placeGuessButton.addTarget(self, action: #selector(didTapPlaceGuessButton(sender:)), for: .touchUpInside)
        placeGuessButton.setImage(placeGuessButtonImage(), for: .normal)
        addSubview(placeGuessButton)
        activatePlaceGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🌎 ▶️ 🔄
    private func updatePlaceGuessButton(isLandscape: Bool) {
        activatePlaceGuessButtonConstraints(isLandscape: isLandscape)
        placeGuessButton.setImage(placeGuessButtonImage(), for: .normal)
    }
    
    // MARK: - 🌎 ▶️ 🌄
    private func placeGuessButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "globe.americas.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .gameButtonDisabled)
    }
    
    // MARK: - 🌎 ▶️ 📜
    private func activatePlaceGuessButtonConstraints(isLandscape: Bool) {
        deactivatePlaceGuessButtonConstraints()
        let doubleWidth = UIScreen.main.bounds.width * 2
        let offset = Model.shared.appState == .container ? 0 : doubleWidth
        if isLandscape {
            placeGuessButtonLandscapeConstraints = [
                placeGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.bigPadding),
                placeGuessButton.centerXAnchor.constraint(equalTo: dotsButton.centerXAnchor, constant: -offset),
                placeGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                placeGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(placeGuessButtonLandscapeConstraints)
        } else {
            placeGuessButtonPortraitConstraints = [
                placeGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Frame.gameButtonPadding / 2),
                placeGuessButton.centerXAnchor.constraint(equalTo: dotsButton.centerXAnchor, constant: -offset),
                placeGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                placeGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(placeGuessButtonPortraitConstraints)
        }
    }
    
    // MARK: - 🌎 ▶️ 📜 🙅🏻‍♂️
    private func deactivatePlaceGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(placeGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(placeGuessButtonLandscapeConstraints)
        placeGuessButtonPortraitConstraints.removeAll()
        placeGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🌎 ▶️ 👇
    @objc private func didTapPlaceGuessButton(sender: UIButton) {
        placeGuessButton.shake()
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
