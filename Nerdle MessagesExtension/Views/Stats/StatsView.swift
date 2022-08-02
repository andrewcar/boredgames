//
//  StatsView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/2/22.
//

import UIKit

class StatsView: UIView {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        addGamesPlayedLabels()
        addWinsLabels()
        addLossesLabels()
    }
    
    private func addGamesPlayedLabels() {
        let playedNumberLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        playedNumberLabel.textAlignment = .center
        playedNumberLabel.font = .systemFont(ofSize: 42, weight: .bold)
        playedNumberLabel.text = "0"
        addSubview(playedNumberLabel)
        
        let playedTitleLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        playedTitleLabel.text = "Played"
        playedTitleLabel.textAlignment = .center
        playedTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(playedTitleLabel)
    }
    
    private func addWinsLabels() {
        let winsNumberLabel = UILabel(frame: CGRect(x: 150, y: 50, width: 100, height: 100))
        winsNumberLabel.textAlignment = .center
        winsNumberLabel.font = .systemFont(ofSize: 42, weight: .bold)
        winsNumberLabel.text = "0"
        addSubview(winsNumberLabel)
        
        let winsTitleLabel = UILabel(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        winsTitleLabel.text = "Wins"
        winsTitleLabel.textAlignment = .center
        winsTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(winsTitleLabel)
    }
    
    private func addLossesLabels() {
        let lossesNumberLabel = UILabel(frame: CGRect(x: 250, y: 50, width: 100, height: 100))
        lossesNumberLabel.textAlignment = .center
        lossesNumberLabel.font = .systemFont(ofSize: 42, weight: .bold)
        lossesNumberLabel.text = "0"
        addSubview(lossesNumberLabel)
        
        let lossesTitleLabel = UILabel(frame: CGRect(x: 250, y: 100, width: 100, height: 100))
        lossesTitleLabel.text = "Losses"
        lossesTitleLabel.textAlignment = .center
        lossesTitleLabel.font = .systemFont(ofSize: 20, weight: .regular)
        addSubview(lossesTitleLabel)
    }
}
