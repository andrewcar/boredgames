//
//  LetterView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit

class LetterView: UIView {
    
    // MARK: - Properties
    private var letterState: LetterState = .blank
    var letter: String = ""
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func updateLetter(to state: LetterState, completion: @escaping () -> ()) {
        letterState = state

        // shrink
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.frame.size.height = 1
        } completion: { _ in
            
            self.setBackgroundColor(for: state)

            // grow
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                self.frame.size.height = 50
            } completion: { _ in
                completion()
            }
        }
    }
    
    
    // MARK: - Private Methods
    private func setupSubviews() {
        setupBorder()
        setupLetterLabel()
    }
    
    private func setupBorder() {
        layer.borderColor = UIColor.nerdleBorderGray.cgColor
        layer.borderWidth = 2
    }
    
    private func setupLetterLabel() {
        let letterLabel = UILabel(frame: frame)
        letterLabel.text = letter
        letterLabel.textAlignment = .center
        letterLabel.font = .systemFont(ofSize: 27, weight: .bold)
        letterLabel.textColor = .black
        addSubview(letterLabel)
    }
    
    private func setBackgroundColor(for state: LetterState) {
        switch state {
        case .blank:
            self.backgroundColor = .white
        case .gray:
            self.backgroundColor = .nerdleLightGray
        case .yellow:
            self.backgroundColor = .nerdleYellow
        case .green:
            self.backgroundColor = .nerdleGreen
        }
    }
}
