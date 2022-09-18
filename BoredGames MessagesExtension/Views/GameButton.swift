//
//  GameButton.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 9/18/22.
//

import UIKit

class GameButton: UIButton {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
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
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.clear, for: .normal)
    }
}
