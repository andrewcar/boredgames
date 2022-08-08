//
//  StarBarView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import UIKit

class StatBarView: UIView {
    
    // MARK: - Properties
    private var quarterWidth: CGFloat {
        frame.width / 4
    }
    private var valueHeight: CGFloat {
        frame.height * 0.5
    }
    private var titleHeight: CGFloat {
        frame.height * 0.2
    }
    private var padding: CGFloat {
        frame.height * 0.1
    }
    private var statBarLabelPadding: CGFloat = 5
    private var statBarWidthPadding: CGFloat {
        frame.width / 1000
    }
    private var statLabelWidth: CGFloat {
        quarterWidth - statBarWidthPadding
    }
    var playedNumberLabel: UILabel?
    var winsNumberLabel: UILabel?
    var lossesNumberLabel: UILabel?
    var streakNumberLabel: UILabel?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .lightGrayBackground
        layer.cornerCurve = .continuous
        layer.cornerRadius = 23
        GameModel.shared.gameDelegate = self
    }
    
    private func addSubviews() {
        addGamesPlayedLabels()
        addWinsLabels()
        addLossesLabels()
        addStreakLabels()
    }
    
    private func addGamesPlayedLabels() {
        playedNumberLabel = UILabel(frame: CGRect(
            x: statBarWidthPadding,
            y: padding + statBarLabelPadding,
            width: statLabelWidth,
            height: valueHeight))
        playedNumberLabel?.textAlignment = .center
        playedNumberLabel?.font = UIFont(name: "RobotoSlab-Black", size: 34)
        playedNumberLabel?.text = "\(GameModel.shared.games.gameCount)"
        addSubview(playedNumberLabel!)
        
        let playedTitleLabel = UILabel(frame: CGRect(
            x: statBarWidthPadding,
            y: valueHeight + statBarLabelPadding,
            width: statLabelWidth,
            height: titleHeight))
        playedTitleLabel.text = "Played"
        playedTitleLabel.textAlignment = .center
        playedTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        playedTitleLabel.textColor = .nerdleLetterLightModeGray
        addSubview(playedTitleLabel)
    }
    
    private func addWinsLabels() {
        winsNumberLabel = UILabel(frame: CGRect(
            x: quarterWidth + (statBarWidthPadding * 2),
            y: padding + statBarLabelPadding,
            width: statLabelWidth,
            height: valueHeight))
        winsNumberLabel?.textAlignment = .center
        winsNumberLabel?.font = UIFont(name: "RobotoSlab-Black", size: 34)
        winsNumberLabel?.text = "\(GameModel.shared.games.winCount)"
        addSubview(winsNumberLabel!)
        
        let winsTitleLabel = UILabel(frame: CGRect(
            x: quarterWidth + (statBarWidthPadding * 2),
            y: valueHeight + statBarLabelPadding,
            width: statLabelWidth,
            height: titleHeight))
        winsTitleLabel.text = "Won"
        winsTitleLabel.textAlignment = .center
        winsTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        winsTitleLabel.textColor = .nerdleLetterLightModeGray
        addSubview(winsTitleLabel)
    }
    
    private func addLossesLabels() {
        lossesNumberLabel = UILabel(frame: CGRect(
            x: quarterWidth * 2 + (statBarWidthPadding * 3),
            y: padding + statBarLabelPadding,
            width: statLabelWidth,
            height: valueHeight))
        lossesNumberLabel?.textAlignment = .center
        lossesNumberLabel?.font = UIFont(name: "RobotoSlab-Black", size: 34)
        lossesNumberLabel?.text = "\(GameModel.shared.games.lossCount)"
        addSubview(lossesNumberLabel!)
        
        let lossesTitleLabel = UILabel(frame: CGRect(
            x: quarterWidth * 2 + (statBarWidthPadding * 3),
            y: valueHeight + statBarLabelPadding,
            width: statLabelWidth,
            height: titleHeight))
        lossesTitleLabel.text = "Lost"
        lossesTitleLabel.textAlignment = .center
        lossesTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lossesTitleLabel.textColor = .nerdleLetterLightModeGray
        addSubview(lossesTitleLabel)
    }

    private func addStreakLabels() {
        streakNumberLabel = UILabel(frame: CGRect(
            x: quarterWidth * 3 + (statBarWidthPadding * 4),
            y: padding + statBarLabelPadding,
            width: statLabelWidth,
            height: valueHeight))
        streakNumberLabel?.textAlignment = .center
        streakNumberLabel?.font = UIFont(name: "RobotoSlab-Black", size: 34)
        streakNumberLabel?.text = "\(GameModel.shared.games.streakCount)"
        addSubview(streakNumberLabel!)
        
        let streakTitleLabel = UILabel(frame: CGRect(
            x: quarterWidth * 3 + (statBarWidthPadding * 4),
            y: valueHeight + statBarLabelPadding,
            width: statLabelWidth,
            height: titleHeight))
        streakTitleLabel.text = "Streak"
        streakTitleLabel.textAlignment = .center
        streakTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        streakTitleLabel.textColor = .nerdleLetterLightModeGray
        addSubview(streakTitleLabel)
    }
}

extension StatBarView: GameDelegate {
    func didUpdateGame() {
        playedNumberLabel?.text = "\(GameModel.shared.games.gameCount)"
        winsNumberLabel?.text = "\(GameModel.shared.games.winCount)"
        lossesNumberLabel?.text = "\(GameModel.shared.games.lossCount)"
        streakNumberLabel?.text = "\(GameModel.shared.games.streakCount)"
    }
}
