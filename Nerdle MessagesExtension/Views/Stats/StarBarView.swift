//
//  StarBarView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/4/22.
//

import UIKit

class StatBarView: UIView {
    
    // MARK: - Properties
    private var oneThirdWidth: CGFloat {
        frame.width / 3
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
    var playedNumberLabel: UILabel?
    var winsNumberLabel: UILabel?
    var lossesNumberLabel: UILabel?
    
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
        backgroundColor = .nerdleBorderLightModeGray
        layer.cornerCurve = .continuous
        layer.cornerRadius = 15
    }
    
    private func addSubviews() {
        addGamesPlayedLabels()
        addWinsLabels()
        addLossesLabels()
    }
    
    private func addGamesPlayedLabels() {
        playedNumberLabel = UILabel(frame: CGRect(
            x: 0,
            y: padding,
            width: oneThirdWidth,
            height: valueHeight))
        playedNumberLabel?.textAlignment = .center
        playedNumberLabel?.font = .systemFont(ofSize: 42, weight: .bold)
        playedNumberLabel?.text = "\(GameModel.shared.games.gameCount)"
        addSubview(playedNumberLabel!)
        
        let playedTitleLabel = UILabel(frame: CGRect(
            x: 0,
            y: padding + valueHeight,
            width: oneThirdWidth,
            height: titleHeight))
        playedTitleLabel.text = "Played"
        playedTitleLabel.textAlignment = .center
        playedTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(playedTitleLabel)
    }
    
    private func addWinsLabels() {
        winsNumberLabel = UILabel(frame: CGRect(
            x: oneThirdWidth,
            y: padding,
            width: oneThirdWidth,
            height: valueHeight))
        winsNumberLabel?.textAlignment = .center
        winsNumberLabel?.font = .systemFont(ofSize: 42, weight: .bold)
        winsNumberLabel?.text = "\(GameModel.shared.games.winCount)"
        addSubview(winsNumberLabel!)
        
        let winsTitleLabel = UILabel(frame: CGRect(
            x: oneThirdWidth,
            y: padding + valueHeight,
            width: oneThirdWidth,
            height: titleHeight))
        winsTitleLabel.text = "Wins"
        winsTitleLabel.textAlignment = .center
        winsTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(winsTitleLabel)
    }
    
    private func addLossesLabels() {
        lossesNumberLabel = UILabel(frame: CGRect(
            x: oneThirdWidth * 2,
            y: padding,
            width: oneThirdWidth,
            height: valueHeight))
        lossesNumberLabel?.textAlignment = .center
        lossesNumberLabel?.font = .systemFont(ofSize: 42, weight: .bold)
        lossesNumberLabel?.text = "\(GameModel.shared.games.lossCount)"
        addSubview(lossesNumberLabel!)
        
        let lossesTitleLabel = UILabel(frame: CGRect(
            x: oneThirdWidth * 2,
            y: padding + valueHeight,
            width: oneThirdWidth,
            height: titleHeight))
        lossesTitleLabel.text = "Losses"
        lossesTitleLabel.textAlignment = .center
        lossesTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(lossesTitleLabel)
    }

}
