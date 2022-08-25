//
//  SuccessView.swift
//  BoredGames MessagesExtension
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
        translatesAutoresizingMaskIntoConstraints = false
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
        if let answer = Model.shared.currentFLGGame?.answer {
            titleLabel.text = answer.uppercased()
        }
        backgroundColor = .successBackgroundRed
    }
    
    func reset() {
        titleLabel.text = "SUCCESS"
        backgroundColor = .successBackgroundGreen
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
