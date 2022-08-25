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
    func didTapTTTSquareButton()
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
    
    var fiveLetterGuessView = FiveLetterGuessView()
    private var fiveLetterGuessPortraitConstraints: [NSLayoutConstraint] = []
    private var fiveLetterGuessLandscapeConstraints: [NSLayoutConstraint] = []
    
    var ticTacToeView = TicTacToeView()
    private var ticTacToePortraitConstraints: [NSLayoutConstraint] = []
    private var ticTacToeLandscapeConstraints: [NSLayoutConstraint] = []

    private var smallLogoView = SmallLogoView(frame: .zero)
    private var smallLogoPortraitConstraints: [NSLayoutConstraint] = []
    private var smallLogoLandscapeConstraints: [NSLayoutConstraint] = []

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

        updateLogoView(isLandscape: isLandscape)
        updateFiveLetterGuessButton(isLandscape: isLandscape)
        updateTicTacToeButton(isLandscape: isLandscape)
        updateDotsButton(isLandscape: isLandscape)
        updateFiveLetterGuessView(isLandscape: isLandscape)
        updateTicTacToeView(isLandscape: isLandscape)
        activateSmallLogoViewConstraints(isLandscape: isLandscape)

        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
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
                logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: (Frame.Logo.upperPadding * 3) + offset),
                logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
                logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
            ]
            NSLayoutConstraint.activate(logoLandscapeConstraints)
        } else {
            logoPortraitConstraints = [
                logoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                logoView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
                logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.targetTallSizeBigger.width),
                logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.targetTallSizeBigger.height)
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
        let offset = Model.shared.appState == .fiveLetterGuess || Model.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width * 2
        if isLandscape {
            smallLogoLandscapeConstraints = [
                smallLogoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
                smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
                smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
            ]
            var leadingConstraint: NSLayoutConstraint {
                if Model.shared.appState == .fiveLetterGuess {
                    return smallLogoView.leadingAnchor.constraint(equalTo: fiveLetterGuessView.gridView.trailingAnchor, constant: Frame.Logo.upperPadding - offset)
                } else if Model.shared.appState == .ticTacToe {
                    return smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
                } else {
                    return smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
                }
            }
            smallLogoLandscapeConstraints.append(leadingConstraint)
            NSLayoutConstraint.activate(smallLogoLandscapeConstraints)
        } else {
            smallLogoPortraitConstraints = [
                smallLogoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
                smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
                smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
            ]
            var leadingConstraint: NSLayoutConstraint {
                if Model.shared.appState == .fiveLetterGuess {
                    return smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
                } else if Model.shared.appState == .ticTacToe {
                    return smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
                } else {
                    return smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
                }
            }
            smallLogoPortraitConstraints.append(leadingConstraint)
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
                fiveLetterGuessButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.sliderTopPadding),
                fiveLetterGuessButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.gamePadding + offset),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(fiveLetterGuessButtonLandscapeConstraints)
        } else {
            fiveLetterGuessButtonPortraitConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                fiveLetterGuessButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.gamePadding - offset),
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
    }
    
    // MARK: - 🅰️ 🪟
    private func addFiveLetterGuessView() {
        fiveLetterGuessView = FiveLetterGuessView(frame: .zero)
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
        let offset = Model.shared.appState == .container ? 0 : UIScreen.main.bounds.width * 3
        if isLandscape {
            ticTacToeButtonLandscapeConstraints = [
                ticTacToeButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.sliderTopPadding),
                ticTacToeButton.leadingAnchor.constraint(equalTo: fiveLetterGuessButton.trailingAnchor, constant: Frame.gamePadding + offset),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
        } else {
            ticTacToeButtonPortraitConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                ticTacToeButton.leadingAnchor.constraint(equalTo: fiveLetterGuessButton.trailingAnchor, constant: Frame.gamePadding + offset),
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
    }
    
    // MARK: - ❌ 🪟
    private func addTicTacToeView() {
        ticTacToeView = TicTacToeView(frame: .zero)
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
                dotsButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.sliderTopPadding),
                dotsButton.leadingAnchor.constraint(equalTo: ticTacToeButton.trailingAnchor, constant: Frame.gamePadding + offset),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(dotsButtonLandscapeConstraints)
        } else {
            dotsButtonPortraitConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                dotsButton.leadingAnchor.constraint(equalTo: ticTacToeButton.trailingAnchor, constant: Frame.gamePadding + offset),
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
}

extension ContainerView: SmallLogoViewDelegate {
    
    // MARK: - 🅱️ ▶️ 👇
    func didTapLogoButton() {
        containerDelegate.didTapLogoButton()
    }
}

extension ContainerView: FiveLetterGuessDelegate {
    
    // MARK: - ⤴️ ▶️ 👇
    func didTapSendButton() {
        containerDelegate.didTapSendButton()
    }
    
    // MARK: - 📈 ▶️ 👇
    func didTapStatsButton() {
        updateConstraints()
    }
    
    // MARK: - 🔢 ▶️ 👇
    func didTapGridButton() {
        updateConstraints()
    }
}

extension ContainerView: TicTacToeViewDelegate {
    
    // MARK: - 🔳 ▶️ 👇
    func didTapSquareButton() {
        containerDelegate.didTapTTTSquareButton()
    }
}
