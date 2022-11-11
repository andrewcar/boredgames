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
    
    var redProgressView = UIView(frame: .zero)
    private var redProgressPortraitConstraints: [NSLayoutConstraint] = []
    private var redProgressLandscapeConstraints: [NSLayoutConstraint] = []

    var greenProgressView = UIView(frame: .zero)
    private var greenProgressPortraitConstraints: [NSLayoutConstraint] = []
    private var greenProgressLandscapeConstraints: [NSLayoutConstraint] = []
    
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
        activateRedProgressConstraints(isLandscape: Model.shared.isLandscape)
        activateGreenProgressConstraints(isLandscape: Model.shared.isLandscape)
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
        addRedProgressView()
        addGreenProgressView()
        addChargingImageView()
    }
    
    private func updateProgressView(locationX: Double) {
        let floatPercentageOfWidth = locationX / frame.width
        let floatPercentageOfWidthTimes100 = floatPercentageOfWidth * 100
        let percentageOfWidthTimes100 = Int(floatPercentageOfWidthTimes100)
        
        guard percentageOfWidthTimes100 <= 100 && percentageOfWidthTimes100 >= 1 else { return }
        currentProgress = percentageOfWidthTimes100
        
        redProgressView.alpha = percentageOfWidthTimes100 <= 21 ? 1 : 0
        greenProgressView.alpha = percentageOfWidthTimes100 >= 21 ? 1 : 0
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
    
    // MARK: - RED PROGRESS VIEW
    
    private func addRedProgressView() {
        redProgressView.translatesAutoresizingMaskIntoConstraints = false
        redProgressView.backgroundColor =  .batteryGuessRed
        redProgressView.layer.cornerCurve = .continuous
        redProgressView.layer.cornerRadius = 19
        addSubview(redProgressView)
    }
    
    private func activateRedProgressConstraints(isLandscape: Bool) {
        deactivateRedProgressConstraints()
        if isLandscape {
            redProgressLandscapeConstraints = [
                redProgressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                redProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                redProgressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                redProgressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                redProgressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(redProgressLandscapeConstraints)
        } else {
            redProgressPortraitConstraints = [
                redProgressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                redProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                redProgressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                redProgressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                redProgressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(redProgressPortraitConstraints)
        }
    }
    
    private func deactivateRedProgressConstraints() {
        NSLayoutConstraint.deactivate(redProgressPortraitConstraints)
        NSLayoutConstraint.deactivate(redProgressLandscapeConstraints)
        redProgressPortraitConstraints.removeAll()
        redProgressLandscapeConstraints.removeAll()
    }
    
    // MARK: - GREEN PROGRESS VIEW
    
    private func addGreenProgressView() {
        greenProgressView.translatesAutoresizingMaskIntoConstraints = false
        greenProgressView.backgroundColor =  .gridLetterBackgroundGreen
        greenProgressView.layer.cornerCurve = .continuous
        greenProgressView.layer.cornerRadius = 19
        addSubview(greenProgressView)
    }
    
    private func activateGreenProgressConstraints(isLandscape: Bool) {
        deactivateGreenProgressConstraints()
        if isLandscape {
            greenProgressLandscapeConstraints = [
                greenProgressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                greenProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                greenProgressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                greenProgressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                greenProgressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(greenProgressLandscapeConstraints)
        } else {
            greenProgressPortraitConstraints = [
                greenProgressView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.bigPadding),
                greenProgressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.bigPadding),
                greenProgressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Frame.bigPadding),
                greenProgressView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: CGFloat(currentProgress) / 100),
                greenProgressView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -Frame.bigPadding)
            ]
            NSLayoutConstraint.activate(greenProgressPortraitConstraints)
        }
    }
    
    private func deactivateGreenProgressConstraints() {
        NSLayoutConstraint.deactivate(greenProgressPortraitConstraints)
        NSLayoutConstraint.deactivate(greenProgressLandscapeConstraints)
        greenProgressPortraitConstraints.removeAll()
        greenProgressLandscapeConstraints.removeAll()
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
