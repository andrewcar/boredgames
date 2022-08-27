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
    
    var square: TicTacToeSquare?
    
    var letterLabel = UILabel(frame: .zero)
    var letterState: LetterState = .blank
    private var letterLabelConstraints: [NSLayoutConstraint] = []
    
    var button = UIButton(frame: .zero)
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
    
    // MARK: - UPDATE LETTER
    func updateLetter(with letter: String) {
        letterLabel.text = letter
    }
    
    // MARK: - UPDATE LETTER STATE
    func updateLetter(to state: LetterState, animated: Bool = true, completion: @escaping () -> ()) {
        letterState = state

        if animated {
            self.updateColors()

            // shrink
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(scaleX: 1, y: 0.1)
            } completion: { _ in
                
                // grow
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { _ in
                    completion()
                }
            }
        } else {
            updateColors()
            completion()
        }
    }
    
    func updateColors() {
        setBackgroundColor()
        setBorderColor()
    }
    
    private func setBackgroundColor() {
        switch letterState {
        case .blank:
            backgroundColor = .gridLetterBackgroundBlank
        case .gray:
            backgroundColor = .gridLetterBackgroundGray
        case .yellow:
            backgroundColor = .gridLetterBackgroundYellow
        case .green:
            backgroundColor = .gridLetterBackgroundGreen
        }
    }
    
    private func setBorderColor() {
        switch letterState {
        case .blank:
            layer.borderColor = UIColor.gridLetterBorder?.cgColor
        case .gray:
            layer.borderColor = UIColor.gridLetterBackgroundGray?.cgColor
        case .yellow:
            layer.borderColor = UIColor.gridLetterBackgroundYellow?.cgColor
        case .green:
            layer.borderColor = UIColor.gridLetterBackgroundGreen?.cgColor
        }
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addLetterLabel()
        addButton()
    }
    
    // MARK: - LETTER LABEL
    private func addLetterLabel() {
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.textAlignment = .center
        letterLabel.textColor = .white
        letterLabel.font = .customFont(named: .publicSansBold, size: 40, fallbackWeight: .bold)
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
    
    // MARK: - BUTTON
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
    
    func jumpForJoy(delay: TimeInterval = 0, completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.1, delay: delay, options: .curveLinear) {
            self.transform = CGAffineTransform(translationX: 0, y: -10)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { _ in
                completion()
            }
        }
    }
}
