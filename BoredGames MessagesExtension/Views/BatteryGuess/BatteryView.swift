//
//  BatteryView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/10/22.
//

import UIKit

class BatteryView: UIView {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addBorder()
        addSubviews()
    }
    
    private func addBorder() {
        layer.borderColor = UIColor.wordGuessButton?.cgColor
        layer.borderWidth = 4
        layer.cornerCurve = .continuous
        layer.cornerRadius = 25
    }
    
    private func addSubviews() {
        //
    }
}

