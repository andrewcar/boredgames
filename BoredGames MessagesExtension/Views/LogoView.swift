//
//  LogoView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/16/22.
//

import UIKit

class LogoView: UIView {
    
    // MARK: - Properties    
    private var imageView = UIImageView(frame: .zero)
    private var imageConstraints: [NSLayoutConstraint] = []
    
    private var label = UILabel(frame: .zero)
    private var labelConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addImageView()
//        addLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        activateImageConstraints()
//        activateLabelConstraints()
    }
    
    // MARK: - IMAGE VIEW
    private func addImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = .boredGamesTall
        addSubview(imageView)
        activateImageConstraints()
    }
    
    // MARK: - IMAGE CONSTRAINTS
    private func activateImageConstraints() {
        NSLayoutConstraint.deactivate(imageConstraints)
        imageConstraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.height)
        ]
        NSLayoutConstraint.activate(imageConstraints)
    }
    
    // MARK: - LABEL
    private func addLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Super Cool\nApp, Very Promising"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
    }
    
    // MARK: - LABEL CONSTRAINTS
    private func activateLabelConstraints() {
        NSLayoutConstraint.deactivate(labelConstraints)
        labelConstraints = [
            label.topAnchor.constraint(equalTo: topAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.width),
            label.heightAnchor.constraint(equalToConstant: Frame.Logo.targetTallSize.height)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
}
