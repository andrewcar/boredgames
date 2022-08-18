//
//  ColorView.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 8/17/22.
//

import UIKit

protocol ColorViewDelegate {
    func didTapColor(playerColor: PlayerColor)
}

class ColorView: UIView {
    
    // MARK: - Properties
    var colorViewDelegate: ColorViewDelegate!
    var playerColor: PlayerColor?
    private var circleView = UIView()
    private var circleViewConstraints: [NSLayoutConstraint] = []
    private var button = UIButton()
    private var buttonConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    init(frame: CGRect, playerColor: PlayerColor) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.playerColor = playerColor
        addSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addCircleView()
        addButton()
    }
    
    // MARK: - CIRCLE VIEW
    private func addCircleView() {
        circleView = UIView(frame: .zero)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        if let playerColor = playerColor {
            circleView.backgroundColor = color(for: playerColor)
        }
        circleView.layer.cornerCurve = .continuous
        circleView.layer.cornerRadius = Frame.Colors.colorSize.width / 2
        addSubview(circleView)
        activateCircleViewConstraints()
    }
    
    // MARK: - CIRCLE VIEW CONSTRAINTS
    private func activateCircleViewConstraints() {
        NSLayoutConstraint.deactivate(circleViewConstraints)
        circleViewConstraints = [
            circleView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorSize.width),
            circleView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorSize.height),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(circleViewConstraints)
    }
    
    // MARK: - BUTTON
    private func addButton() {
        button = UIButton(frame: .zero)
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
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    // MARK: - DID TAP BUTTON
    @objc private func didTapButton(sender: UIButton) {
        if let playerColor = playerColor {
            colorViewDelegate.didTapColor(playerColor: playerColor)
        }
    }
    
    // MARK: - UIColor FOR PlayerColor
    private func color(for playerColor: PlayerColor) -> UIColor {
        switch playerColor {
        case .red:
            return UIColor.systemRed
        case .orange:
            return UIColor.systemOrange
        case .yellow:
            return UIColor.systemYellow
        case .green:
            return UIColor.systemGreen
        case .blue:
            return UIColor.systemBlue
        case .purple:
            return UIColor.systemPurple
        }
    }
}
