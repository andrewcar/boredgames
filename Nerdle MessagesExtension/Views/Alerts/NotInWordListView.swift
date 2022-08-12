//
//  NotInWordListView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/29/22.
//

import UIKit

class NotInWordListView: UIView {
    
    // MARK: - Properties
    private var titleLabel = UILabel()
    private var titleConstraints: [NSLayoutConstraint] = []
    
    private var subtitleLabel = UILabel()
    private var subtitleConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setup() {
        addSubviews()
        layer.cornerCurve = .continuous
        layer.cornerRadius = 4
        backgroundColor = .nerdleBorderDarkModeGray
        isHidden = true
    }
    
    private func addSubviews() {
        addTitleLabel()
        addSubtitleLabel()
    }
    
    private func addTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "Try again"
        addSubview(titleLabel)
        activateTitleConstraints()
    }
    
    private func addSubtitleLabel() {
        subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textColor = .white
        subtitleLabel.text = "Not in word list"
        addSubview(subtitleLabel)
        activateSubtitleConstraints()
    }
    
    private func activateTitleConstraints() {
        NSLayoutConstraint.deactivate(titleConstraints)
        let padding = (frame.height / 3) / 2
        titleConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: frame.height / 3),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    private func activateSubtitleConstraints() {
        NSLayoutConstraint.deactivate(subtitleConstraints)
        subtitleConstraints = [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: frame.height / 3),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(subtitleConstraints)
    }
}
