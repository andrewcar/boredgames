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
    var letterLabel: UILabel?
    
    // MARK: - Initializers
    init(_ letter: String, frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(letter)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func updateColors(for state: LetterState) {
        updateBackgroundColor(for: state)
        updateTextColorToWhite()
    }
    
    
    // MARK: - Private Methods
    private func setupSubviews(_ letter: String) {
        backgroundColor = .nerdleKeyboardLightModeGray
        layer.cornerRadius = 4
        
        letterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        letterLabel?.text = letter
        letterLabel?.font = .systemFont(ofSize: letter == "⌫" ? 20 : letter == "ENTER" ? 11 : 10, weight: .bold)
        letterLabel?.textAlignment = .center
        letterLabel?.textColor = .black
        addSubview(letterLabel!)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        button.setTitle(letter, for: .normal)
        button.setTitleColor(.clear, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: letter == "⌫" ? 20 : letter == "ENTER" ? 11 : 10, weight: .bold)
        button.titleLabel?.textAlignment = .center
        addSubview(button)
    }
    
    private func updateBackgroundColor(for state: LetterState) {
        switch state {
        case .gray:
            backgroundColor = .nerdleLetterLightModeGray
        case .yellow:
            backgroundColor = .nerdleYellow
        case .green:
            backgroundColor = .nerdleGreen
        default: ()
        }
    }
    
    private func updateTextColorToWhite() {
        letterLabel?.textColor = .white
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
