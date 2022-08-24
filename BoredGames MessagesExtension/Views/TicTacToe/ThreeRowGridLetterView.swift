//
//  ThreeRowGridLetterView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/21/22.
//

import UIKit

protocol ThreeRowGridLetterViewDelegate {
    func didTapButton(sender: UIButton)
}

class ThreeRowGridLetterView: UIView {
    
    // MARK: - Properties
    var letterViewDelegate: ThreeRowGridLetterViewDelegate!
    private var letterLabel = UILabel(frame: .zero)
    private var letterLabelConstraints: [NSLayoutConstraint] = []
    
    private var button = UIButton(frame: .zero)
    private var buttonConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addBorder()
        addLetterLabel()
        addButton()
    }
    
    // MARK: - BORDER
    private func addBorder() {
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2
    }
    
    // MARK: - LETTER LABEL
    private func addLetterLabel() {
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.textAlignment = .center
        letterLabel.font = .customFont(named: .publicSansBold, size: 30, fallbackWeight: .bold)
        addSubview(letterLabel)
        activateLetterLabelConstraints()
    }
    
    // MARK: - LETTER LABEL CONSTRAINTS
    private func activateLetterLabelConstraints() {
        NSLayoutConstraint.deactivate(letterLabelConstraints)
        letterLabelConstraints = [
            letterLabel.topAnchor.constraint(equalTo: topAnchor),
            letterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            letterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            letterLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(letterLabelConstraints)
    }
    
    // MARK: - BUTTO
    private func addButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        addSubview(button)
        activateButtonConstraints()
    }
    
    // MARK: - BUTTON CONSTRAINTS
    private func activateButtonConstraints() {
        NSLayoutConstraint.deactivate(buttonConstraints)
        buttonConstraints = [
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    // MARK: - DID TAP BUTTON
    @objc private func didTapButton(sender: UIButton) {
        letterViewDelegate.didTapButton(sender: sender)
    }
}
