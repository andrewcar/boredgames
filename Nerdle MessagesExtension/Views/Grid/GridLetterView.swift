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
    private var letterLabel: UILabel?
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func updateLetter(with letter: String) {
        letterLabel?.text = letter
    }
    
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
    
    
    // MARK: - Public Methods
    func setBorderActive() {
        layer.borderColor = UIColor.nerdleActiveBorderLightModeGray.cgColor
    }
    
    func setBorderInactive() {
        layer.borderColor = UIColor.nerdleBorderLightModeGray.cgColor
    }
    
    
    // MARK: - Private Methods
    private func setupSubviews() {
        setupBorder()
        setupLetterLabel()
    }
    
    private func setupBorder() {
        layer.borderWidth = 2
        setBorderInactive()
    }
    
    private func setupLetterLabel() {
        letterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        letterLabel?.textAlignment = .center
        letterLabel?.font = .systemFont(ofSize: 31, weight: .bold)
        letterLabel?.textColor = .black
        addSubview(letterLabel!)
    }
    
    private func setBackgroundColor(for state: LetterState) {
        switch state {
        case .blank:
            self.backgroundColor = .white
        case .gray:
            self.backgroundColor = .nerdleLetterLightModeGray
        case .yellow:
            self.backgroundColor = .nerdleYellow
        case .green:
            self.backgroundColor = .nerdleGreen
        }
    }
}
