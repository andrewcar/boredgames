//
//  BatteryGuessView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 10/1/22.
//

import SwiftUI

protocol BatteryGuessDelegate {
    func didTapBGSendButton()
}

class BatteryGuessView: UIView {
    
    // MARK: - Properties
    var batteryGuessDelegate: BatteryGuessDelegate!
    
    var batteryView = BatteryView(frame: .zero)
    private var batteryPortraitConstraints: [NSLayoutConstraint] = []
    private var batteryLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var capView = BatteryCapView(frame: .zero)
    private var capPortraitConstraints: [NSLayoutConstraint] = []
    private var capLandscapeConstraints: [NSLayoutConstraint] = []
    
    var percentageLabel = UILabel(frame: .zero)
    private var percentagePortraitConstraints: [NSLayoutConstraint] = []
    private var percentageLandscapeConstraints: [NSLayoutConstraint] = []
    
    var topResultLabel = UILabel(frame: .zero)
    private var topResultPortraitConstraints: [NSLayoutConstraint] = []
    private var topResultLandscapeConstraints: [NSLayoutConstraint] = []
    
    var bottomResultLabel = UILabel(frame: .zero)
    private var bottomResultPortraitConstraints: [NSLayoutConstraint] = []
    private var bottomResultLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var leftTapView = UIView(frame: .zero)
    private var leftTapPortraitConstraints: [NSLayoutConstraint] = []
    private var leftTapLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var rightTapView = UIView(frame: .zero)
    private var rightTapPortraitConstraints: [NSLayoutConstraint] = []
    private var rightTapLandscapeConstraints: [NSLayoutConstraint] = []
    
    private var sendButton = UIButton(frame: .zero)
    private var sendPortraitConstraints: [NSLayoutConstraint] = []
    private var sendLandscapeConstraints: [NSLayoutConstraint] = []
    private var sendButtonHidden = true
    
    
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
        
        activateBatteryConstraints(isLandscape: Model.shared.isLandscape)
        activateCapConstraints(isLandscape: Model.shared.isLandscape)
        activatePercentageConstraints(isLandscape: Model.shared.isLandscape)
        activateBottomResultConstraints(isLandscape: Model.shared.isLandscape)
        activateTopResultConstraints(isLandscape: Model.shared.isLandscape)
        activateLeftTapConstraints(isLandscape: Model.shared.isLandscape)
        activateRightTapConstraints(isLandscape: Model.shared.isLandscape)
        activateSendButtonConstraints(isLandscape: Model.shared.isLandscape)
        
        batteryView.updateConstraints()
    }
    
    // MARK: - Private Methods
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    private func addSubviews() {
        addBatteryView()
        addCapView()
        addPercentageLabel()
        addBottomResultLabel()
        addTopResultLabel()
        addLeftTapView()
        addRightTapView()
        addSendButton()
    }
    
    // MARK: - Battery View
    
    private func addBatteryView() {
        batteryView.batteryDelegate = self
        addSubview(batteryView)
        activateBatteryConstraints(isLandscape: false)
    }
    
    private func activateBatteryConstraints(isLandscape: Bool) {
        deactivateBatteryConstraints()
        let compactCompensation = Model.shared.isCompact ? 0.7 : 1
        let yOffset = Model.shared.isCompact ? -(UIScreen.main.bounds.width * 0.1) : 0
        if isLandscape {
            batteryLandscapeConstraints = [
                batteryView.centerXAnchor.constraint(equalTo: centerXAnchor),
                batteryView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yOffset / 2),
                batteryView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height * 0.7) * compactCompensation),
                batteryView.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.height * 0.7) * 0.45) * compactCompensation)
            ]
            NSLayoutConstraint.activate(batteryLandscapeConstraints)
        } else {
            batteryPortraitConstraints = [
                batteryView.centerXAnchor.constraint(equalTo: centerXAnchor),
                batteryView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yOffset),
                batteryView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 0.7) * compactCompensation),
                batteryView.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width * 0.7) * 0.45) * compactCompensation)
            ]
            NSLayoutConstraint.activate(batteryPortraitConstraints)
        }
    }
    
    private func deactivateBatteryConstraints() {
        NSLayoutConstraint.deactivate(batteryPortraitConstraints)
        NSLayoutConstraint.deactivate(batteryLandscapeConstraints)
        batteryPortraitConstraints.removeAll()
        batteryLandscapeConstraints.removeAll()
    }
    
    // MARK: - Cap View
    
    private func addCapView() {
        addSubview(capView)
        activateCapConstraints(isLandscape: false)
    }
    
    private func activateCapConstraints(isLandscape: Bool) {
        deactivateCapConstraints()
        if isLandscape {
            capLandscapeConstraints = [
                capView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor, constant: 4),
                capView.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                capView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.03),
                capView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07)
            ]
            NSLayoutConstraint.activate(capLandscapeConstraints)
        } else {
            capPortraitConstraints = [
                capView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor, constant: 4),
                capView.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                capView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.03),
                capView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.07)
            ]
            NSLayoutConstraint.activate(capPortraitConstraints)
        }
    }
    
    private func deactivateCapConstraints() {
        NSLayoutConstraint.deactivate(capPortraitConstraints)
        NSLayoutConstraint.deactivate(capLandscapeConstraints)
        capPortraitConstraints.removeAll()
        capLandscapeConstraints.removeAll()
    }
    
    // MARK: - Percentage Label
    
    private func addPercentageLabel() {
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        percentageLabel.font = .systemFont(ofSize: 42, weight: .bold)
        percentageLabel.textColor = .wordGuessButton
        percentageLabel.textAlignment = .center
        percentageLabel.adjustsFontSizeToFitWidth = true
        addSubview(percentageLabel)
        activatePercentageConstraints(isLandscape: false)
    }
    
    private func activatePercentageConstraints(isLandscape: Bool) {
        deactivatePercentageConstraints()
        if isLandscape {
            percentageLandscapeConstraints = [
                percentageLabel.topAnchor.constraint(equalTo: batteryView.bottomAnchor, constant: Frame.padding),
                percentageLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                percentageLabel.widthAnchor.constraint(equalTo: batteryView.widthAnchor),
                percentageLabel.heightAnchor.constraint(equalToConstant: 100)
            ]
            NSLayoutConstraint.activate(percentageLandscapeConstraints)
        } else {
            percentagePortraitConstraints = [
                percentageLabel.topAnchor.constraint(equalTo: batteryView.bottomAnchor, constant: Frame.bigPadding),
                percentageLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                percentageLabel.widthAnchor.constraint(equalTo: batteryView.widthAnchor),
                percentageLabel.heightAnchor.constraint(equalToConstant: 100)
            ]
            NSLayoutConstraint.activate(percentagePortraitConstraints)
        }
    }
    
    private func deactivatePercentageConstraints() {
        NSLayoutConstraint.deactivate(percentagePortraitConstraints)
        NSLayoutConstraint.deactivate(percentageLandscapeConstraints)
        percentagePortraitConstraints.removeAll()
        percentageLandscapeConstraints.removeAll()
    }
    
    // MARK: - Bottom Result Label
    
    private func addBottomResultLabel() {
        bottomResultLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomResultLabel.font = .systemFont(ofSize: 33, weight: .bold)
        bottomResultLabel.textColor = .wordGuessButton
        bottomResultLabel.textAlignment = .center
        bottomResultLabel.adjustsFontSizeToFitWidth = true
        addSubview(bottomResultLabel)
        activateBottomResultConstraints(isLandscape: false)
    }
    
    private func activateBottomResultConstraints(isLandscape: Bool) {
        deactivateBottomResultConstraints()
        if isLandscape {
            bottomResultLandscapeConstraints = [
                bottomResultLabel.bottomAnchor.constraint(equalTo: batteryView.topAnchor, constant: Frame.Logo.upperPadding),
                bottomResultLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                bottomResultLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -Frame.Logo.upperPadding * 2),
                bottomResultLabel.heightAnchor.constraint(equalToConstant: 69)
            ]
            NSLayoutConstraint.activate(bottomResultLandscapeConstraints)
        } else {
            bottomResultPortraitConstraints = [
                bottomResultLabel.bottomAnchor.constraint(equalTo: batteryView.topAnchor, constant: -Frame.Logo.upperPadding),
                bottomResultLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                bottomResultLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -Frame.Logo.upperPadding * 2),
                bottomResultLabel.heightAnchor.constraint(equalToConstant: 69)
            ]
            NSLayoutConstraint.activate(bottomResultPortraitConstraints)
        }
    }
    
    private func deactivateBottomResultConstraints() {
        NSLayoutConstraint.deactivate(bottomResultPortraitConstraints)
        NSLayoutConstraint.deactivate(bottomResultLandscapeConstraints)
        bottomResultPortraitConstraints.removeAll()
        bottomResultLandscapeConstraints.removeAll()
    }
    
    // MARK: - Top Result Label
    
    private func addTopResultLabel() {
        topResultLabel.translatesAutoresizingMaskIntoConstraints = false
        topResultLabel.font = .systemFont(ofSize: 25, weight: .bold)
        topResultLabel.textColor = .wordGuessButton
        topResultLabel.textAlignment = .center
        topResultLabel.adjustsFontSizeToFitWidth = true
        addSubview(topResultLabel)
        activateTopResultConstraints(isLandscape: false)
    }
    
    private func activateTopResultConstraints(isLandscape: Bool) {
        deactivateTopResultConstraints()
        if isLandscape {
            topResultLandscapeConstraints = [
                topResultLabel.bottomAnchor.constraint(equalTo: bottomResultLabel.topAnchor, constant: Frame.bigPadding),
                topResultLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                topResultLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -Frame.Logo.upperPadding * 2),
                topResultLabel.heightAnchor.constraint(equalToConstant: 69)
            ]
            NSLayoutConstraint.activate(topResultLandscapeConstraints)
        } else {
            topResultPortraitConstraints = [
                topResultLabel.bottomAnchor.constraint(equalTo: bottomResultLabel.topAnchor, constant: Frame.bigPadding),
                topResultLabel.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                topResultLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -Frame.Logo.upperPadding * 2),
                topResultLabel.heightAnchor.constraint(equalToConstant: 69)
            ]
            NSLayoutConstraint.activate(topResultPortraitConstraints)
        }
    }
    
    private func deactivateTopResultConstraints() {
        NSLayoutConstraint.deactivate(topResultPortraitConstraints)
        NSLayoutConstraint.deactivate(topResultLandscapeConstraints)
        topResultPortraitConstraints.removeAll()
        topResultLandscapeConstraints.removeAll()
    }
    
    // MARK: - Left Tap View
    
    private func addLeftTapView() {
        leftTapView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapLeftView(sender:)))
        leftTapView.addGestureRecognizer(tapGesture)
                
        addSubview(leftTapView)
        activateLeftTapConstraints(isLandscape: false)
    }
    
    @objc private func didTapLeftView(sender: UITapGestureRecognizer) {
        guard batteryView.currentProgress <= 100 && batteryView.currentProgress > 0 else { return }
        batteryView.currentProgress -= 1
        
        batteryView.redProgressView.alpha = batteryView.currentProgress <= 21 ? 1 : 0
        batteryView.greenProgressView.alpha = batteryView.currentProgress >= 21 ? 1 : 0
        batteryView.chargingImageView.alpha = batteryView.currentProgress == 100 ? 1 : 0

        didUpdate(percentage: batteryView.currentProgress)
        batteryView.updateConstraints()
    }
    
    private func activateLeftTapConstraints(isLandscape: Bool) {
        if isLandscape {
            leftTapLandscapeConstraints = [
                leftTapView.topAnchor.constraint(equalTo: batteryView.topAnchor),
                leftTapView.leadingAnchor.constraint(equalTo: leadingAnchor),
                leftTapView.trailingAnchor.constraint(equalTo: batteryView.leadingAnchor),
                leftTapView.bottomAnchor.constraint(equalTo: batteryView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(leftTapLandscapeConstraints)
        } else {
            leftTapPortraitConstraints = [
                leftTapView.topAnchor.constraint(equalTo: batteryView.topAnchor),
                leftTapView.leadingAnchor.constraint(equalTo: leadingAnchor),
                leftTapView.trailingAnchor.constraint(equalTo: batteryView.leadingAnchor),
                leftTapView.bottomAnchor.constraint(equalTo: batteryView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(leftTapPortraitConstraints)
        }
    }
    
    private func deactivateLeftTapConstraints() {
        NSLayoutConstraint.deactivate(leftTapPortraitConstraints)
        NSLayoutConstraint.deactivate(leftTapLandscapeConstraints)
        leftTapPortraitConstraints.removeAll()
        leftTapLandscapeConstraints.removeAll()
    }
    
    // MARK: - Right Tap View
    
    private func addRightTapView() {
        rightTapView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRightView(sender:)))
        rightTapView.addGestureRecognizer(tapGesture)
        
        addSubview(rightTapView)
    }
    
    @objc private func didTapRightView(sender: UITapGestureRecognizer) {
        guard batteryView.currentProgress < 100 && batteryView.currentProgress >= 0 else { return }
        batteryView.currentProgress += 1
        
        batteryView.redProgressView.alpha = batteryView.currentProgress <= 21 ? 1 : 0
        batteryView.greenProgressView.alpha = batteryView.currentProgress >= 21 ? 1 : 0
        batteryView.chargingImageView.alpha = batteryView.currentProgress == 100 ? 1 : 0

        didUpdate(percentage: batteryView.currentProgress)
        batteryView.updateConstraints()
    }
    
    private func activateRightTapConstraints(isLandscape: Bool) {
        if isLandscape {
            rightTapLandscapeConstraints = [
                rightTapView.topAnchor.constraint(equalTo: batteryView.topAnchor),
                rightTapView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor),
                rightTapView.trailingAnchor.constraint(equalTo: trailingAnchor),
                rightTapView.bottomAnchor.constraint(equalTo: batteryView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(rightTapLandscapeConstraints)
        } else {
            rightTapPortraitConstraints = [
                rightTapView.topAnchor.constraint(equalTo: batteryView.topAnchor),
                rightTapView.leadingAnchor.constraint(equalTo: batteryView.trailingAnchor),
                rightTapView.trailingAnchor.constraint(equalTo: trailingAnchor),
                rightTapView.bottomAnchor.constraint(equalTo: batteryView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(rightTapPortraitConstraints)
        }
    }
    
    private func deactivateRightTapConstraints() {
        NSLayoutConstraint.deactivate(rightTapPortraitConstraints)
        NSLayoutConstraint.deactivate(rightTapLandscapeConstraints)
        rightTapPortraitConstraints.removeAll()
        rightTapLandscapeConstraints.removeAll()
    }
    
    private func addSendButton() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setImage(sendButtonImage(), for: .normal)
        sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        addSubview(sendButton)
        activateSendButtonConstraints(isLandscape: false)
    }
    
    @objc private func didTapSendButton() {
        if let currentGame = Model.shared.currentBGGame,
            currentGame.playerOne.uuidString != nil {
            Model.shared.currentBGGame?.playerTwoGuess = "\(batteryView.currentProgress)"
        } else {
            Model.shared.currentBGGame?.playerOneGuess = "\(batteryView.currentProgress)"
        }
        batteryGuessDelegate.didTapBGSendButton()
    }
    
    private func sendButtonImage() -> UIImage {
        UIImage().scaledSystemImage(
            named: "arrow.up.message.fill",
            size: Frame.buttonSize,
            weight: .regular,
            color: .messagesBlue)
    }
    
    private func activateSendButtonConstraints(isLandscape: Bool) {
        deactivateSendButtonConstraints()
        if isLandscape {
            let offset = sendButtonHidden ? (UIScreen.main.bounds.width * 2) : 0
            sendLandscapeConstraints = [
                sendButton.leadingAnchor.constraint(equalTo: capView.trailingAnchor, constant: Frame.bigButtonSize.width + offset),
                sendButton.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                sendButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                sendButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
            ]
            NSLayoutConstraint.activate(sendLandscapeConstraints)
        } else {
            let offset = sendButtonHidden ? UIScreen.main.bounds.height : 0
            if Model.shared.isCompact {
                sendPortraitConstraints = [
                    sendButton.centerYAnchor.constraint(equalTo: batteryView.centerYAnchor),
                    sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Frame.Logo.upperPadding + offset),
                    sendButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                    sendButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
                ]
            } else {
                sendPortraitConstraints = [
                    sendButton.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: Frame.Logo.upperPadding + offset),
                    sendButton.centerXAnchor.constraint(equalTo: batteryView.centerXAnchor),
                    sendButton.widthAnchor.constraint(equalToConstant: Frame.buttonSize.width),
                    sendButton.heightAnchor.constraint(equalToConstant: Frame.buttonSize.height)
                ]
            }
            NSLayoutConstraint.activate(sendPortraitConstraints)
        }
    }
    
    private func deactivateSendButtonConstraints() {
        NSLayoutConstraint.deactivate(sendPortraitConstraints)
        NSLayoutConstraint.deactivate(sendLandscapeConstraints)
        sendPortraitConstraints.removeAll()
        sendLandscapeConstraints.removeAll()
    }
    
    // MARK: - RESET GAME
    func resetGame() {
        Model.shared.resetBGGame {
            self.percentageLabel.text = ""
            self.batteryView.currentProgress = 100
            self.updateConstraints()
        }
    }
}

extension BatteryGuessView: BatteryViewDelegate {
    func didUpdate(percentage: Int) {
        if sendButtonHidden {
            sendButtonHidden.toggle()
        }
        percentageLabel.text = "\(percentage)%"
    }
}
