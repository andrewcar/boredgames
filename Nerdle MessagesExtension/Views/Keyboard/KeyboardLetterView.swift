//
//  KeyboardLetterView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import UIKit

protocol LetterDelegate {
    func didTapLetter(_ letter: String)
    func didTapBackspace()
    func didTapEnter()
}

class KeyboardLetterView: UIView {
    
    // MARK: - Properties
    var letterDelegate: LetterDelegate!
    
    // MARK: - Initializers
    init(_ letter: String, frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(letter)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setupSubviews(_ letter: String) {
        backgroundColor = .nerdleKeyboardLightGray
        layer.cornerRadius = 4
        
        let letterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        letterLabel.text = letter
        letterLabel.font = .systemFont(ofSize: letter == "⌫" ? 20 : letter == "ENTER" ? 11 : 10, weight: .bold)
        letterLabel.textAlignment = .center
        letterLabel.textColor = .black
        addSubview(letterLabel)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        button.setTitle(letter, for: .normal)
        button.setTitleColor(.clear, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: letter == "⌫" ? 20 : letter == "ENTER" ? 11 : 10, weight: .bold)
        button.titleLabel?.textAlignment = .center
        addSubview(button)
    }
    
    @objc
    private func didTapButton(sender: UIButton) {
        if let letter = sender.currentTitle {
            if letter == "ENTER" {
                letterDelegate.didTapEnter()
            } else if letter == "⌫" {
                letterDelegate.didTapBackspace()
            } else {
                letterDelegate.didTapLetter(letter)
            }
        }
    }
}
