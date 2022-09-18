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
    func didTapFiveLetterGuessButton()
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
    
    private var fiveLetterGuessButton = UIButton(frame: .zero)
    private var fiveLetterGuessButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var ticTacToeButton = UIButton(frame: .zero)
    private var ticTacToeButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var dotsButton = UIButton(frame: .zero)
    private var dotsButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var dotsButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    var fiveLetterGuessView = FiveLetterGuessView(frame: .zero)
    private var fiveLetterGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessLandscapeConstraints: [NSLayoutConstraint] = []
    
    var ticTacToeView = TicTacToeView(frame: .zero)
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []

    private var smallLogoView = SmallLogoView(frame: .zero)
    private var smallLogoPortraitConstraints: [NSLayoutConstraint] = []
    private var smallLogoLandscapeConstraints: [NSLayoutConstraint] = []

    private var debugView = DebugView(frame: .zero)
    private var debugViewPortraitConstraints: [NSLayoutConstraint] = []
    private var debugViewLandscapeConstraints: [NSLayoutConstraint] = []

    // MARK: - 1️⃣
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .containerBackground
        addLogoView()
        addFiveLetterGuessButton()
        addTicTacToeButton()
        addDotsButton()
        addFiveLetterGuessView()
        addTicTacToeView()
        addDebugView()
        addSmallLogoView()
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
        updateFiveLetterGuessButton(isLandscape: isLandscape)
        updateTicTacToeButton(isLandscape: isLandscape)
        updateDotsButton(isLandscape: isLandscape)
        updateFiveLetterGuessView(isLandscape: isLandscape)
        updateTicTacToeView(isLandscape: isLandscape)
        activateSmallLogoViewConstraints(isLandscape: isLandscape)
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
        case .fiveLetterGuess:
            newColor = .fiveLetterGuessBackground
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
        let flgOffset = Model.shared.fiveLetterGuessState == .grid ? 0 : UIScreen.main.bounds.width
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
            case .fiveLetterGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: fiveLetterGuessView.gridView.trailingAnchor, constant: Frame.Logo.upperPadding - flgOffset)
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
            case .fiveLetterGuess:
                let leadingConstraint = smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - flgOffset)
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
    private func addFiveLetterGuessButton() {
        fiveLetterGuessButton.translatesAutoresizingMaskIntoConstraints = false
        fiveLetterGuessButton.addTarget(self, action: #selector(didTapFiveLetterGuessButton(sender:)), for: .touchUpInside)
        if let image = UIImage.fiveLetterGuess {
            fiveLetterGuessButton.setImage(image, for: .normal)
        }
        fiveLetterGuessButton.setTitleColor(.clear, for: .normal)
        addSubview(fiveLetterGuessButton)
        activateFiveLetterGuessButtonConstraints(isLandscape: false)
    }
    
    // MARK: - 🅰️ ▶️ 🔄
    private func updateFiveLetterGuessButton(isLandscape: Bool) {
        activateFiveLetterGuessButtonConstraints(isLandscape: isLandscape)
        if let image = UIImage.fiveLetterGuess {
            fiveLetterGuessButton.setImage(image, for: .normal)
        }
        fiveLetterGuessView.updateConstraints()
    }
    
    // MARK: - 🅰️ ▶️ 📜
    private func activateFiveLetterGuessButtonConstraints(isLandscape: Bool) {
        deactivateFiveLetterGuessButtonConstraints()
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.width * 2
        if isLandscape {
            fiveLetterGuessButtonLandscapeConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.gameButtonPadding - offset),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(fiveLetterGuessButtonLandscapeConstraints)
        } else {
            fiveLetterGuessButtonPortraitConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.gameButtonPadding - offset),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(fiveLetterGuessButtonPortraitConstraints)
        }
    }
    
    // MARK: - 🅰️ ▶️ 📜 🙅🏻‍♂️
    private func deactivateFiveLetterGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        fiveLetterGuessButtonPortraitConstraints.removeAll()
        fiveLetterGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - 🅰️ ▶️ 👇
    @objc private func didTapFiveLetterGuessButton(sender: UIButton) {
        Model.shared.appState = .fiveLetterGuess
        updateConstraints()
        containerDelegate.didTapFiveLetterGuessButton()
    }
    
    // MARK: - 🅰️ 🪟
    private func addFiveLetterGuessView() {
        fiveLetterGuessView.fiveLetterGuessDelegate = self
        addSubview(fiveLetterGuessView)
        activateFiveLetterGuessViewConstraints(isLandscape: false)
    }
    
    // MARK: - 🅰️ 🪟 🔄
    private func updateFiveLetterGuessView(isLandscape: Bool) {
        activateFiveLetterGuessViewConstraints(isLandscape: isLandscape)
        fiveLetterGuessView.updateConstraints()
    }
    
    // MARK: - 🅰️ 🪟 📜
    private func activateFiveLetterGuessViewConstraints(isLandscape: Bool) {
        deactivateFiveLetterGuessViewConstraints()
        let offset = Model.shared.appState == .fiveLetterGuess ? 0 : -UIScreen.main.bounds.width
        if isLandscape {
            fiveLetterGuessLandscapeConstraints = [
                fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
                fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
            ]
            NSLayoutConstraint.activate(fiveLetterGuessLandscapeConstraints)
        } else {
            fiveLetterGuessPortraitConstraints = [
                fiveLetterGuessView.topAnchor.constraint(equalTo: topAnchor),
                fiveLetterGuessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                fiveLetterGuessView.bottomAnchor.constraint(equalTo: bottomAnchor),
                fiveLetterGuessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset)
            ]
            NSLayoutConstraint.activate(fiveLetterGuessPortraitConstraints)
        }
    }
    
    // MARK: - 🅰️ 🪟 📜 🙅🏻‍♂️
    private func deactivateFiveLetterGuessViewConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessLandscapeConstraints)
        fiveLetterGuessPortraitConstraints.removeAll()
        fiveLetterGuessLandscapeConstraints.removeAll()
    }
    
    // MARK: - ❌ ▶️
    private func addTicTacToeButton() {
        ticTacToeButton.translatesAutoresizingMaskIntoConstraints = false
        ticTacToeButton.addTarget(self, action: #selector(didTapTicTacToeButton(sender:)), for: .touchUpInside)
        if let image = UIImage.ticTacToe {
            ticTacToeButton.setImage(image, for: .normal)
        }
        ticTacToeButton.setTitleColor(.clear, for: .normal)
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
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.width * 2
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
        dotsButton.isUserInteractionEnabled = false
        dotsButton.translatesAutoresizingMaskIntoConstraints = false
        dotsButton.addTarget(self, action: #selector(didTapDotsButton(sender:)), for: .touchUpInside)
        if let image = UIImage.fiveLetterGuess {
            dotsButton.setImage(image, for: .normal)
        }
        dotsButton.setTitleColor(.clear, for: .normal)
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
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.width * 2
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
        Model.shared.appState = .dots
        updateConstraints()
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

extension ContainerView: FiveLetterGuessDelegate {
    
    // MARK: - ⤴️ ▶️ 👇
    func didTapFLGSendButton() {
        containerDelegate.didTapSendButton()
    }
    
    // MARK: - 📈 ▶️ 👇
    func didTapFLGStatsButton() {
        updateConstraints()
    }
    
    // MARK: - 🔢 ▶️ 👇
    func didTapFLGGridButton() {
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
