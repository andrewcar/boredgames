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
        imageView.image = .boredGamesLogoTall
        addSubview(imageView)
        activateImageConstraints()
    }
    
    // MARK: - IMAGE CONSTRAINTS
    private func activateImageConstraints() {
        NSLayoutConstraint.deactivate(imageConstraints)
        imageConstraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Frame.Logo.tallSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Frame.Logo.tallSize.height)
        ]
        NSLayoutConstraint.activate(imageConstraints)
    }
}
