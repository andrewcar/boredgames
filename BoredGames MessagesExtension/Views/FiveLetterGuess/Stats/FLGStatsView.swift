//
//  FLGStatsView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/2/22.
//

import UIKit

class FLGStatsView: UIView {
    
    // MARK: - Properties
    var statBarView = FLGStatBarView(frame: .zero)
    var statBarPortraitConstraints: [NSLayoutConstraint] = []
    var statBarLandscapeConstraints: [NSLayoutConstraint] = []
    
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
    
        if Model.shared.isLandscape {
            activateStatBarConstraints(isLandscape: true)
            activateResetButtonLandscapeConstraints()
        } else {
            activateStatBarConstraints(isLandscape: false)
            activateResetButtonPortraitConstraints()
        }
        statBarView.updateConstraints()
        resetButton.isHidden = !Model.shared.resetAvailable
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addStatBarView()
        addResetButton()
    }
    
    // MARK: - STAT BAR VIEW
    private func addStatBarView() {
        addSubview(statBarView)
        activateStatBarConstraints(isLandscape: false)
    }
    
    // MARK: - ACTIVATE STAT BAR CONSTRAINTS
    func activateStatBarConstraints(isLandscape: Bool) {
        deactivateStatBarViewConstraints()
        if isLandscape {
            statBarLandscapeConstraints = [
                statBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.targetTallSize.height + Frame.Logo.upperPadding),
                statBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
                statBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.width),
                statBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalBarSize.height)
            ]
            NSLayoutConstraint.activate(statBarLandscapeConstraints)
        } else {
            statBarPortraitConstraints = [
                statBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.targetTallSize.height + Frame.Logo.upperPadding),
                statBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
                statBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.horizontalBarSize.width),
                statBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.horizontalBarSize.height)
            ]
            NSLayoutConstraint.activate(statBarPortraitConstraints)
        }
    }
    
    // MARK: - DEACTIVATE STAT BAR VIEW CONSTRAINTS
    private func deactivateStatBarViewConstraints() {
        NSLayoutConstraint.deactivate(statBarPortraitConstraints)
        NSLayoutConstraint.deactivate(statBarLandscapeConstraints)
        statBarPortraitConstraints.removeAll()
        statBarLandscapeConstraints.removeAll()
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
        activateResetButtonPortraitConstraints()
    }
    
    // MARK: - ACTIVATE RESET BUTTON PORTRAIT CONSTRAINTS
    func activateResetButtonPortraitConstraints() {
        deactivateResetButtonConstraints()
        resetButtonPortraitConstraints = [
            resetButton.topAnchor.constraint(equalTo: statBarView.bottomAnchor, constant: (Frame.padding * 2)),
            resetButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            resetButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            resetButton.centerXAnchor.constraint(equalTo: statBarView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(resetButtonPortraitConstraints)
    }
    
    // MARK: - ACTIVATE RESET BUTTON LANDSCAPE CONSTRAINTS
    func activateResetButtonLandscapeConstraints() {
        deactivateResetButtonConstraints()
        resetButtonLandscapeConstraints = [
            resetButton.topAnchor.constraint(equalTo: statBarView.bottomAnchor, constant: (Frame.padding * 2)),
            resetButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
            resetButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height),
            resetButton.centerXAnchor.constraint(equalTo: statBarView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(resetButtonPortraitConstraints)
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
        var games = Model.shared.flgGames
        games.value.removeAll()
        games.gameCount = 0
        games.winCount = 0
        games.lossCount = 0
        games.streakCount = 0
        GamesCache.saveFLGGames(games)
        statBarView.playedNumberLabel.text = "\(games.gameCount)"
        statBarView.wonNumberLabel.text = "\(games.winCount)"
        statBarView.lostNumberLabel.text = "\(games.lossCount)"
        statBarView.streakNumberLabel.text = "\(games.streakCount)"
        Model.shared.flgGames = games
        GamesCache.removeFLGGames()
    }
}
