//
//  StatsView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/2/22.
//

import UIKit

class StatsView: UIView {
    
    // MARK: - Properties
    var statBarView = StatBarView()
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
            activateStatBarLandscapeConstraints()
            activateResetButtonLandscapeConstraints()
            statBarView.updateConstraints()
        } else {
            activateStatBarPortraitConstraints()
            activateResetButtonPortraitConstraints()
            statBarView.updateConstraints()
        }
        
        if Model.shared.appState == .fiveLetterGuess {
            resetButton.isHidden = !Model.shared.resetAvailable
        } else if Model.shared.appState == .ticTacToe {
            resetButton.isHidden = !TicTacToeModel.shared.resetAvailable
        }
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addStatBarView()
        addResetButton()
    }
    
    // MARK: - STAT BAR VIEW
    private func addStatBarView() {
        statBarView = StatBarView(frame: .zero)
        addSubview(statBarView)
        activateStatBarPortraitConstraints()
    }
    
    // MARK: - ACTIVATE STAT BAR PORTRAIT CONSTRAINTS
    func activateStatBarPortraitConstraints() {
        deactivateStatBarViewConstraints()
        statBarPortraitConstraints = [
            statBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.buttonSize.height + (Frame.Logo.upperPadding * 3)),
            statBarView.centerXAnchor.constraint(equalTo: centerXAnchor),
            statBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.barSize.width),
            statBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.barSize.height)
        ]
        NSLayoutConstraint.activate(statBarPortraitConstraints)
    }
    
    // MARK: - ACTIVATE STAT BAR LANDSCAPE CONSTRAINTS
    func activateStatBarLandscapeConstraints() {
        deactivateStatBarViewConstraints()
        statBarLandscapeConstraints = [
            statBarView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Logo.upperPadding + Frame.buttonSize.height + Frame.Logo.upperPadding),
            statBarView.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeBarSize.width),
            statBarView.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeBarSize.height),
            statBarView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -Frame.Logo.upperPadding - (Frame.padding * 3)),
        ]
        NSLayoutConstraint.activate(statBarLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE STAT BAR VIEW CONSTRAINTS
    private func deactivateStatBarViewConstraints() {
        NSLayoutConstraint.deactivate(statBarPortraitConstraints)
        NSLayoutConstraint.deactivate(statBarLandscapeConstraints)
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
    }
    
    // MARK: - DID TAP RESET BUTTON
    @objc
    private func didTapResetButton(sender: UIButton) {
        switch Model.shared.appState {
        case .fiveLetterGuess:
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
        case .ticTacToe:
            var games = TicTacToeModel.shared.games
            games.value.removeAll()
            games.gameCount = 0
            games.winCount = 0
            games.lossCount = 0
            games.streakCount = 0
            GamesCache.saveTTTGames(games)
            statBarView.playedNumberLabel.text = "\(games.gameCount)"
            statBarView.wonNumberLabel.text = "\(games.winCount)"
            statBarView.lostNumberLabel.text = "\(games.lossCount)"
            statBarView.streakNumberLabel.text = "\(games.streakCount)"
            TicTacToeModel.shared.games = games
            GamesCache.removeTTTGames()
        default: ()
        }
    }
    
}
