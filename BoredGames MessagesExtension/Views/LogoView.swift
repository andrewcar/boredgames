//
//  LogoView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/16/22.
//

import UIKit

class LogoView: UIView {
    
    // MARK: - Properties
    private var imageView = UIImageView()
    private var imageConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        activateImageConstraints()
    }
    
    // MARK: - IMAGE VIEW
    private func addImageView() {
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "werd")
        addSubview(imageView)
        activateImageConstraints()
    }
    
    // MARK: - IMAGE CONSTRAINTS
    private func activateImageConstraints() {
        NSLayoutConstraint.deactivate(imageConstraints)
        let offset = GameModel.shared.appState == .fiveLetterGuess ? 0 : UIScreen.main.bounds.width
        imageConstraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset),
            imageView.widthAnchor.constraint(equalToConstant: Frame.Logo.size.width),
            imageView.heightAnchor.constraint(equalToConstant: Frame.Logo.size.height)
        ]
        NSLayoutConstraint.activate(imageConstraints)
    }
}
