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
        
        if Model.shared.isLandscape {
            activateBatteryConstraints(isLandscape: true)
            activateCapConstraints(isLandscape: true)
        } else {
            activateBatteryConstraints(isLandscape: false)
            activateCapConstraints(isLandscape: false)
        }
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
    }
    
    private func addBatteryView() {
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
}
