//
//  TTTStatsView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 9/1/22.
//

import UIKit

class TTTStatsView: UIView {
    
    // MARK: - Properties
    var leftStatBarView = TTTStatBarView(frame: .zero, you: true)
    var leftStatBarPortraitConstraints: [NSLayoutConstraint] = []
    var leftStatBarLandscapeConstraints: [NSLayoutConstraint] = []
    
    var rightStatBarView = TTTStatBarView(frame: .zero, you: false)
    var rightStatBarPortraitConstraints: [NSLayoutConstraint] = []
    var rightStatBarLandscapeConstraints: [NSLayoutConstraint] = []

    var resetButton = UIButton()
    var resetButtonPortraitConstraints: [NSLayoutConstraint] = []
    var resetButtonLandscapeConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
    
        activateLeftStatBarConstraints(isLandscape: Model.shared.isLandscape)
        activateRightStatBarConstraints(isLandscape: Model.shared.isLandscape)
        activateResetButtonConstraints(isLandscape: Model.shared.isLandscape)
        resetButton.isHidden = !TicTacToeModel.shared.resetAvailable
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addStatBarViews()
        addResetButton()
    }
    
    // MARK: - STAT BAR VIEWS
    private func addStatBarViews() {
        addSubview(leftStatBarView)
        addSubview(rightStatBarView)
        
        activateLeftStatBarConstraints(isLandscape: false)
        activateRightStatBarConstraints(isLandscape: false)
    }
    
    // MARK: - ACTIVATE LEFT STAT BAR CONSTRAINTS
    func activateLeftStatBarConstraints(isLandscape: Bool) {
        deactivateLeftStatBarViewConstraints()
        if isLandscape {
            leftStatBarLandscapeConstraints = [
                leftStatBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding),
                leftStatBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
                leftStatBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.width),
                leftStatBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.height)
            ]
            NSLayoutConstraint.activate(leftStatBarLandscapeConstraints)
        } else {
            leftStatBarPortraitConstraints = [
                leftStatBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.targetTallSize.height + Frame.Logo.upperPadding),
                leftStatBarView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -(Frame.Stats.verticalBarSize.width / 2) - (Frame.Logo.upperPadding / 2)),
                leftStatBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalBarSize.width),
                leftStatBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalBarSize.height)
            ]
            NSLayoutConstraint.activate(leftStatBarPortraitConstraints)
        }
        
        leftStatBarView.updateConstraints()
    }
    
    // MARK: - ACTIVATE RIGHT STAT BAR CONSTRAINTS
    func activateRightStatBarConstraints(isLandscape: Bool) {
        deactivateRightStatBarViewConstraints()
        if isLandscape {
            rightStatBarLandscapeConstraints = [
                rightStatBarView.topAnchor.constraint(equalTo: leftStatBarView.bottomAnchor, constant: Frame.Logo.upperPadding),
                rightStatBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
                rightStatBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.width),
                rightStatBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.height)
            ]
            NSLayoutConstraint.activate(rightStatBarLandscapeConstraints)
        } else {
            rightStatBarPortraitConstraints = [
                rightStatBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.targetTallSize.height + Frame.Logo.upperPadding),
                rightStatBarView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: (Frame.Stats.verticalBarSize.width / 2) + (Frame.Logo.upperPadding / 2)),
                rightStatBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalBarSize.width),
                rightStatBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalBarSize.height)
            ]
            NSLayoutConstraint.activate(rightStatBarPortraitConstraints)
        }
        
        rightStatBarView.updateConstraints()
    }

    
    // MARK: - DEACTIVATE LEFT STAT BAR VIEW CONSTRAINTS
    private func deactivateLeftStatBarViewConstraints() {
        NSLayoutConstraint.deactivate(leftStatBarPortraitConstraints)
        NSLayoutConstraint.deactivate(leftStatBarLandscapeConstraints)
        leftStatBarPortraitConstraints.removeAll()
        leftStatBarLandscapeConstraints.removeAll()
    }
    
    // MARK: - DEACTIVATE RIGHT STAT BAR VIEW CONSTRAINTS
    private func deactivateRightStatBarViewConstraints() {
        NSLayoutConstraint.deactivate(rightStatBarPortraitConstraints)
        NSLayoutConstraint.deactivate(rightStatBarLandscapeConstraints)
        rightStatBarPortraitConstraints.removeAll()
        rightStatBarLandscapeConstraints.removeAll()
    }
    
    // MARK: - RESET BUTTON
    private func addResetButton() {
        resetButton = UIButton(frame: .zero)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.addTarget(self, action: #selector(didTapResetButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "eject.circle.fill",
            size: Frame.buttonSize,
            weight: .bold,
            color: .fiveLetterGuessButton)
        resetButton.setImage(image, for: .normal)
        resetButton.setTitleColor(.clear, for: .normal)
        addSubview(resetButton)
        activateResetButtonConstraints(isLandscape: false)
    }
    
    // MARK: - ACTIVATE RESET BUTTON CONSTRAINTS
    func activateResetButtonConstraints(isLandscape: Bool) {
        deactivateResetButtonConstraints()
        if isLandscape {
            resetButtonLandscapeConstraints = [
                resetButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                resetButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                resetButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                resetButton.leadingAnchor.constraint(equalTo: leftStatBarView.trailingAnchor, constant: Frame.Logo.upperPadding)
            ]
            NSLayoutConstraint.activate(resetButtonLandscapeConstraints)
        } else {
            resetButtonPortraitConstraints = [
                resetButton.topAnchor.constraint(equalTo: leftStatBarView.bottomAnchor, constant: (Frame.padding * 2)),
                resetButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                resetButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
                resetButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
            NSLayoutConstraint.activate(resetButtonPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE RESET BUTTON CONSTRAINTS
    private func deactivateResetButtonConstraints() {
        NSLayoutConstraint.deactivate(resetButtonPortraitConstraints)
        NSLayoutConstraint.deactivate(resetButtonLandscapeConstraints)
        resetButtonPortraitConstraints.removeAll()
        resetButtonLandscapeConstraints.removeAll()
    }
    
    // MARK: - DID TAP RESET BUTTON
    @objc
    private func didTapResetButton(sender: UIButton) {
        var games = TicTacToeModel.shared.games
        games.value.removeAll()
        games.gameCount = 0
        games.winCount = 0
        games.lossCount = 0
        games.streakCount = 0
        GamesCache.saveTTTGames(games)
        leftStatBarView.playedNumberLabel.text = "\(games.gameCount)"
        leftStatBarView.wonNumberLabel.text = "\(games.winCount)"
        leftStatBarView.lostNumberLabel.text = "\(games.lossCount)"
        leftStatBarView.streakNumberLabel.text = "\(games.streakCount)"
        TicTacToeModel.shared.games = games
        GamesCache.removeTTTGames()
    }
}
