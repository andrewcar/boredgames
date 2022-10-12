//
//  BatteryView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/10/22.
//

import UIKit

protocol BatteryViewDelegate {
    func didUpdate(percentage: Int)
}

class BatteryView: UIView, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    var batteryDelegate: BatteryViewDelegate!
    
    private var tapGesture = UITapGestureRecognizer()
    private var panGesture = UIPanGestureRecognizer()
    
    private var progressView = UIView(frame: .zero)
    private var progressPortraitConstraints: [NSLayoutConstraint] = []
    private var progressLandscapeConstraints: [NSLayoutConstraint] = []
    
    var currentProgress = 100
        
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    override func updateConstraints() {
        super.updateConstraints()
        activateProgressConstraints(isLandscape: Model.shared.isLandscape)
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addBorder()
        addTapGesture()
        addPanGesture()
        addSubviews()
    }
    
    private func addBorder() {
        layer.borderColor = UIColor.wordGuessButton?.cgColor
        layer.borderWidth = 4
        layer.cornerCurve = .continuous
        layer.cornerRadius = 25
    }
    
    private func addTapGesture() {
        tapGesture.addTarget(self, action: #selector(didTap(sender:)))
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
    }
                             
    @objc private func didTap(sender: UITapGestureRecognizer) {
        let locationX = sender.location(in: self).x
        let floatPercentageOfWidth = (locationX / frame.width) * 100
        let percentageOfWidth = Int(floatPercentageOfWidth)
        guard percentageOfWidth <= 100 && percentageOfWidth >= 1 else { return }
        
        currentProgress = percentageOfWidth
        updateConstraints()
        batteryDelegate.didUpdate(percentage: currentProgress)
    }
    
    private func addPanGesture() {
        panGesture.maximumNumberOfTouches = 1
        panGesture.addTarget(self, action: #selector(didPan(sender:)))
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
    }

    @objc private func didPan(sender: UIPanGestureRecognizer) {
        let locationX = sender.location(in: self).x
        let floatPercentageOfWidth = (locationX / frame.width) * 100
        let percentageOfWidth = Int(floatPercentageOfWidth)
        guard percentageOfWidth <= 100 && percentageOfWidth >= 1 else { return }
        
        currentProgress = percentageOfWidth
        updateConstraints()
        batteryDelegate.didUpdate(percentage: currentProgress)
    }
    
    private func addSubviews() {
        addProgressView()
    }
    
    private func addProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .wordGuessButton
        progressView.layer.cornerCurve = .continuous
        progressView.layer.cornerRadius = 19
        addSubview(progressView)
    }
    
    private func activateProgressConstraints(isLandscape: Bool) {
        deactivateProgressConstraints()
        if isLandscape {
            progressLandscapeConstraints = [
                progressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                progressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                progressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(progressLandscapeConstraints)
        } else {
            progressPortraitConstraints = [
                progressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                progressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                progressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(progressPortraitConstraints)
        }
    }
    
    private func deactivateProgressConstraints() {
        NSLayoutConstraint.deactivate(progressPortraitConstraints)
        NSLayoutConstraint.deactivate(progressLandscapeConstraints)
        progressPortraitConstraints.removeAll()
        progressLandscapeConstraints.removeAll()
    }
}
