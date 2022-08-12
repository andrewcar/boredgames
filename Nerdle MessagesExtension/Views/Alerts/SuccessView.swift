//
//  SuccessView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/30/22.
//

import UIKit

class SuccessView: UIView {
    
    // MARK: - Properties
    private var titleLabel = UILabel()
    private var titleLabelConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setCornerRadius()
        reset()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func showAnswer() {
        if let answer = GameModel.shared.currentGame?.answer {
            titleLabel.text = answer.uppercased()
        }
        backgroundColor = .nerdleRed
    }
    
    func reset() {
        titleLabel.text = "SUCCESS"
        backgroundColor = .nerdleGreen
        isHidden = true
    }
    
    
    // MARK: - Private Methods
    private func addSubviews() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.text = "SUCCESS"
        addSubview(titleLabel)
        activateTitleLabelConstraints()
    }
    
    private func activateTitleLabelConstraints() {
        NSLayoutConstraint.deactivate(titleLabelConstraints)
        titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    private func setCornerRadius() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = 4
    }
}
