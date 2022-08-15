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
    
    func shake() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(translationX: -20, y: 0)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(translationX: 20, y: 0)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) {
                    self.transform = CGAffineTransform(translationX: -20, y: 0)
                } completion: { _ in
                    UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear) {
                        self.transform = CGAffineTransform(translationX: 20, y: 0)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseOut) {
                            self.transform = CGAffineTransform(translationX: 0, y: 0)
                        } completion: { _ in
                        }
                    }
                }
            }
        }
    }
    
    func jumpForJoy(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(translationX: 0, y: 10)
        } completion: { _ in
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.transform = CGAffineTransform(translationX: 0, y: 0)
            } completion: { _ in
                completion()
            }
        }
    }
    
    private func updateColors(for state: LetterState) {
        self.setBackgroundColor(for: state)
        self.setFontColor(for: state)
        self.setBorderColor(for: state)
    }
    
    
    // MARK: - Public Methods
    func setBorderActive() {
        layer.borderColor = UIColor.gridLetterActiveBorder?.cgColor
    }
    
    func setBorderInactive() {
        layer.borderColor = UIColor.gridLetterBorder?.cgColor
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
            backgroundColor = .gridLetterBackgroundBlank
        case .gray:
            backgroundColor = .gridLetterBackgroundGray
        case .yellow:
            backgroundColor = .gridLetterBackgroundYellow
        case .green:
            backgroundColor = .gridLetterBackgroundGreen
        }
    }
    
    private func setBorderColor(for state: LetterState) {
        switch state {
        case .blank:
            break
        case .gray:
            layer.borderColor = UIColor.gridLetterBackgroundGray?.cgColor
        case .yellow:
            layer.borderColor = UIColor.gridLetterBackgroundYellow?.cgColor
        case .green:
            layer.borderColor = UIColor.gridLetterBackgroundGreen?.cgColor
        }
    }
    
    private func setFontColor(for state: LetterState) {
        switch state {
        case .blank:
            if traitCollection.userInterfaceStyle == .dark {
                letterLabel.textColor = .white
            } else {
                letterLabel.textColor = .black
            }
        default:
            letterLabel.textColor = .white
        }
    }
}
