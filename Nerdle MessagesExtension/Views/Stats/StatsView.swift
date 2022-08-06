//
//  StatsView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/2/22.
//

import UIKit

class StatsView: UIView {
    
    // MARK: - Properties
    var statBarView: StatBarView?
    
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
        addStatBarView()
        addResetButton()
    }
    
    private func addStatBarView() {
        statBarView = StatBarView(frame: Frame.Stats.barFrame(frame))
        addSubview(statBarView!)
    }
    
    // MARK: - RESET BUTTON
    private func addResetButton() {
        let resetButton = UIButton(frame: Frame.Stats.resetButtonFrame(frame))
        resetButton.addTarget(self, action: #selector(didTapResetButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "eject.circle.fill",
            size: Frame.Stats.buttonSize,
            weight: .bold)
        resetButton.setImage(image, for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        addSubview(resetButton)
    }
    
    // MARK: - DID TAP RESET BUTTON
    @objc
    private func didTapResetButton(sender: UIButton) {
        var games = GameModel.shared.games
        games.value.removeAll()
        games.gameCount = 0
        games.winCount = 0
        games.lossCount = 0
        GamesCache.save(games)
        statBarView?.playedNumberLabel?.text = "\(games.gameCount)"
        statBarView?.winsNumberLabel?.text = "\(games.winCount)"
        statBarView?.lossesNumberLabel?.text = "\(games.lossCount)"
        GameModel.shared.games = games
    }
    
}
