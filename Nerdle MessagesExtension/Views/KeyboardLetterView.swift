//
//  KeyboardLetterView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import UIKit

class KeyboardLetterView: UIView {
    
    // MARK: - Initializers
    init(_ letter: String, frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(letter)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setupSubviews(_ letter: String) {
        backgroundColor = .nerdleKeyboardLightGray
        layer.cornerRadius = 4
        
        let letterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        letterLabel.text = letter
        letterLabel.font = .systemFont(ofSize: letter == "⌫" ? 12 : 9, weight: .bold)
        letterLabel.textAlignment = .center
        letterLabel.textColor = .black
        addSubview(letterLabel)
    }
}
