//
//  GridLetterView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit

class GridLetterView: UIView {
    
    // MARK: - Properties
    private var letterState: LetterState = .blank
    private var letterLabel = UILabel()
    private var letterConstraints: [NSLayoutConstraint] = []
    
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
    
    
    // MARK: - Public Methods
    func updateLetter(with letter: String) {
        letterLabel.text = letter
    }
    
    func updateLetter(to state: LetterState, animated: Bool = true, completion: @escaping () -> ()) {
        letterState = state

        if animated {
            // shrink
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(scaleX: 1, y: 0.1)
            } completion: { _ in
                
                self.updateColors(for: state)
                // grow
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { _ in
                    completion()
                }
            }
        } else {
            updateColors(for: state)
            completion()
        }
    }
    
    private func updateColors(for state: LetterState) {
        self.setBackgroundColor(for: state)
        self.setFontColor(for: state)
        self.setBorderColor(for: state)
    }
    
    
    // MARK: - Public Methods
    func setBorderActive() {
        layer.borderColor = UIColor.nerdleActiveBorderLightModeGray.cgColor
    }
    
    func setBorderInactive() {
        layer.borderColor = UIColor.nerdleBorderLightModeGray.cgColor
    }
    
    func growAndShrink() {
        UIView.animate(withDuration: 0.05, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            UIView.animate(withDuration: 0.05, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { _ in
            }
        }
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        addBorder()
        addLetterLabel()
    }
    
    private func addBorder() {
        layer.borderWidth = 2
        setBorderInactive()
    }
    
    private func addLetterLabel() {
        letterLabel = UILabel(frame: .zero)
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.textAlignment = .center
        letterLabel.font = .systemFont(ofSize: 31, weight: .bold)
        letterLabel.textColor = .black
        addSubview(letterLabel)
        activateLetterConstraints()
    }
    
    private func activateLetterConstraints() {
        NSLayoutConstraint.deactivate(letterConstraints)
        letterConstraints = [
            letterLabel.topAnchor.constraint(equalTo: topAnchor),
            letterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            letterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            letterLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(letterConstraints)
    }
    
    private func setBackgroundColor(for state: LetterState) {
        switch state {
        case .blank:
            backgroundColor = .white
        case .gray:
            backgroundColor = .nerdleLetterLightModeGray
        case .yellow:
            backgroundColor = .nerdleYellow
        case .green:
            backgroundColor = .nerdleGreen
        }
    }
    
    private func setBorderColor(for state: LetterState) {
        switch state {
        case .blank:
            break
        case .gray:
            layer.borderColor = UIColor.nerdleLetterLightModeGray.cgColor
        case .yellow:
            layer.borderColor = UIColor.nerdleYellow.cgColor
        case .green:
            layer.borderColor = UIColor.nerdleGreen.cgColor
        }
    }
    
    private func setFontColor(for state: LetterState) {
        switch state {
        case .blank:
            letterLabel.textColor = .black
        default:
            letterLabel.textColor = .white
        }
    }
}
