//
//  SmallLogoView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/21/22.
//

import UIKit

protocol SmallLogoViewDelegate {
    func didTapLogoButton()
}

class SmallLogoView: UIView {
    
    // MARK: - Properties
    var smallLogoDelegate: SmallLogoViewDelegate!
    
    private var imageView = UIImageView(frame: .zero)
    private var imageConstraints: [NSLayoutConstraint] = []
    
    private var button = UIButton(frame: .zero)
    private var buttonConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addImageView()
        addButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        activateImageConstraints()
        activateButtonConstraints()
    }
    
    // MARK: - IMAGE VIEW
    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .boredGamesSmall
        addSubview(imageView)
        activateImageConstraints()
    }
    
    // MARK: - IMAGE CONSTRAINTS
    private func activateImageConstraints() {
        NSLayoutConstraint.deactivate(imageConstraints)
        imageConstraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Frame.Logo.smallSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Frame.Logo.smallSize.height)
        ]
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    // MARK: - BUTTON
    private func addButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLogo(sender:)), for: .touchUpInside)
        button.setTitle(" ", for: .normal)
        addSubview(button)
        activateButtonConstraints()
    }
    
    // MARK: - BUTTON CONSTRAINTS
    private func activateButtonConstraints() {
        NSLayoutConstraint.deactivate(buttonConstraints)
        buttonConstraints = [
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    // MARK: - DID TAP LOGO
    @objc private func didTapLogo(sender: UIButton) {
        smallLogoDelegate.didTapLogoButton()
    }
}
