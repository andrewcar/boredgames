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
}

class ContainerView: UIView {
    
    // MARK: - Properties
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

    // MARK: - Initializers
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
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        updateBackgroundColor()
        
        // portrait
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height {
            activateLogoPortraitConstraints()
            
            updateFiveLetterGuessButton(isLandscape: false)
            updateTicTacToeButton(isLandscape: false)
            updateDotsButton(isLandscape: false)
            
            activateFiveLetterGuessViewPortraitConstraints()
            fiveLetterGuessView.updateConstraints()
            
            activateTicTacToeViewPortraitConstraints()
            ticTacToeView.updateConstraints()
            
            activateSmallLogoPortraitConstraints()

        // landscape
        } else {
            activateLogoLandscapeConstraints()
                        
            updateFiveLetterGuessButton(isLandscape: true)
            updateTicTacToeButton(isLandscape: true)
            updateDotsButton(isLandscape: true)

            activateFiveLetterGuessViewLandscapeConstraints()
            fiveLetterGuessView.updateConstraints()
            
            activateTicTacToeViewLandscapeConstraints()
            ticTacToeView.updateConstraints()
            
            activateSmallLogoLandscapeConstraints()
        }
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - UPDATE BACKGROUND COLOR
    private func updateBackgroundColor() {
        var newColor: UIColor?
        switch GameModel.shared.appState {
        case .container:
            if let color = UIColor(named: "containerBackground") {
                newColor = color
            }
        case .fiveLetterGuess:
            if let color = UIColor(named: "fiveLetterGuessBackground") {
                newColor = color
            }
        case .ticTacToe:
            if let color = UIColor(named: "ticTacToe") {
                newColor = color
            }
        case .dots:
            if let color = UIColor(named: "dots") {
                newColor = color
            }
        }
        guard let newColor = newColor else { return }
        UIView.animate(withDuration: 0.426, delay: 0, options: .curveEaseOut) {
            self.backgroundColor = newColor
        } completion: { _ in
        }
    }
    
    // MARK: - LOGO VIEW
    private func addLogoView() {
        addSubview(logoView)
        activateLogoPortraitConstraints()
    }
    
    // MARK: - LOGO PORTRAIT CONSTRAINTS
    private func activateLogoPortraitConstraints() {
        deactivateLogoConstraints()
        let offset = GameModel.shared.appState == .container ? 0 : -UIScreen.main.bounds.width
        logoPortraitConstraints = [
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
            logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.tallSize.width),
            logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.tallSize.height)
        ]
        NSLayoutConstraint.activate(logoPortraitConstraints)
        logoView.updateConstraints()
    }
    
    // MARK: - LOGO LANDSCAPE CONSTRAINTS
    private func activateLogoLandscapeConstraints() {
        deactivateLogoConstraints()
        let offset = GameModel.shared.appState == .container ? 0 : -UIScreen.main.bounds.width
        logoLandscapeConstraints = [
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding + offset),
            logoView.widthAnchor.constraint(equalToConstant: Frame.Logo.tallSize.width),
            logoView.heightAnchor.constraint(equalToConstant: Frame.Logo.tallSize.height)
        ]
        NSLayoutConstraint.activate(logoLandscapeConstraints)
        logoView.updateConstraints()
    }
    
    // MARK: - DEACTIVATE LOGO CONSTRAINTS
    private func deactivateLogoConstraints() {
        NSLayoutConstraint.deactivate(logoPortraitConstraints)
        NSLayoutConstraint.deactivate(logoLandscapeConstraints)
        logoPortraitConstraints.removeAll()
        logoLandscapeConstraints.removeAll()
    }
    
    // MARK: - SMALL LOGO VIEW
    private func addSmallLogoView() {
        smallLogoView.smallLogoDelegate = self
        addSubview(smallLogoView)
        activateSmallLogoPortraitConstraints()
    }
    
    // MARK: - SMALL LOGO PORTRAIT CONSTRAINTS
    private func activateSmallLogoPortraitConstraints() {
        deactivateSmallLogoConstraints()
        let offset = GameModel.shared.appState == .fiveLetterGuess || GameModel.shared.appState == .ticTacToe ? 0 : -UIScreen.main.bounds.width
        smallLogoPortraitConstraints = [
            smallLogoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
            smallLogoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding + offset),
            smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
            smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
        ]
        NSLayoutConstraint.activate(smallLogoPortraitConstraints)
        smallLogoView.updateConstraints()
    }
    
    // MARK: - SMALL LOGO LANDSCAPE CONSTRAINTS
    private func activateSmallLogoLandscapeConstraints() {
        deactivateSmallLogoConstraints()
        let offset = GameModel.shared.appState == .fiveLetterGuess || GameModel.shared.appState == .ticTacToe ? 0 : UIScreen.main.bounds.width
        smallLogoLandscapeConstraints = [
            smallLogoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding + Frame.padding),
            smallLogoView.leadingAnchor.constraint(equalTo: fiveLetterGuessView.gridView.trailingAnchor, constant: (Frame.padding * 2) + offset),
            smallLogoView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
            smallLogoView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
        ]
        NSLayoutConstraint.activate(smallLogoLandscapeConstraints)
        smallLogoView.updateConstraints()
    }
    
    // MARK: - DEACTIVATE SMALL LOGO CONSTRAINTS
    private func deactivateSmallLogoConstraints() {
        NSLayoutConstraint.deactivate(smallLogoPortraitConstraints)
        NSLayoutConstraint.deactivate(smallLogoLandscapeConstraints)
        smallLogoPortraitConstraints.removeAll()
        smallLogoLandscapeConstraints.removeAll()
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON
    private func addFiveLetterGuessButton() {
        fiveLetterGuessButton.translatesAutoresizingMaskIntoConstraints = false
        fiveLetterGuessButton.addTarget(self, action: #selector(didTapFiveLetterGuessButton(sender:)), for: .touchUpInside)
        if let image = UIImage.fiveLetterGuess {
            fiveLetterGuessButton.setImage(image, for: .normal)
        }
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
        if let image = UIImage.fiveLetterGuess {
            fiveLetterGuessButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: - FIVE LETTER GUESS BUTTON PORTRAIT CONSTRAINTS
    private func activateFiveLetterGuessButtonPortraitConstraints() {
        deactivateFiveLetterGuessButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            fiveLetterGuessButtonPortraitConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -(Frame.buttonSize.width * 2)),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            fiveLetterGuessButtonPortraitConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - Frame.Container.gamePadding - (UIScreen.main.bounds.width * 2)),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(fiveLetterGuessButtonPortraitConstraints)
    }

    // MARK: - FIVE LETTER GUESS BUTTON LANDSCAPE CONSTRAINTS
    func activateFiveLetterGuessButtonLandscapeConstraints() {
        deactivateFiveLetterGuessButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            fiveLetterGuessButtonLandscapeConstraints = [
                fiveLetterGuessButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding * 2),
                fiveLetterGuessButton.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: Frame.Logo.upperPadding + Frame.Container.gamePadding),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            fiveLetterGuessButtonLandscapeConstraints = [
                fiveLetterGuessButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                fiveLetterGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - UIScreen.main.bounds.width * 2),
                fiveLetterGuessButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                fiveLetterGuessButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(fiveLetterGuessButtonLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE FIVE LETTER GUESS BUTTON CONSTRAINTS
    private func deactivateFiveLetterGuessButtonConstraints() {
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(fiveLetterGuessButtonLandscapeConstraints)
        fiveLetterGuessButtonPortraitConstraints.removeAll()
        fiveLetterGuessButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP FIVE LETTER GUESS BUTTON
    @objc private func didTapFiveLetterGuessButton(sender: UIButton) {
        GameModel.shared.appState = .fiveLetterGuess
        
        updateConstraints()
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
    
    // MARK: - TIC TAC TOE BUTTON
    private func addTicTacToeButton() {
        ticTacToeButton.translatesAutoresizingMaskIntoConstraints = false
        ticTacToeButton.addTarget(self, action: #selector(didTapTicTacToeButton(sender:)), for: .touchUpInside)
        if let image = UIImage.ticTacToe {
            ticTacToeButton.setImage(image, for: .normal)
        }
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
        if let image = UIImage.ticTacToe {
            ticTacToeButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: - TIC TAC TOE BUTTON PORTRAIT CONSTRAINTS
    private func activateTicTacToeButtonPortraitConstraints() {
        deactivateTicTacToeButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            ticTacToeButtonPortraitConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            ticTacToeButtonPortraitConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: UIScreen.main.bounds.width * 2),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(ticTacToeButtonPortraitConstraints)
    }

    // MARK: - TIC TAC TOE BUTTON LANDSCAPE CONSTRAINTS
    func activateTicTacToeButtonLandscapeConstraints() {
        deactivateTicTacToeButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            ticTacToeButtonLandscapeConstraints = [
                ticTacToeButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding * 2),
                ticTacToeButton.leadingAnchor.constraint(equalTo: fiveLetterGuessButton.trailingAnchor, constant: Frame.Container.gamePadding),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            ticTacToeButtonLandscapeConstraints = [
                ticTacToeButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                ticTacToeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width + (UIScreen.main.bounds.width * 2)),
                ticTacToeButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                ticTacToeButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(ticTacToeButtonLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE TIC TAC TOE BUTTON CONSTRAINTS
    private func deactivateTicTacToeButtonConstraints() {
        NSLayoutConstraint.deactivate(ticTacToeButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(ticTacToeButtonLandscapeConstraints)
        ticTacToeButtonPortraitConstraints.removeAll()
        ticTacToeButtonLandscapeConstraints.removeAll()
    }

    // MARK: - DID TAP TIC TAC TOE BUTTON
    @objc private func didTapTicTacToeButton(sender: UIButton) {
        GameModel.shared.appState = .ticTacToe
        updateConstraints()
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
    
    // MARK: - DOTS BUTTON
    private func addDotsButton() {
        dotsButton.translatesAutoresizingMaskIntoConstraints = false
        dotsButton.addTarget(self, action: #selector(didTapDotsButton(sender:)), for: .touchUpInside)
        if let image = UIImage.fiveLetterGuess {
            dotsButton.setImage(image, for: .normal)
        }
        dotsButton.setTitleColor(.clear, for: .normal)
        addSubview(dotsButton)
        activateDotsButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE DOTS BUTTON
    private func updateDotsButton(isLandscape: Bool) {
        if isLandscape {
            activateDotsButtonLandscapeConstraints()
        } else {
            activateDotsButtonPortraitConstraints()
        }
        if let image = UIImage.dots {
            dotsButton.setImage(image, for: .normal)
        }
    }
    
    // MARK: - DOTS BUTTON PORTRAIT CONSTRAINTS
    private func activateDotsButtonPortraitConstraints() {
        deactivateDotsButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            dotsButtonPortraitConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.buttonSize.width * 2),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            dotsButtonPortraitConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - (UIScreen.main.bounds.width * 2)),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(dotsButtonPortraitConstraints)
    }

    // MARK: - DOTS BUTTON LANDSCAPE CONSTRAINTS
    func activateDotsButtonLandscapeConstraints() {
        deactivateDotsButtonConstraints()
        switch GameModel.shared.appState {
        case .container:
            dotsButtonLandscapeConstraints = [
                dotsButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding * 2),
                dotsButton.leadingAnchor.constraint(equalTo: ticTacToeButton.trailingAnchor, constant: Frame.Container.gamePadding),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        default:
            dotsButtonLandscapeConstraints = [
                dotsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Container.buttonCenterYOffset),
                dotsButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.buttonSize.width - UIScreen.main.bounds.width * 2),
                dotsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                dotsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
        }
        NSLayoutConstraint.activate(dotsButtonLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE DOTS BUTTON CONSTRAINTS
    private func deactivateDotsButtonConstraints() {
        NSLayoutConstraint.deactivate(dotsButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(dotsButtonLandscapeConstraints)
        dotsButtonPortraitConstraints.removeAll()
        dotsButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP DOTS BUTTON
    @objc private func didTapDotsButton(sender: UIButton) {
        GameModel.shared.appState = .dots
        
        updateConstraints()
    }
}

extension ContainerView: SmallLogoViewDelegate {
    func didTapLogo() {
        containerDelegate.didTapLogoButton()
    }
}

extension ContainerView: FiveLetterGuessDelegate {
    func didTapSendButton() {
        containerDelegate.didTapSendButton()
    }
    
    func didTapStatsButton() {
        updateConstraints()
    }
    
    func didTapGridButton() {
        updateConstraints()
    }
}
