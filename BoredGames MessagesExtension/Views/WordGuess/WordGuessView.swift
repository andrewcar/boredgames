//
//  WordGuessView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/9/22.
//

import UIKit

protocol WordGuessDelegate {
    func didTapWGSendButton()
    func didTapWGStatsButton()
    func didTapWGGridButton()
}

class WordGuessView: UIView {
    
    // MARK: - Properties
    var wordGuessDelegate: WordGuessDelegate!
    
    private var notInWordListView = NotInWordListView(frame: .zero)
    private var notInWordListPortraitConstraints: [NSLayoutConstraint] = []
    private var notInWordListLandscapeConstraints: [NSLayoutConstraint] = []
    
    var gridView = FiveLetterGridView(frame: .zero)
    private var gridViewPortraitConstraints: [NSLayoutConstraint] = []
    private var gridViewLandscapeConstraints: [NSLayoutConstraint] = []
        
    private var successView = SuccessView(frame: .zero)
    private var successPortraitConstraints: [NSLayoutConstraint] = []
    private var successLandscapeConstraints: [NSLayoutConstraint] = []
    
    var keyboardView = KeyboardView(frame: .zero)
    private var keyboardPortraitConstraints: [NSLayoutConstraint] = []
    private var keyboardLandscapeConstraints: [NSLayoutConstraint] = []
        
    private var infoButton = UIButton(frame: .zero)
    private var infoButtonPortraitConstraints: [NSLayoutConstraint] = []
    private var infoButtonLandscapeConstraints: [NSLayoutConstraint] = []
    var infoButtonShowing = true
    
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
    
    private var statsView = WGStatsView(frame: .zero)
    private var statsViewPortraitConstraints: [NSLayoutConstraint] = []
    private var statsViewLandscapeConstraints: [NSLayoutConstraint] = []
    
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
    
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        if Model.shared.isLandscape {
            activateGridViewLandscapeConstraints()
            activateNotInWordListLandscapeConstraints()
            activateKeyboardConstraints(isLandscape: true)
            keyboardView.updateSubviews(isLandscape: true, gridWidth: gridWidth)
            activateInfoButtonLandscapeConstraints()
            updateStatsButton(isLandscape: true)
            activateStatsViewLandscapeConstraints()
            statsView.updateConstraints()
            updateNewGameButton(isLandscape: true)
            activateSuccessLandscapeConstraints()
            updateGridButton(isLandscape: true)
        } else {
            activateGridViewPortraitConstraints()
            activateNotInWordListPortraitConstraints()
            activateKeyboardConstraints(isLandscape: false)
            keyboardView.updateSubviews(isLandscape: false, gridWidth: gridWidth)
            activateInfoButtonPortraitConstraints()
            updateStatsButton(isLandscape: false)
            activateStatsViewPortraitConstraints()
            statsView.updateConstraints()
            updateNewGameButton(isLandscape: false)
            activateSuccessPortraitConstraints()
            updateGridButton(isLandscape: false)
        }
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addGridView()
        addKeyboardView()
        addSuccessView()
        addNotInWordListView()
        addInfoButton()
        addNewGameButton()
        addStatsButton()
        addStatsView()
        addGridButton()
    }
    
    // MARK: - NOT IN WORD LIST
    private func addNotInWordListView() {
        addSubview(notInWordListView)
        activateNotInWordListPortraitConstraints()
    }
    
    // MARK: - NOT IN WORD LIST PORTRAIT CONSTRAINTS
    private func activateNotInWordListPortraitConstraints() {
        deactivateNotInWordListConstraints()
        notInWordListPortraitConstraints = [
            notInWordListView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.smallSize.height + Frame.Logo.upperPadding),
            notInWordListView.centerXAnchor.constraint(equalTo: centerXAnchor),
            notInWordListView.widthAnchor.constraint(equalToConstant: Frame.NotInWordList.size.width),
            notInWordListView.heightAnchor.constraint(equalToConstant: Frame.NotInWordList.size.height)
        ]
        NSLayoutConstraint.activate(notInWordListPortraitConstraints)
    }
    
    // MARK: - NOT IN WORD LIST LANDSCAPE CONSTRAINTS
    private func activateNotInWordListLandscapeConstraints() {
        deactivateNotInWordListConstraints()
        notInWordListLandscapeConstraints = [
            notInWordListView.topAnchor.constraint(equalTo: keyboardView.topAnchor, constant: -(Frame.NotInWordList.size.height / 2)),
            notInWordListView.centerXAnchor.constraint(equalTo: keyboardView.centerXAnchor, constant: -Frame.Grid.upperPadding),
            notInWordListView.widthAnchor.constraint(equalToConstant: Frame.NotInWordList.size.width),
            notInWordListView.heightAnchor.constraint(equalToConstant: Frame.NotInWordList.size.height)
        ]
        NSLayoutConstraint.activate(notInWordListLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE NOT IN WORD LIST CONSTRAINTS
    private func deactivateNotInWordListConstraints() {
        NSLayoutConstraint.deactivate(notInWordListPortraitConstraints)
        NSLayoutConstraint.deactivate(notInWordListLandscapeConstraints)
        notInWordListPortraitConstraints.removeAll()
        notInWordListLandscapeConstraints.removeAll()
    }
    
    // MARK: - GRID VIEW
    private func addGridView() {
        gridView.gridDelegate = self
        addSubview(gridView)
        activateGridViewPortraitConstraints()
    }
    
    private var gridWidth: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return frame.width * 0.5
        } else {
            return frame.width * 0.7
        }
    }
        
    // MARK: - GRID VIEW PORTRAIT CONSTRAINTS
    private func activateGridViewPortraitConstraints() {
        deactivateGridViewConstraints()
        
        let scaledPadding = (Frame.padding / 3) * 2
        let size = Frame.Grid.wordGuessSize(gridWidth, scaledPadding: scaledPadding)
        let offset = Model.shared.appState == .wordGuess && Model.shared.wordGuessState == .grid ? 0 : -UIScreen.main.bounds.width

        gridViewPortraitConstraints = [
            gridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.smallSize.height + Frame.Logo.upperPadding),
            gridView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
            gridView.widthAnchor.constraint(equalToConstant: size.width),
            gridView.heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(gridViewPortraitConstraints)
        
        gridView.activateLetterPortraitConstraints()
        gridView.updateGridLetterColors()
        gridView.activateDotConstraints()
    }
    
    // MARK: - GRID VIEW LANDSCAPE CONSTRAINTS
    private func activateGridViewLandscapeConstraints() {
        deactivateGridViewConstraints()
        
        let multiplier: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 0.7 : 1
        let oneSixthSansPadding: CGFloat = ((UIScreen.main.bounds.height * multiplier) - (Frame.padding * 10)) / 6
        let gridWidth = (oneSixthSansPadding * 5) - (Frame.padding * 2)
        let offset = Model.shared.appState == .wordGuess && Model.shared.wordGuessState == .grid ? 0 : UIScreen.main.bounds.width

        gridViewLandscapeConstraints = [
            gridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding * 3),
            gridView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: (Frame.padding * 3) + Frame.Grid.dotGirth - offset),
            gridView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gridView.widthAnchor.constraint(equalToConstant: gridWidth)
        ]
        NSLayoutConstraint.activate(gridViewLandscapeConstraints)
        
        gridView.activateLetterLandscapeConstraints()
        gridView.updateGridLetterColors()
        gridView.activateDotConstraints()
    }
    
    // MARK: - DEACTIVATE GRID VIEW CONSTRAINTS
    private func deactivateGridViewConstraints() {
        NSLayoutConstraint.deactivate(gridViewPortraitConstraints)
        NSLayoutConstraint.deactivate(gridViewLandscapeConstraints)
        gridViewPortraitConstraints.removeAll()
        gridViewLandscapeConstraints.removeAll()
    }
    
    // MARK: - SUCCESS VIEW
    private func addSuccessView() {
        addSubview(successView)
        activateSuccessPortraitConstraints()
    }
    
    // MARK: - SUCCESS PORTRAIT CONSTRAINTS
    private func activateSuccessPortraitConstraints() {
        deactivateSuccessConstraints()
        successPortraitConstraints = [
            successView.widthAnchor.constraint(equalToConstant: Frame.Success.size.width),
            successView.heightAnchor.constraint(equalToConstant: Frame.Success.size.height),
            successView.bottomAnchor.constraint(equalTo: gridView.topAnchor, constant: -(Frame.padding * 2))
        ]
        let offset = Model.shared.wordGuessState == .grid ? 0 : -UIScreen.main.bounds.width
        let constraint = successView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset)
        successPortraitConstraints.append(constraint)
        NSLayoutConstraint.activate(successPortraitConstraints)
    }
    
    // MARK: - SUCCESS LANDSCAPE CONSTRAINTS
    private func activateSuccessLandscapeConstraints() {
        deactivateSuccessConstraints()
        successLandscapeConstraints = [
            successView.centerXAnchor.constraint(equalTo: keyboardView.centerXAnchor),
            successView.widthAnchor.constraint(equalToConstant: Frame.Success.size.width),
            successView.heightAnchor.constraint(equalToConstant: Frame.Success.size.height)
        ]
        let offset = Model.shared.wordGuessState == .grid ? 0 : -UIScreen.main.bounds.width
        let constraint = successView.bottomAnchor.constraint(equalTo: keyboardView.topAnchor, constant: -(Frame.padding * 2) + offset)
        successLandscapeConstraints.append(constraint)
        NSLayoutConstraint.activate(successLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE SUCCESS CONSTRAINTS
    private func deactivateSuccessConstraints() {
        NSLayoutConstraint.deactivate(successPortraitConstraints)
        NSLayoutConstraint.deactivate(successLandscapeConstraints)
        successPortraitConstraints.removeAll()
        successLandscapeConstraints.removeAll()
    }
    
    // MARK: - KEYBOARD VIEW
    private func addKeyboardView() {
        keyboardView.keyboardDelegate = self
        addSubview(keyboardView)
        activateKeyboardConstraints(isLandscape: false)
        keyboardView.activatePortraitConstraints()
    }
    
    // MARK: - KEYBOARD CONSTRAINTS
    private func activateKeyboardConstraints(isLandscape: Bool) {
        if isLandscape {
            deactivateKeyboardConstraints()
            let offset = Model.shared.wordGuessState == .grid ? 0 : (UIScreen.main.bounds.width * 2)
            keyboardLandscapeConstraints = [
                keyboardView.heightAnchor.constraint(equalTo: heightAnchor),
                keyboardView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.smallSize.height + (Frame.Logo.upperPadding * 2)),
                keyboardView.leadingAnchor.constraint(equalTo: gridView.trailingAnchor, constant: Frame.padding + offset),
                keyboardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
            ]
            NSLayoutConstraint.activate(keyboardLandscapeConstraints)
        } else {
            deactivateKeyboardConstraints()
            let letterSize = Frame.Keyboard.portraitLetterSize
            keyboardPortraitConstraints = [
                keyboardView.topAnchor.constraint(equalTo: gridView.bottomAnchor, constant: Frame.Logo.upperPadding * 2),
                keyboardView.heightAnchor.constraint(equalToConstant: (letterSize.height * 3) + (Frame.padding * 4))
            ]
            let offset = Model.shared.wordGuessState == .grid ? 0 : (UIScreen.main.bounds.width * 2)
            let centerXConstraint = keyboardView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset)
            keyboardPortraitConstraints.append(centerXConstraint)
            var widthConstraint: NSLayoutConstraint
            if UIDevice.current.userInterfaceIdiom == .pad {
                widthConstraint = keyboardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
            } else {
                widthConstraint = keyboardView.widthAnchor.constraint(equalTo: widthAnchor)
            }
            keyboardPortraitConstraints.append(widthConstraint)
            NSLayoutConstraint.activate(keyboardPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE KEYBOARD CONSTRAINTS
    private func deactivateKeyboardConstraints() {
        NSLayoutConstraint.deactivate(keyboardPortraitConstraints)
        NSLayoutConstraint.deactivate(keyboardLandscapeConstraints)
        keyboardPortraitConstraints.removeAll()
        keyboardLandscapeConstraints.removeAll()
    }
        
    // MARK: - INFO BUTTON
    private func addInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(didTapInfoButton(sender:)), for: .touchUpInside)
        infoButton.setImage(infoButtonImage(), for: .normal)
        infoButton.setTitleColor(.clear, for: .normal)
        addSubview(infoButton)
        activateInfoButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE INFO BUTTON
    private func updateInfoButton(isLandscape: Bool) {
        if isLandscape {
            activateInfoButtonLandscapeConstraints()
        } else {
            activateInfoButtonPortraitConstraints()
        }
        infoButton.setImage(infoButtonImage(), for: .normal)
    }
    
    // MARK: - INFO BUTTON IMAGE
    private func infoButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "info.circle.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .wordGuessButton)
    }
    
    // MARK: - INFO BUTTON PORTRAIT CONSTRAINTS
    private func activateInfoButtonPortraitConstraints() {
        deactivateInfoButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid && infoButtonShowing ? 0 : (UIScreen.main.bounds.width * 2)
        infoButtonPortraitConstraints = [
            infoButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            infoButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            infoButton.bottomAnchor.constraint(equalTo: gridView.bottomAnchor, constant: (Frame.Logo.upperPadding * 1.7)),
            infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
        ]
        NSLayoutConstraint.activate(infoButtonPortraitConstraints)
    }
    
    // MARK: - INFO BUTTON LANDSCAPE CONSTRAINTS
    func activateInfoButtonLandscapeConstraints() {
        deactivateInfoButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid && infoButtonShowing ? 0 : UIScreen.main.bounds.width
        infoButtonLandscapeConstraints = [
            infoButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            infoButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding + offset),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
        ]
        NSLayoutConstraint.activate(infoButtonLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE INFO BUTTON CONSTRAINTS
    private func deactivateInfoButtonConstraints() {
        NSLayoutConstraint.deactivate(infoButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(infoButtonLandscapeConstraints)
        infoButtonPortraitConstraints.removeAll()
        infoButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP INFO BUTTON
    @objc
    private func didTapInfoButton(sender: UIButton) {
        successView.showHints()
    }
    
    // MARK: - NEW GAME BUTTON
    private func addNewGameButton() {
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.addTarget(self, action: #selector(didTapNewGameButton(sender:)), for: .touchUpInside)
        newGameButton.setImage(newGameButtonImage(), for: .normal)
        newGameButton.setTitleColor(.clear, for: .normal)
        addSubview(newGameButton)
        activateNewGameButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE NEW GAME BUTTON
    private func updateNewGameButton(isLandscape: Bool) {
        if isLandscape {
            activateNewGameButtonLandscapeConstraints()
        } else {
            activateNewGameButtonPortraitConstraints()
        }
        newGameButton.setImage(newGameButtonImage(), for: .normal)
    }
    
    // MARK: - NEW GAME BUTTON IMAGE
    private func newGameButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "arrow.clockwise.circle.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .wordGuessButton)
    }
    
    // MARK: - NEW GAME BUTTON PORTRAIT CONSTRAINTS
    private func activateNewGameButtonPortraitConstraints() {
        deactivateNewGameButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid && newGameButtonShowing ? 0 : (UIScreen.main.bounds.width * 2)
        newGameButtonPortraitConstraints = [
            newGameButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            newGameButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            newGameButton.bottomAnchor.constraint(equalTo: gridView.bottomAnchor, constant: (Frame.Logo.upperPadding * 1.7)),
            newGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset)
        ]
        NSLayoutConstraint.activate(newGameButtonPortraitConstraints)
    }

    // MARK: - NEW GAME BUTTON LANDSCAPE CONSTRAINTS
    func activateNewGameButtonLandscapeConstraints() {
        deactivateNewGameButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid && newGameButtonShowing ? 0 : UIScreen.main.bounds.width
        newGameButtonLandscapeConstraints = [
            newGameButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            newGameButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            newGameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.Logo.upperPadding + offset),
            newGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
        ]
        NSLayoutConstraint.activate(newGameButtonLandscapeConstraints)
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
        enableKeyboard()
        resetGame {
            self.showInfoButton()
        }
    }
    
    // MARK: - STATS BUTTON
    private func addStatsButton() {
        statsButton.translatesAutoresizingMaskIntoConstraints = false
        statsButton.addTarget(self, action: #selector(didTapStatsButton(sender:)), for: .touchUpInside)
        statsButton.setImage(statsButtonImage(), for: .normal)
        statsButton.setTitleColor(.clear, for: .normal)
        addSubview(statsButton)
        activateStatsButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE STATS BUTTON
    private func updateStatsButton(isLandscape: Bool) {
        if isLandscape {
            activateStatsButtonLandscapeConstraints()
        } else {
            activateStatsButtonPortraitConstraints()
        }
        statsButton.setImage(statsButtonImage(), for: .normal)
    }
    
    // MARK: - STATS BUTTON IMAGE
    private func statsButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "books.vertical.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .wordGuessButton)
    }
    
    // MARK: - STATS BUTTON PORTRAIT CONSTRAINTS
    private func activateStatsButtonPortraitConstraints() {
        deactivateStatsButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid ? 0 : (UIScreen.main.bounds.width * 2)
        let padYOffset = UIDevice.current.userInterfaceIdiom == .pad ? Frame.Logo.upperPadding : 0
        statsButtonPortraitConstraints = [
            statsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            statsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            statsButton.bottomAnchor.constraint(equalTo: gridView.bottomAnchor, constant: (Frame.Logo.upperPadding * 1.7) - padYOffset),
            statsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
        ]
        NSLayoutConstraint.activate(statsButtonPortraitConstraints)
    }

    // MARK: - STATS BUTTON LANDSCAPE CONSTRAINTS
    func activateStatsButtonLandscapeConstraints() {
        deactivateStatsButtonConstraints()
        let offset = Model.shared.wordGuessState == .grid ? 0 : (UIScreen.main.bounds.width * 2)
        statsButtonLandscapeConstraints = [
            statsButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            statsButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            statsButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
            statsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset)
        ]
        NSLayoutConstraint.activate(statsButtonLandscapeConstraints)
    }
    
    // MARK: - DID TAP STATS BUTTON
    @objc
    private func didTapStatsButton(sender: UIButton) {
        Model.shared.wordGuessState = .stats
        statsView.isHidden = false
        wordGuessDelegate.didTapWGStatsButton()
        updateConstraints()
    }
    
    // MARK: - DEACTIVATE STATS BUTTON CONSTRAINTS
    private func deactivateStatsButtonConstraints() {
        NSLayoutConstraint.deactivate(statsButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(statsButtonLandscapeConstraints)
    }
    
    // MARK: - GRID BUTTON
    private func addGridButton() {
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        gridButton.addTarget(self, action: #selector(didTapGridButton(sender:)), for: .touchUpInside)
        gridButton.setImage(gridButtonImage(), for: .normal)
        gridButton.setTitleColor(.clear, for: .normal)
        addSubview(gridButton)
        activateGridButtonPortraitConstraints()
    }
    
    // MARK: - UPDATE GRID BUTTON
    private func updateGridButton(isLandscape: Bool) {
        if isLandscape {
            activateGridButtonLandscapeConstraints()
        } else {
            activateGridButtonPortraitConstraints()
        }
        gridButton.setImage(gridButtonImage(), for: .normal)
    }
    
    // MARK: - GRID BUTTON IMAGE
    private func gridButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "gamecontroller.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .wordGuessButton)
    }
    
    // MARK: - GRID BUTTON PORTRAIT CONSTRAINTS
    private func activateGridButtonPortraitConstraints() {
        deactivateGridButtonConstraints()
        let offset = Model.shared.wordGuessState == .stats ? 0 : -(UIScreen.main.bounds.width * 2)
        gridButtonPortraitConstraints = [
            gridButton.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding + Frame.padding),
            gridButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            gridButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            gridButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding + offset)
        ]
        NSLayoutConstraint.activate(gridButtonPortraitConstraints)
    }
    
    // MARK: - GRID BUTTON LANDSCAPE CONSTRAINTS
    func activateGridButtonLandscapeConstraints() {
        deactivateGridButtonConstraints()
        let offset = Model.shared.wordGuessState == .stats ? 0 : UIScreen.main.bounds.width * 2
        gridButtonLandscapeConstraints = [
            gridButton.centerYAnchor.constraint(equalTo: statsButton.centerYAnchor),
            gridButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Logo.upperPadding - offset),
            gridButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            gridButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width)
        ]
        NSLayoutConstraint.activate(gridButtonLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE GRID BUTTON CONSTRAINTS
    private func deactivateGridButtonConstraints() {
        NSLayoutConstraint.deactivate(gridButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(gridButtonLandscapeConstraints)
        gridButtonPortraitConstraints.removeAll()
        gridButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP GRID BUTTON
    @objc
    private func didTapGridButton(sender: UIButton) {
        Model.shared.wordGuessState = .grid
        statsView.isHidden = true
        wordGuessDelegate.didTapWGGridButton()
        updateConstraints()
    }
        
    // MARK: - STATS VIEW
    private func addStatsView() {
        statsView.isHidden = true
        addSubview(statsView)
        activateStatsViewPortraitConstraints()
    }
    
    // MARK: - STATS VIEW PORTRAIT CONSTRAINTS
    private func activateStatsViewPortraitConstraints() {
        deactivateStatsViewConstraints()
        let offset = Model.shared.appState == .wordGuess && Model.shared.wordGuessState == .stats ? 0 : Model.shared.appState == .container ? -(UIScreen.main.bounds.width * 2) : UIScreen.main.bounds.width * 3
        statsViewPortraitConstraints = [
            statsView.topAnchor.constraint(equalTo: topAnchor),
            statsView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
            statsView.widthAnchor.constraint(equalTo: widthAnchor),
            statsView.heightAnchor.constraint(equalTo: heightAnchor)
        ]
        NSLayoutConstraint.activate(statsViewPortraitConstraints)
    }
    
    // MARK: - STATS VIEW LANDSCAPE CONSTRAINTS
    private func activateStatsViewLandscapeConstraints() {
        deactivateStatsViewConstraints()
        let offset = Model.shared.appState == .wordGuess && Model.shared.wordGuessState == .stats ? 0 : UIScreen.main.bounds.width * 3
        statsViewLandscapeConstraints = [
            statsView.topAnchor.constraint(equalTo: topAnchor),
            statsView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
            statsView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            statsView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ]
        NSLayoutConstraint.activate(statsViewLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE STATS VIEW CONSTRAINTS
    private func deactivateStatsViewConstraints() {
        NSLayoutConstraint.deactivate(statsViewPortraitConstraints)
        NSLayoutConstraint.deactivate(statsViewLandscapeConstraints)
    }
        
    // MARK: - SHOW THE WIN
    func showTheWin(currentGame: WordGuessGame, completion: @escaping () -> ()) {
        
        // disable keyboard
        keyboardView.isUserInteractionEnabled = false
        
        // show success view
        showSuccessView()
        
        // update stats
        if let currentGame = Model.shared.currentWGGame {
            Model.shared.updateGames(with: currentGame)
        }
        
        // show new game button
        if Model.shared.isLandscape {
            activateNewGameButtonLandscapeConstraints()
        } else {
            activateNewGameButtonPortraitConstraints()
        }
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
        
        // make letters jump for joy
        gridView.jumpForJoy {
            completion()
        }
    }
    
    // MARK: - SHOW THE LOSS
    func showTheLoss(currentGame: WordGuessGame, completion: @escaping () -> ()) {
        keyboardView.isUserInteractionEnabled = false
        showAnswer()
        if let currentGame = Model.shared.currentWGGame {
            Model.shared.updateGames(with: currentGame)
        }
        if Model.shared.isLandscape {
            activateNewGameButtonLandscapeConstraints()
        } else {
            activateNewGameButtonPortraitConstraints()
        }
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
    
    // MARK: - RESET
    func resetGame(completion: @escaping () -> Void) {
        Model.shared.resetGame {
            self.gridView.resetRows()
            self.keyboardView.resetKeyboard()
            self.successView.isHidden = true
            for colorDotView in [self.gridView.leftDotOne, self.gridView.rightDotOne, self.gridView.leftDotTwo, self.gridView.rightDotTwo, self.gridView.leftDotThree, self.gridView.rightDotThree] {
                colorDotView.isHidden = true
            }
            completion()
        }
    }    
}

extension WordGuessView: KeyboardDelegate {
    
    // MARK: - DID TAP LETTER
    func didTapLetter(_ letter: String) {
        guard let currentGame = Model.shared.currentWGGame else { return }
        switch currentGame.currentLetter {
        case .a0:
            Model.shared.currentWGGame?.guessNumber = .first
            gridView.a1.updateLetter(with: letter)
            gridView.a1.growAndShrink {
                self.gridView.a1.setBorderActive()
                self.gridView.leftDotOne.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .a1
        case .a1:
            gridView.a2.updateLetter(with: letter)
            gridView.a2.growAndShrink {
                self.gridView.a2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .a2
        case .a2:
            gridView.a3.updateLetter(with: letter)
            gridView.a3.growAndShrink {
                self.gridView.a3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .a3
        case .a3:
            gridView.a4.updateLetter(with: letter)
            gridView.a4.growAndShrink {
                self.gridView.a4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .a4
        case .a4:
            gridView.a5.updateLetter(with: letter)
            gridView.a5.growAndShrink {
                self.gridView.a5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .a5
        case .b0:
            Model.shared.currentWGGame?.guessNumber = .second
            gridView.b1.updateLetter(with: letter)
            gridView.b1.growAndShrink {
                self.gridView.b1.setBorderActive()
                self.gridView.rightDotOne.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .b1
        case .b1:
            gridView.b2.updateLetter(with: letter)
            gridView.b2.growAndShrink {
                self.gridView.b2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .b2
        case .b2:
            gridView.b3.updateLetter(with: letter)
            gridView.b3.growAndShrink {
                self.gridView.b3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .b3
        case .b3:
            gridView.b4.updateLetter(with: letter)
            gridView.b4.growAndShrink {
                self.gridView.b4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .b4
        case .b4:
            gridView.b5.updateLetter(with: letter)
            gridView.b5.growAndShrink {
                self.gridView.b5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .b5
        case .c0:
            Model.shared.currentWGGame?.guessNumber = .third
            gridView.c1.updateLetter(with: letter)
            gridView.c1.growAndShrink {
                self.gridView.c1.setBorderActive()
                self.gridView.leftDotTwo.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .c1
        case .c1:
            gridView.c2.updateLetter(with: letter)
            gridView.c2.growAndShrink {
                self.gridView.c2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .c2
        case .c2:
            gridView.c3.updateLetter(with: letter)
            gridView.c3.growAndShrink {
                self.gridView.c3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .c3
        case .c3:
            gridView.c4.updateLetter(with: letter)
            gridView.c4.growAndShrink {
                self.gridView.c4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .c4
        case .c4:
            gridView.c5.updateLetter(with: letter)
            gridView.c5.growAndShrink {
                self.gridView.c5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .c5
        case .d0:
            Model.shared.currentWGGame?.guessNumber = .fourth
            gridView.d1.updateLetter(with: letter)
            gridView.d1.growAndShrink {
                self.gridView.d1.setBorderActive()
                self.gridView.rightDotTwo.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .d1
        case .d1:
            gridView.d2.updateLetter(with: letter)
            gridView.d2.growAndShrink {
                self.gridView.d2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .d2
        case .d2:
            gridView.d3.updateLetter(with: letter)
            gridView.d3.growAndShrink {
                self.gridView.d3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .d3
        case .d3:
            gridView.d4.updateLetter(with: letter)
            gridView.d4.growAndShrink {
                self.gridView.d4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .d4
        case .d4:
            gridView.d5.updateLetter(with: letter)
            gridView.d5.growAndShrink {
                self.gridView.d5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .d5
        case .e0:
            Model.shared.currentWGGame?.guessNumber = .fifth
            gridView.e1.updateLetter(with: letter)
            gridView.e1.growAndShrink {
                self.gridView.e1.setBorderActive()
                self.gridView.leftDotThree.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .e1
        case .e1:
            gridView.e2.updateLetter(with: letter)
            gridView.e2.growAndShrink {
                self.gridView.e2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .e2
        case .e2:
            gridView.e3.updateLetter(with: letter)
            gridView.e3.growAndShrink {
                self.gridView.e3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .e3
        case .e3:
            gridView.e4.updateLetter(with: letter)
            gridView.e4.growAndShrink {
                self.gridView.e4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .e4
        case .e4:
            gridView.e5.updateLetter(with: letter)
            gridView.e5.growAndShrink {
                self.gridView.e5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .e5
        case .f0:
            Model.shared.currentWGGame?.guessNumber = .sixth
            gridView.f1.updateLetter(with: letter)
            gridView.f1.growAndShrink {
                self.gridView.f1.setBorderActive()
                self.gridView.rightDotThree.isHidden = false
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .f1
        case .f1:
            gridView.f2.updateLetter(with: letter)
            gridView.f2.growAndShrink {
                self.gridView.f2.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .f2
        case .f2:
            gridView.f3.updateLetter(with: letter)
            gridView.f3.growAndShrink {
                self.gridView.f3.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .f3
        case .f3:
            gridView.f4.updateLetter(with: letter)
            gridView.f4.growAndShrink {
                self.gridView.f4.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .f4
        case .f4:
            gridView.f5.updateLetter(with: letter)
            gridView.f5.growAndShrink {
                self.gridView.f5.setBorderActive()
            }
            Model.shared.currentGuess += letter
            Model.shared.currentWGGame?.currentLetter = .f5
        case .a5, .b5, .c5, .d5, .e5, .f5: ()
        }
    }
    
    // MARK: - DID TAP ENTER
    func didTapEnter() {
        guard let currentGame = Model.shared.currentWGGame else { return }
        guard Model.shared.currentGuess.count == 5 else { return }
        guard gridView.wordIsInList() else { return }
        
        Model.shared.populateGuessLetterCountDictionary(with: Model.shared.currentGuess) {
            self.gridView.updateRowsFromEnter {
                                
                if Model.shared.currentGuess.lowercased() != currentGame.answer {
                    switch currentGame.currentLetter {
                    case .a5:
                        Model.shared.currentWGGame?.guess1 = Model.shared.currentGuess
                        Model.shared.currentWGGame?.currentLetter = .b0
                    case .b5:
                        Model.shared.currentWGGame?.guess2 = Model.shared.currentGuess
                        Model.shared.currentWGGame?.currentLetter = .c0
                    case .c5:
                        Model.shared.currentWGGame?.guess3 = Model.shared.currentGuess
                        Model.shared.currentWGGame?.currentLetter = .d0
                    case .d5:
                        Model.shared.currentWGGame?.guess4 = Model.shared.currentGuess
                        Model.shared.currentWGGame?.currentLetter = .e0
                    case .e5:
                        Model.shared.currentWGGame?.guess5 = Model.shared.currentGuess
                        Model.shared.currentWGGame?.currentLetter = .f0
                    case .f5:
                        Model.shared.currentWGGame?.guess6 = Model.shared.currentGuess
                        self.showAnswer()
                        Model.shared.currentWGGame?.state = .lost
                    default: ()
                    }
                }
                
                if Model.shared.currentGuess.lowercased() == Model.shared.currentWGGame?.answer {
                    self.showSuccessView()
                    self.gridView.jumpForJoy {
                        self.showNewGameButton()
                    }
                    Model.shared.currentWGGame?.state = .won
                }
                
                if let updatedCurrentGame = Model.shared.currentWGGame,
                   (updatedCurrentGame.state == .won || updatedCurrentGame.state == .lost) {
                    Model.shared.updateGames(with: updatedCurrentGame)
                }
                
                Model.shared.currentGuess = ""
                
                self.wordGuessDelegate.didTapWGSendButton()
                self.disableKeyboard()
            }
        }
    }
    
    // MARK: - DID TAP BACKSPACE
    func didTapBackspace() {
        guard let currentGame = Model.shared.currentWGGame else { return }
        
        if !Model.shared.currentGuess.isEmpty {
            Model.shared.currentGuess.removeLast()
        }
        
        switch currentGame.currentLetter {
        case .a1:
            gridView.a1.updateLetter(with: "")
            gridView.a1.setBorderInactive()
            gridView.leftDotOne.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .a0
        case .a2:
            gridView.a2.updateLetter(with: "")
            gridView.a2.setBorderInactive()
            gridView.a1.growAndShrink {
                self.gridView.a1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .a1
        case .a3:
            gridView.a3.updateLetter(with: "")
            gridView.a3.setBorderInactive()
            gridView.a2.growAndShrink {
                self.gridView.a2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .a2
        case .a4:
            gridView.a4.updateLetter(with: "")
            gridView.a4.setBorderInactive()
            gridView.a3.growAndShrink {
                self.gridView.a3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .a3
        case .a5:
            gridView.a5.updateLetter(with: "")
            gridView.a5.setBorderInactive()
            gridView.a4.growAndShrink {
                self.gridView.a4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .a4
        case .b1:
            gridView.b1.updateLetter(with: "")
            gridView.b1.setBorderInactive()
            gridView.rightDotOne.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .b0
        case .b2:
            gridView.b2.updateLetter(with: "")
            gridView.b2.setBorderInactive()
            gridView.b1.growAndShrink {
                self.gridView.b1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .b1
        case .b3:
            gridView.b3.updateLetter(with: "")
            gridView.b3.setBorderInactive()
            gridView.b2.growAndShrink {
                self.gridView.b2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .b2
        case .b4:
            gridView.b4.updateLetter(with: "")
            gridView.b4.setBorderInactive()
            gridView.b3.growAndShrink {
                self.gridView.b3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .b3
        case .b5:
            gridView.b5.updateLetter(with: "")
            gridView.b5.setBorderInactive()
            gridView.b4.growAndShrink {
                self.gridView.b4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .b4
        case .c1:
            gridView.c1.updateLetter(with: "")
            gridView.c1.setBorderInactive()
            gridView.leftDotTwo.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .c0
        case .c2:
            gridView.c2.updateLetter(with: "")
            gridView.c2.setBorderInactive()
            gridView.c1.growAndShrink {
                self.gridView.c1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .c1
        case .c3:
            gridView.c3.updateLetter(with: "")
            gridView.c3.setBorderInactive()
            gridView.c2.growAndShrink {
                self.gridView.c2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .c2
        case .c4:
            gridView.c4.updateLetter(with: "")
            gridView.c4.setBorderInactive()
            gridView.c3.growAndShrink {
                self.gridView.c3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .c3
        case .c5:
            gridView.c5.updateLetter(with: "")
            gridView.c5.setBorderInactive()
            gridView.c4.growAndShrink {
                self.gridView.c4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .c4
        case .d1:
            gridView.d1.updateLetter(with: "")
            gridView.d1.setBorderInactive()
            gridView.rightDotTwo.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .d0
        case .d2:
            gridView.d2.updateLetter(with: "")
            gridView.d2.setBorderInactive()
            gridView.d1.growAndShrink {
                self.gridView.d1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .d1
        case .d3:
            gridView.d3.updateLetter(with: "")
            gridView.d3.setBorderInactive()
            gridView.d2.growAndShrink {
                self.gridView.d2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .d2
        case .d4:
            gridView.d4.updateLetter(with: "")
            gridView.d4.setBorderInactive()
            gridView.d3.growAndShrink {
                self.gridView.d3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .d3
        case .d5:
            gridView.d5.updateLetter(with: "")
            gridView.d5.setBorderInactive()
            gridView.d4.growAndShrink {
                self.gridView.d4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .d4
        case .e1:
            gridView.e1.updateLetter(with: "")
            gridView.e1.setBorderInactive()
            gridView.leftDotThree.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .e0
        case .e2:
            gridView.e2.updateLetter(with: "")
            gridView.e2.setBorderInactive()
            gridView.e1.growAndShrink {
                self.gridView.e1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .e1
        case .e3:
            gridView.e3.updateLetter(with: "")
            gridView.e3.setBorderInactive()
            gridView.e2.growAndShrink {
                self.gridView.e2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .e2
        case .e4:
            gridView.e4.updateLetter(with: "")
            gridView.e4.setBorderInactive()
            gridView.e3.growAndShrink {
                self.gridView.e3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .e3
        case .e5:
            gridView.e5.updateLetter(with: "")
            gridView.e5.setBorderInactive()
            gridView.e4.growAndShrink {
                self.gridView.e4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .e4
        case .f1:
            gridView.f1.updateLetter(with: "")
            gridView.f1.setBorderInactive()
            gridView.rightDotThree.isHidden = true
            Model.shared.currentWGGame?.currentLetter = .f0
        case .f2:
            gridView.f2.updateLetter(with: "")
            gridView.f2.setBorderInactive()
            gridView.f1.growAndShrink {
                self.gridView.f1.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .f1
        case .f3:
            gridView.f3.updateLetter(with: "")
            gridView.f3.setBorderInactive()
            gridView.f2.growAndShrink {
                self.gridView.f2.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .f2
        case .f4:
            gridView.f4.updateLetter(with: "")
            gridView.f4.setBorderInactive()
            gridView.f3.growAndShrink {
                self.gridView.f3.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .f3
        case .f5:
            gridView.f5.updateLetter(with: "")
            gridView.f5.setBorderInactive()
            gridView.f4.growAndShrink {
                self.gridView.f4.setBorderActive()
            }
            Model.shared.currentWGGame?.currentLetter = .f4
        default: ()
        }
    }
    
    func showNotOurTurn() {
        successView.showTheirTurn()
    }
}

// MARK: - FIVE LETTER GRID DELEGATE
extension WordGuessView: FiveLetterGridDelegate {
    func showNotInWordListView() {
        notInWordListView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.notInWordListView.isHidden = true
        }
    }
    
    func showSuccessView() {
        successView.isHidden = false
    }
    
    func showAnswer() {
        successView.showAnswer()
        successView.isHidden = false
    }
    
    func enableKeyboard() {
        Model.shared.keyboardEnabled = true
    }
    
    func disableKeyboard() {
        Model.shared.keyboardEnabled = false
    }
    
    func setKeyToGreen(for guessLetter: String) {
        keyboardView.setKeyToGreen(for: guessLetter)
    }
    
    func setKeyToGray(for guessLetter: String) {
        keyboardView.setKeyToGray(for: guessLetter)
    }
    
    func setKeyToYellow(for guessLetter: String) {
        keyboardView.setKeyToYellow(for: guessLetter)
    }
    
    func showInfoButton() {
        hideNewGameButton {
            self.infoButtonShowing = true
            if Model.shared.isLandscape {
                self.activateInfoButtonLandscapeConstraints()
            } else {
                self.activateInfoButtonPortraitConstraints()
            }
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
                self.layoutIfNeeded()
            } completion: { _ in
            }
        }
    }
    
    func hideInfoButton(completion: @escaping () -> Void) {
        infoButtonShowing = false
        if Model.shared.isLandscape {
            activateInfoButtonLandscapeConstraints()
        } else {
            activateInfoButtonPortraitConstraints()
        }
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
    
    func showNewGameButton() {
        hideInfoButton {
            self.newGameButtonShowing = true
            if Model.shared.isLandscape {
                self.activateNewGameButtonLandscapeConstraints()
            } else {
                self.activateNewGameButtonPortraitConstraints()
            }
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
                self.layoutIfNeeded()
            } completion: { _ in
            }
        }
    }
    
    func hideNewGameButton(completion: @escaping () -> Void) {
        newGameButtonShowing = false
        if Model.shared.isLandscape {
            activateNewGameButtonLandscapeConstraints()
        } else {
            activateNewGameButtonPortraitConstraints()
        }
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}

// MARK: - LONG PRESS DELEGATE
extension WordGuessView: UIGestureRecognizerDelegate {}

