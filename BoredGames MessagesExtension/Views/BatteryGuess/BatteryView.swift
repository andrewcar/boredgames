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
    
    private var progressContainerView = UIView(frame: .zero)
    private var progressContainerPortraitConstraints: [NSLayoutConstraint] = []
    private var progressContainerLandscapeConstraints: [NSLayoutConstraint] = []
    
    var progressView = UIView(frame: .zero)
    private var progressPortraitConstraints: [NSLayoutConstraint] = []
    private var progressLandscapeConstraints: [NSLayoutConstraint] = []
    
    var chargingImageView = UIImageView(frame: .zero)
    private var chargingImagePortraitConstraints: [NSLayoutConstraint] = []
    private var chargingImageLandscapeConstraints: [NSLayoutConstraint] = []
        
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
        activateChargingImageConstraints(isLandscape: Model.shared.isLandscape)
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
    
    private func addSubviews() {
        addProgressView()
        addChargingImageView()
    }
    
    private func updateProgressView(locationX: Double) {
        let floatPercentageOfWidth = locationX / frame.width
        let floatPercentageOfWidthTimes100 = floatPercentageOfWidth * 100
        let percentageOfWidthTimes100 = Int(floatPercentageOfWidthTimes100)
        
        guard percentageOfWidthTimes100 <= 100 && percentageOfWidthTimes100 >= 1 else { return }
        currentProgress = percentageOfWidthTimes100
        
        progressView.backgroundColor = percentageOfWidthTimes100 <= 21 ? .batteryGuessRed : .gridLetterBackgroundGreen
        chargingImageView.alpha = percentageOfWidthTimes100 == 100 ? 1 : 0
        
        updateConstraints()
        batteryDelegate.didUpdate(percentage: currentProgress)
    }
    
    // MARK: - TAP
    
    private func addTapGesture() {
        tapGesture.addTarget(self, action: #selector(didTap(sender:)))
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
    }
                             
    @objc private func didTap(sender: UITapGestureRecognizer) {
        updateProgressView(locationX: sender.location(in: self).x)
    }
    
    // MARK: - PAN
    
    private func addPanGesture() {
        panGesture.maximumNumberOfTouches = 1
        panGesture.addTarget(self, action: #selector(didPan(sender:)))
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
    }

    @objc private func didPan(sender: UIPanGestureRecognizer) {
        updateProgressView(locationX: sender.location(in: self).x)
    }
        
    // MARK: - PROGRESS VIEW
    
    private func addProgressView() {
        progressContainerView.translatesAutoresizingMaskIntoConstraints = false
        progressContainerView.layer.cornerCurve = .continuous
        progressContainerView.layer.cornerRadius = 19
        addSubview(progressContainerView)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor =  .gridLetterBackgroundGreen
        progressView.layer.cornerCurve = .continuous
        progressView.layer.cornerRadius = 19
        addSubview(progressView)
    }
    
    func activateProgressConstraints(isLandscape: Bool) {
        deactivateProgressConstraints()
        let multiplier = CGFloat(currentProgress) / 100
        if isLandscape {
            progressContainerLandscapeConstraints = [
                progressContainerView.topAnchor.constraint(equalTo: topAnchor),
                progressContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                progressContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                progressContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(progressContainerLandscapeConstraints)
            progressLandscapeConstraints = [
                progressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                progressView.leadingAnchor.constraint(equalTo: progressContainerView.leadingAnchor),
                progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                progressView.widthAnchor.constraint(lessThanOrEqualTo: progressContainerView.widthAnchor, multiplier: multiplier),
                progressView.trailingAnchor.constraint(lessThanOrEqualTo: progressContainerView.trailingAnchor)
            ]
            NSLayoutConstraint.activate(progressLandscapeConstraints)
        } else {
            progressContainerPortraitConstraints = [
                progressContainerView.topAnchor.constraint(equalTo: topAnchor),
                progressContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                progressContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                progressContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(progressContainerPortraitConstraints)
            progressPortraitConstraints = [
                progressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                progressView.leadingAnchor.constraint(equalTo: progressContainerView.leadingAnchor),
                progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                progressView.widthAnchor.constraint(lessThanOrEqualTo: progressContainerView.widthAnchor, multiplier: multiplier),
                progressView.trailingAnchor.constraint(lessThanOrEqualTo: progressContainerView.trailingAnchor)
            ]
            NSLayoutConstraint.activate(progressPortraitConstraints)
        }
    }
    
    private func deactivateProgressConstraints() {
        NSLayoutConstraint.deactivate(progressContainerPortraitConstraints)
        NSLayoutConstraint.deactivate(progressContainerLandscapeConstraints)
        NSLayoutConstraint.deactivate(progressPortraitConstraints)
        NSLayoutConstraint.deactivate(progressLandscapeConstraints)
        progressContainerPortraitConstraints.removeAll()
        progressContainerLandscapeConstraints.removeAll()
        progressPortraitConstraints.removeAll()
        progressLandscapeConstraints.removeAll()
    }
    
    // MARK: - CHARGING IMAGE VIEW
    
    private func addChargingImageView() {
        chargingImageView.translatesAutoresizingMaskIntoConstraints = false
        chargingImageView.image = chargingImage()
        addSubview(chargingImageView)
    }
    
    private func chargingImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "bolt.fill",
            size: Frame.bigButtonSize,
            weight: .regular,
            color: .white)
    }
    
    private func updateChargingImage(isLandscape: Bool) {
        activateChargingImageConstraints(isLandscape: isLandscape)
        chargingImageView.image = chargingImage()
        updateConstraints()
    }
    
    private func activateChargingImageConstraints(isLandscape: Bool) {
        deactivateChargingImageConstraints()
        if isLandscape {
            chargingImageLandscapeConstraints = [
                chargingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                chargingImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                chargingImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Frame.bigButtonSize.height),
                chargingImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Frame.bigButtonSize.height)
            ]
            NSLayoutConstraint.activate(chargingImageLandscapeConstraints)
        } else {
            chargingImagePortraitConstraints = [
                chargingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                chargingImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                chargingImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Frame.bigButtonSize.height),
                chargingImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Frame.bigButtonSize.height)
            ]
            NSLayoutConstraint.activate(chargingImagePortraitConstraints)
        }
    }
    
    private func deactivateChargingImageConstraints() {
        NSLayoutConstraint.deactivate(chargingImagePortraitConstraints)
        NSLayoutConstraint.deactivate(chargingImageLandscapeConstraints)
        chargingImagePortraitConstraints.removeAll()
        chargingImageLandscapeConstraints.removeAll()
    }
}
