//
//  BatteryGuessView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/1/22.
//

import SwiftUI

class BatteryGuessView: UIView {
    
    // MARK: - Properties
    private var batteryView = BatteryView(frame: .zero)
    private var batteryPortraitConstraints: [NSLayoutConstraint] = []
    private var batteryLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var capView = BatteryCapView(frame: .zero)
    private var capPortraitConstraints: [NSLayoutConstraint] = []
    private var capLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var percentageLabel = UILabel(frame: .zero)
    private var percentagePortraitConstraints: [NSLayoutConstraint] = []
    private var percentageLandscapeConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    override func updateConstraints() {
        super.updateConstraints()
        
        activateBatteryConstraints(isLandscape: Model.shared.isLandscape)
        activateCapConstraints(isLandscape: Model.shared.isLandscape)
        activatePercentageLabel(isLandscape: Model.shared.isLandscape)
        
        batteryView.updateConstraints()
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    private func addSubviews() {
        addBatteryView()
        addCapView()
        addPercentageLabel()
    }
    
    // MARK: - Battery View
    
    private func addBatteryView() {
        batteryView.batteryDelegate = self
        addSubview(batteryView)
        activateBatteryConstraints(isLandscape: false)
    }
    
    private func activateBatteryConstraints(isLandscape: Bool) {
        deactivateBatteryConstraints()
        if isLandscape {
            batteryLandscapeConstraints = [
                batteryView.centerXAnchor.constraint(equalTo: centerXAnchor),
                batteryView.centerYAnchor.constraint(equalTo: centerYAnchor),
                batteryView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.7),
                batteryView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height * 0.7) * 0.45)
            ]
            NSLayoutConstraint.activate(batteryLandscapeConstraints)
        } else {
            batteryPortraitConstraints = [
                batteryView.centerXAnchor.constraint(equalTo: centerXAnchor),
                batteryView.centerYAnchor.constraint(equalTo: centerYAnchor),
                batteryView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7),
                batteryView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.7) * 0.45)
            ]
            NSLayoutConstraint.activate(batteryPortraitConstraints)
        }
    }
    
    private func deactivateBatteryConstraints() {
        NSLayoutConstraint.deactivate(batteryPortraitConstraints)
        NSLayoutConstraint.deactivate(batteryLandscapeConstraints)
        batteryPortraitConstraints.removeAll()
        batteryLandscapeConstraints.removeAll()
    }
    
    // MARK: - Cap View
    
    private func addCapView() {
        addSubview(capView)
        activateCapConstraints(isLandscape: false)
    }
    
    private func activateCapConstraints(isLandscape: Bool) {
        deactivateCapConstraints()
        if isLandscape {
            capLandscapeConstraints = [
                capView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor, constant: Frame.smallPadding),
                capView.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                capView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.03),
                capView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07)
            ]
            NSLayoutConstraint.activate(capLandscapeConstraints)
        } else {
            capPortraitConstraints = [
                capView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor, constant: Frame.smallPadding),
                capView.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                capView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.03),
                capView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.07)
            ]
            NSLayoutConstraint.activate(capPortraitConstraints)
        }
    }
    
    private func deactivateCapConstraints() {
        NSLayoutConstraint.deactivate(capPortraitConstraints)
        NSLayoutConstraint.deactivate(capLandscapeConstraints)
        capPortraitConstraints.removeAll()
        capLandscapeConstraints.removeAll()
    }
    
    // MARK: - Percentage Label
    
    private func addPercentageLabel() {
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.font = .systemFont(ofSize: 42, weight: .bold)
        percentageLabel.textColor = .wordGuessButton
        percentageLabel.textAlignment = .center
        percentageLabel.adjustsFontSizeToFitWidth = true
        addSubview(percentageLabel)
        activatePercentageLabel(isLandscape: false)
    }
    
    private func activatePercentageLabel(isLandscape: Bool) {
        deactivatePercentageConstraints()
        if isLandscape {
            percentageLandscapeConstraints = [
                percentageLabel.topAnchor.constraint(equalTo: batteryView.bottomAnchor, constant: Frame.bigPadding),
                percentageLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                percentageLabel.widthAnchor.constraint(equalTo: batteryView.widthAnchor),
                percentageLabel.heightAnchor.constraint(equalToConstant: 100)
            ]
            NSLayoutConstraint.activate(percentageLandscapeConstraints)
        } else {
            percentagePortraitConstraints = [
                percentageLabel.topAnchor.constraint(equalTo: batteryView.bottomAnchor, constant: Frame.bigPadding),
                percentageLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                percentageLabel.widthAnchor.constraint(equalTo: batteryView.widthAnchor),
                percentageLabel.heightAnchor.constraint(equalToConstant: 100)
            ]
            NSLayoutConstraint.activate(percentagePortraitConstraints)
        }
    }
    
    private func deactivatePercentageConstraints() {
        NSLayoutConstraint.deactivate(percentagePortraitConstraints)
        NSLayoutConstraint.deactivate(percentageLandscapeConstraints)
        percentagePortraitConstraints.removeAll()
        percentageLandscapeConstraints.removeAll()
    }
}

extension BatteryGuessView: BatteryViewDelegate {
    func didUpdate(percentage: Double) {
        let percentageTimesOneHundred = percentage * 100
        let percentageTrimmingRemainder = String(format: "%.0f", percentageTimesOneHundred)
        percentageLabel.text = "\(percentageTrimmingRemainder)%"
    }
}
