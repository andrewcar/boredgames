//
//  BatteryCapView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/11/22.
//

import UIKit

class BatteryCapView: UIView {
    
    // MARK: - Properties
    private var coverView = UIView(frame: .zero)
    private var coverPortraitConstraints: [NSLayoutConstraint] = []
    private var coverLandscapeConstraints: [NSLayoutConstraint] = []
    
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
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .wordGuessButton
        layer.cornerCurve = .continuous
        layer.cornerRadius = (UIScreen.main.bounds.width * 0.05) / 3
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
}
