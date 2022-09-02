//
//  TTTStatBarView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 9/1/22.
//

import UIKit

class TTTStatBarView: UIView {
    
    // MARK: - Properties
    var you = true
    var whoLabel = UILabel(frame: .zero)
    var whoLabelPortraitConstraints: [NSLayoutConstraint] = []
    var whoLabelLandscapeConstraints: [NSLayoutConstraint] = []
    
    var playedNumberLabel = UILabel(frame: .zero)
    var playedNumberPortraitConstraints: [NSLayoutConstraint] = []
    var playedNumberLandscapeConstraints: [NSLayoutConstraint] = []
    var playedTitleLabel = UILabel(frame: .zero)
    var playedTitlePortraitConstraints: [NSLayoutConstraint] = []
    var playedTitleLandscapeConstraints: [NSLayoutConstraint] = []

    var wonNumberLabel = UILabel(frame: .zero)
    var wonNumberPortraitConstraints: [NSLayoutConstraint] = []
    var wonNumberLandscapeConstraints: [NSLayoutConstraint] = []
    var wonTitleLabel = UILabel(frame: .zero)
    var wonTitlePortraitConstraints: [NSLayoutConstraint] = []
    var wonTitleLandscapeConstraints: [NSLayoutConstraint] = []
    
    var lostNumberLabel = UILabel(frame: .zero)
    var lostNumberPortraitConstraints: [NSLayoutConstraint] = []
    var lostNumberLandscapeConstraints: [NSLayoutConstraint] = []
    var lostTitleLabel = UILabel(frame: .zero)
    var lostTitlePortraitConstraints: [NSLayoutConstraint] = []
    var lostTitleLandscapeConstraints: [NSLayoutConstraint] = []
    
    var streakNumberLabel = UILabel(frame: .zero)
    var streakNumberPortraitConstraints: [NSLayoutConstraint] = []
    var streakNumberLandscapeConstraints: [NSLayoutConstraint] = []
    var streakTitleLabel = UILabel(frame: .zero)
    var streakTitlePortraitConstraints: [NSLayoutConstraint] = []
    var streakTitleLandscapeConstraints: [NSLayoutConstraint] = []

    
    // MARK: - Initializers
    init(frame: CGRect, you: Bool) {
        super.init(frame: frame)
        self.you = you
        configure()
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
            activateWhoLabelLandscapeConstraints()
            
            activatePlayedNumberLandscapeConstraints()
            activatePlayedTitleLandscapeConstraints()
            
            activateWonNumberLandscapeConstraints()
            activateWonTitleLandscapeConstraints()
            
            activateLostNumberLandscapeConstraints()
            activateLostTitleLandscapeConstraints()
            
            activateStreakNumberLandscapeConstraints()
            activateStreakTitleLandscapeConstraints()
        } else {
            activateWhoLabelPortraitConstraints()
            
            activatePlayedNumberPortraitConstraints()
            activatePlayedTitlePortraitConstraints()
            
            activateWonNumberPortraitConstraints()
            activateWonTitlePortraitConstraints()
            
            activateLostNumberPortraitConstraints()
            activateLostTitlePortraitConstraints()
            
            activateStreakNumberPortraitConstraints()
            activateStreakTitlePortraitConstraints()
        }
    }
    
    // MARK: - CONFIGURE
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .statBubbleBackground
        layer.cornerCurve = .continuous
        layer.cornerRadius = 23
        TicTacToeModel.shared.tttGameDelegate = self
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addWhoLabel()
        addPlayedLabels()
        addWonLabels()
        addLostLabels()
        addStreakLabels()
    }
    
    // MARK: - WHO LABEL
    private func addWhoLabel() {
        whoLabel.translatesAutoresizingMaskIntoConstraints = false
        whoLabel.textAlignment = .center
        whoLabel.font = .customFont(named: .robotoSlabBlack, size: 18, fallbackWeight: .black)
        whoLabel.text = you ? "You" : "Them"
        whoLabel.textColor = .gridLetterBackgroundYellow
        addSubview(whoLabel)
        activateWhoLabelPortraitConstraints()
    }
    
    // MARK: - ACTIVATE WHO LABEL PORTRAIT CONSTRAINTS
    private func activateWhoLabelPortraitConstraints() {
        deactivateWhoLabelConstraints()
        whoLabelPortraitConstraints = [
            whoLabel.topAnchor.constraint(equalTo: topAnchor, constant: (Frame.padding * 2)),
            whoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            whoLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.width),
            whoLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.height)
        ]
        NSLayoutConstraint.activate(whoLabelPortraitConstraints)
    }
    
    // MARK: - ACTIVATE WHO LABEL LANDSCAPE CONSTRAINTS
    private func activateWhoLabelLandscapeConstraints() {
        deactivateWhoLabelConstraints()
        whoLabelLandscapeConstraints = [
            whoLabel.topAnchor.constraint(equalTo: topAnchor, constant: -Frame.Logo.upperPadding - Frame.padding),
            whoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            whoLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.horizontalTitleSize.width),
            whoLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.horizontalTitleSize.height)
        ]
        NSLayoutConstraint.activate(whoLabelLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE WHO LABEL CONSTRAINTS
    private func deactivateWhoLabelConstraints() {
        NSLayoutConstraint.deactivate(whoLabelPortraitConstraints)
        NSLayoutConstraint.deactivate(whoLabelLandscapeConstraints)
        whoLabelPortraitConstraints.removeAll()
        whoLabelLandscapeConstraints.removeAll()
    }
    
    // MARK: - PLAYED LABELS
    private func addPlayedLabels() {
        playedNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        playedNumberLabel.textAlignment = .center
        playedNumberLabel.font = .customFont(named: .robotoSlabBlack, size: 34, fallbackWeight: .black)
        playedNumberLabel.text = "\(TicTacToeModel.shared.games.gameCount)"
        playedNumberLabel.textColor = .statBubbleValueText
        addSubview(playedNumberLabel)
        
        playedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        playedTitleLabel.text = "Played"
        playedTitleLabel.textAlignment = .center
        playedTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        playedTitleLabel.textColor = .statBubbleTitleText
        addSubview(playedTitleLabel)
        
        activatePlayedNumberPortraitConstraints()
        activatePlayedTitlePortraitConstraints()
    }
    
    
    // MARK: - ACTIVATE PLAYED NUMBER PORTRAIT CONSTRAINTS
    func activatePlayedNumberPortraitConstraints() {
        deactivatePlayedNumberConstraints()
        playedNumberPortraitConstraints = [
            playedNumberLabel.topAnchor.constraint(equalTo: whoLabel.bottomAnchor, constant: (Frame.padding * 1)),
            playedNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            playedNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.width),
            playedNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.height)
        ]
        NSLayoutConstraint.activate(playedNumberPortraitConstraints)
    }
    
    // MARK: - ACTIVATE PLAYED TITLE PORTRAIT CONSTRAINTS
    func activatePlayedTitlePortraitConstraints() {
        deactivatePlayedTitleConstraints()
        playedTitlePortraitConstraints = [
            playedTitleLabel.topAnchor.constraint(equalTo: playedNumberLabel.bottomAnchor, constant: -(Frame.padding * 3)),
            playedTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            playedTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.width),
            playedTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.height)
        ]
        NSLayoutConstraint.activate(playedTitlePortraitConstraints)
    }

    
    // MARK: - ACTIVATE PLAYED NUMBER LANDSCAPE CONSTRAINTS
    func activatePlayedNumberLandscapeConstraints() {
        deactivatePlayedNumberConstraints()
        playedNumberLandscapeConstraints = [
            playedNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: (Frame.bigPadding * 2)),
            playedNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
            playedNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.width),
            playedNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.height),
        ]
        NSLayoutConstraint.activate(playedNumberLandscapeConstraints)
    }

    // MARK: - ACTIVATE PLAYED TITLE LANDSCAPE CONSTRAINTS
    func activatePlayedTitleLandscapeConstraints() {
        deactivatePlayedTitleConstraints()
        playedTitleLandscapeConstraints = [
            playedTitleLabel.topAnchor.constraint(equalTo: playedNumberLabel.bottomAnchor, constant: -(Frame.bigPadding * 3)),
            playedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
            playedTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.width),
            playedTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.height)
        ]
        NSLayoutConstraint.activate(playedTitleLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE PLAYED NUMBER CONSTRAINTS
    private func deactivatePlayedNumberConstraints() {
        NSLayoutConstraint.deactivate(playedNumberPortraitConstraints)
        NSLayoutConstraint.deactivate(playedNumberLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE PLAYED TITLE CONSTRAINTS
    private func deactivatePlayedTitleConstraints() {
        NSLayoutConstraint.deactivate(playedTitlePortraitConstraints)
        NSLayoutConstraint.deactivate(playedTitleLandscapeConstraints)
    }
    
    // MARK: - WON LABELS
    private func addWonLabels() {
        wonNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        wonNumberLabel.textAlignment = .center
        wonNumberLabel.font = .customFont(named: .robotoSlabBlack, size: 34, fallbackWeight: .black)
        wonNumberLabel.text = "\(TicTacToeModel.shared.games.winCount)"
        wonNumberLabel.textColor = .statBubbleValueText
        addSubview(wonNumberLabel)
        
        wonTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        wonTitleLabel.text = "Won"
        wonTitleLabel.textAlignment = .center
        wonTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        wonTitleLabel.textColor = .statBubbleTitleText
        addSubview(wonTitleLabel)
        
        activateWonNumberPortraitConstraints()
        activateWonTitlePortraitConstraints()
    }
    
    // MARK: - ACTIVATE WON NUMBER PORTRAIT CONSTRAINTS
    func activateWonNumberPortraitConstraints() {
        deactivateWonNumberConstraints()
        wonNumberPortraitConstraints = [
            wonNumberLabel.topAnchor.constraint(equalTo: playedTitleLabel.bottomAnchor, constant: (Frame.padding * 2)),
            wonNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            wonNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.width),
            wonNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.height),
        ]
        NSLayoutConstraint.activate(wonNumberPortraitConstraints)
    }
    
    // MARK: - ACTIVATE WON TITLE PORTRAIT CONSTRAINTS
    func activateWonTitlePortraitConstraints() {
        deactivateWonTitleConstraints()
        wonTitlePortraitConstraints = [
            wonTitleLabel.topAnchor.constraint(equalTo: wonNumberLabel.bottomAnchor, constant: -(Frame.padding * 3)),
            wonTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            wonTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.width),
            wonTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.height)
        ]
        NSLayoutConstraint.activate(wonTitlePortraitConstraints)
    }
    
    // MARK: - ACTIVATE WON NUMBER LANDSCAPE CONSTRAINTS
    func activateWonNumberLandscapeConstraints() {
        deactivateWonNumberConstraints()
        wonNumberLandscapeConstraints = [
            wonNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: (Frame.bigPadding * 2)),
            wonNumberLabel.leadingAnchor.constraint(equalTo: playedNumberLabel.trailingAnchor),
            wonNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.width),
            wonNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.height)
        ]
        NSLayoutConstraint.activate(wonNumberLandscapeConstraints)
    }
    
    // MARK: - ACTIVATE WON TITLE LANDSCAPE CONSTRAINTS
    func activateWonTitleLandscapeConstraints() {
        deactivateWonTitleConstraints()
        wonTitleLandscapeConstraints = [
            wonTitleLabel.topAnchor.constraint(equalTo: wonNumberLabel.bottomAnchor, constant: -(Frame.bigPadding * 3)),
            wonTitleLabel.leadingAnchor.constraint(equalTo: playedTitleLabel.trailingAnchor),
            wonTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.width),
            wonTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.height)
        ]
        NSLayoutConstraint.activate(wonTitleLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE WON NUMBER CONSTRAINTS
    private func deactivateWonNumberConstraints() {
        NSLayoutConstraint.deactivate(wonNumberPortraitConstraints)
        NSLayoutConstraint.deactivate(wonNumberLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE WON TITLE CONSTRAINTS
    private func deactivateWonTitleConstraints() {
        NSLayoutConstraint.deactivate(wonTitlePortraitConstraints)
        NSLayoutConstraint.deactivate(wonTitleLandscapeConstraints)
    }
    
    // MARK: - LOST LABELS
    private func addLostLabels() {
        lostNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        lostNumberLabel.textAlignment = .center
        lostNumberLabel.font = .customFont(named: .robotoSlabBlack, size: 34, fallbackWeight: .black)
        lostNumberLabel.text = "\(TicTacToeModel.shared.games.lossCount)"
        lostNumberLabel.textColor = .statBubbleValueText
        addSubview(lostNumberLabel)
        
        lostTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        lostTitleLabel.text = "Lost"
        lostTitleLabel.textAlignment = .center
        lostTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lostTitleLabel.textColor = .statBubbleTitleText
        addSubview(lostTitleLabel)
        
        activateLostNumberPortraitConstraints()
        activateLostTitlePortraitConstraints()
    }
    
    // MARK: - ACTIVATE LOST NUMBER PORTRAIT CONSTRAINTS
    func activateLostNumberPortraitConstraints() {
        deactivateLostNumberConstraints()
        lostNumberPortraitConstraints = [
            lostNumberLabel.topAnchor.constraint(equalTo: wonTitleLabel.bottomAnchor, constant: (Frame.padding * 2)),
            lostNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lostNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.width),
            lostNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.height)
        ]
        NSLayoutConstraint.activate(lostNumberPortraitConstraints)
    }
    
    // MARK: - ACTIVATE LOST TITLE PORTRAIT CONSTRAINTS
    func activateLostTitlePortraitConstraints() {
        deactivateLostTitleConstraints()
        lostTitlePortraitConstraints = [
            lostTitleLabel.topAnchor.constraint(equalTo: lostNumberLabel.bottomAnchor, constant: -(Frame.padding * 3)),
            lostTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lostTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.width),
            lostTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.height)
        ]
        NSLayoutConstraint.activate(lostTitlePortraitConstraints)
    }
    
    // MARK: - ACTIVATE LOST NUMBER LANDSCAPE CONSTRAINTS
    func activateLostNumberLandscapeConstraints() {
        deactivateLostNumberConstraints()
        lostNumberLandscapeConstraints = [
            lostNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: (Frame.bigPadding * 2)),
            lostNumberLabel.leadingAnchor.constraint(equalTo: wonNumberLabel.trailingAnchor),
            lostNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.width),
            lostNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.height)
        ]
        NSLayoutConstraint.activate(lostNumberLandscapeConstraints)
    }
    
    // MARK: - ACTIVATE LOST TITLE LANDSCAPE CONSTRAINTS
    func activateLostTitleLandscapeConstraints() {
        deactivateLostTitleConstraints()
        lostTitleLandscapeConstraints = [
            lostTitleLabel.topAnchor.constraint(equalTo: lostNumberLabel.bottomAnchor, constant: -(Frame.bigPadding * 3)),
            lostTitleLabel.leadingAnchor.constraint(equalTo: wonTitleLabel.trailingAnchor),
            lostTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.width),
            lostTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.height)
        ]
        NSLayoutConstraint.activate(lostTitleLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE LOST NUMBER CONSTRAINTS
    private func deactivateLostNumberConstraints() {
        NSLayoutConstraint.deactivate(lostNumberPortraitConstraints)
        NSLayoutConstraint.deactivate(lostNumberLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE LOST TITLE CONSTRAINTS
    private func deactivateLostTitleConstraints() {
        NSLayoutConstraint.deactivate(lostTitlePortraitConstraints)
        NSLayoutConstraint.deactivate(lostTitleLandscapeConstraints)
    }

    // MARK: - STREAK LABELS
    private func addStreakLabels() {
        streakNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        streakNumberLabel.textAlignment = .center
        streakNumberLabel.font = .customFont(named: .robotoSlabBlack, size: 34, fallbackWeight: .black)
        streakNumberLabel.text = "\(TicTacToeModel.shared.games.streakCount)"
        streakNumberLabel.textColor = .statBubbleValueText
        addSubview(streakNumberLabel)
        
        streakTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        streakTitleLabel.text = "Streak"
        streakTitleLabel.textAlignment = .center
        streakTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        streakTitleLabel.textColor = .statBubbleTitleText
        addSubview(streakTitleLabel)
        
        activateStreakNumberPortraitConstraints()
        activateStreakTitlePortraitConstraints()
    }
    
    // MARK: - ACTIVATE STREAK NUMBER PORTRAIT CONSTRAINTS
    func activateStreakNumberPortraitConstraints() {
        deactivateStreakNumberConstraints()
        streakNumberPortraitConstraints = [
            streakNumberLabel.topAnchor.constraint(equalTo: lostTitleLabel.bottomAnchor, constant: (Frame.padding * 2)),
            streakNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            streakNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.width),
            streakNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalNumberSize.height)
        ]
        NSLayoutConstraint.activate(streakNumberPortraitConstraints)
    }
    
    // MARK: - ACTIVATE STREAK TITLE PORTRAIT CONSTRAINTS
    func activateStreakTitlePortraitConstraints() {
        deactivateStreakTitleConstraints()
        streakTitlePortraitConstraints = [
            streakTitleLabel.topAnchor.constraint(equalTo: streakNumberLabel.bottomAnchor, constant: -(Frame.padding * 3)),
            streakTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            streakTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.width),
            streakTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.verticalTitleSize.height)
        ]
        NSLayoutConstraint.activate(streakTitlePortraitConstraints)
    }
    
    // MARK: - ACTIVATE STREAK NUMBER LANDSCAPE CONSTRAINTS
    func activateStreakNumberLandscapeConstraints() {
        deactivateStreakNumberConstraints()
        streakNumberLandscapeConstraints = [
            streakNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: (Frame.bigPadding * 2)),
            streakNumberLabel.leadingAnchor.constraint(equalTo: lostNumberLabel.trailingAnchor, constant: -Frame.bigPadding),
            streakNumberLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.width),
            streakNumberLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalNumberSize.height)
        ]
        NSLayoutConstraint.activate(streakNumberLandscapeConstraints)
    }
    
    // MARK: - ACTIVATE STREAK TITLE LANDSCAPE CONSTRAINTS
    func activateStreakTitleLandscapeConstraints() {
        deactivateStreakTitleConstraints()
        streakTitleLandscapeConstraints = [
            streakTitleLabel.topAnchor.constraint(equalTo: streakNumberLabel.bottomAnchor, constant: -(Frame.bigPadding * 3)),
            streakTitleLabel.leadingAnchor.constraint(equalTo: lostTitleLabel.trailingAnchor, constant: -Frame.bigPadding),
            streakTitleLabel.widthAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.width),
            streakTitleLabel.heightAnchor.constraint(equalToConstant: Frame.Stats.landscapeHorizontalTitleSize.height)
        ]
        NSLayoutConstraint.activate(streakTitleLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE STREAK NUMBER CONSTRAINTS
    private func deactivateStreakNumberConstraints() {
        NSLayoutConstraint.deactivate(streakNumberPortraitConstraints)
        NSLayoutConstraint.deactivate(streakNumberLandscapeConstraints)
    }
    
    // MARK: - DEACTIVATE STREAK TITLE CONSTRAINTS
    private func deactivateStreakTitleConstraints() {
        NSLayoutConstraint.deactivate(streakTitlePortraitConstraints)
        NSLayoutConstraint.deactivate(streakTitleLandscapeConstraints)
    }
}

extension TTTStatBarView: TTTGameDelegate {
    func didUpdateGame() {
        playedNumberLabel.text = "\(TicTacToeModel.shared.games.gameCount)"
        wonNumberLabel.text = "\(TicTacToeModel.shared.games.winCount)"
        lostNumberLabel.text = "\(TicTacToeModel.shared.games.lossCount)"
        streakNumberLabel.text = "\(TicTacToeModel.shared.games.streakCount)"
    }
}
