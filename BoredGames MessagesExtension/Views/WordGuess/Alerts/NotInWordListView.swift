//
//  NotInWordListView.swift
//  BoredGames MessagesExtension
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        layer.cornerCurve = .continuous
        layer.cornerRadius = 4
        backgroundColor = .notInWordListBackground
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
        titleLabel.textColor = .notInWordListText
        titleLabel.text = "Try again"
        addSubview(titleLabel)
        activateTitleConstraints()
    }
    
    private func addSubtitleLabel() {
        subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textColor = .notInWordListText
        subtitleLabel.text = "Not in word list"
        addSubview(subtitleLabel)
        activateSubtitleConstraints()
    }
    
    private func activateTitleConstraints() {
        NSLayoutConstraint.deactivate(titleConstraints)
        titleConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
            titleLabel.heightAnchor.constraint(equalToConstant: Frame.NotInWordList.size.height / 3),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    private func activateSubtitleConstraints() {
        NSLayoutConstraint.deactivate(subtitleConstraints)
        subtitleConstraints = [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -Frame.bigPadding),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(subtitleConstraints)
    }
}
