//
//  MessagesViewController.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit
import Messages
import MessageUI

class MessagesViewController: MSMessagesAppViewController {
    
    // MARK: - Properties
    private var containerView = ContainerView(frame: .zero)
    private var containerConstraints: [NSLayoutConstraint] = []
    
    private var batteryLevel: Float {
#if DEBUG
        abs(UIDevice.current.batteryLevel)
#else
        UIDevice.current.batteryLevel
#endif
    }
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addContainerView()
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        Model.shared.isCompact = presentationStyle == .compact ? true : false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setOrientation()
        activateContainerConstraints()
        containerView.updateConstraints()
    }
    
    private func setOrientation() {
        let isPortrait = UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height
        Model.shared.isLandscape = !isPortrait
    }
    
    // MARK: - CONTAINER VIEW
    private func addContainerView() {
        containerView.containerDelegate = self
        view.addSubview(containerView)
    }
    
    // MARK: - CONTAINER CONSTRAINTS
    private func activateContainerConstraints() {
        NSLayoutConstraint.deactivate(containerConstraints)
        containerConstraints = [
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(containerConstraints)
    }
    
    // MARK: - BECOME FIRST RESPONDER
    override func becomeFirstResponder() -> Bool {
        true
    }
    
    // MARK: - SHAKE
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        guard motion == .motionShake else { return }
        if Model.shared.currentGuess == "ACSVP" {
            showDebugView()
        } else {
            showContainer()
        }
    }
    
    // MARK: - SHOW CONTAINER
    private func showContainer() {
        guard Model.shared.appState != .container else { return }
        Model.shared.appState = .container
        containerView.updateConstraints()
    }
    
    // MARK: - SHOW DEBUG VIEW
    private func showDebugView() {
        guard Model.shared.appState != .debug else { return }
        Model.shared.appState = .debug
        containerView.updateConstraints()
    }
    
    // MARK: - DECODE
    private func appStateFromDecoding(_ message: MSMessage) -> AppState {
        guard let url = message.url else {
            print("Could not get URL from MSMessage.")
            return .container
        }
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false) else {
            print("Could not create NSURLComponents from MSMessage URL.")
            return .container
        }
        
        if let queryItems = components.queryItems {
            
            var gameType: String?
            for queryItem in queryItems {
                if queryItem.name == "gameType", let value = queryItem.value {
                    gameType = value
                }
            }
            
            if let gameType = gameType {
                if gameType == GameType.wordGuess.rawValue {
                    decodeWordGuessMessage(queryItems: queryItems)
                    return .wordGuess
                } else if gameType == GameType.ticTacToe.rawValue {
                    decodeTicTacToeMessage(queryItems: queryItems)
                    return .ticTacToe
                } else if gameType == GameType.batteryGuess.rawValue {
                    decodeBatteryGuessMessage(queryItems: queryItems)
                    return .batteryGuess
                }
            }
        }
        return .container
    }
    
    // MARK: - DECODE WORD GUESS MESSAGE
    private func decodeWordGuessMessage(queryItems: [URLQueryItem]) {
        var id: UUID?
        var answer: String?
        var firstGuess: String?
        var secondGuess: String?
        var thirdGuess: String?
        var fourthGuess: String?
        var fifthGuess: String?
        var sixthGuess: String?
        var guessNumber: String?
        var state: String?
        var playerOneUUID: String?
        var playerTwoUUID: String?
        var currentPlayerUUID: String?
        
        for queryItem in queryItems {
            if let value = queryItem.value {
                switch queryItem.name {
                case "id":
                    if !value.isEmpty {
                        id = UUID(uuidString: value)
                    }
                case "answer":
                    if !value.isEmpty {
                        answer = value
                    }
                case "guess1":
                    if !value.isEmpty {
                        firstGuess = value
                    }
                case "guess2":
                    if !value.isEmpty {
                        secondGuess = value
                    }
                case "guess3":
                    if !value.isEmpty {
                        thirdGuess = value
                    }
                case "guess4":
                    if !value.isEmpty {
                        fourthGuess = value
                    }
                case "guess5":
                    if !value.isEmpty {
                        fifthGuess = value
                    }
                case "guess6":
                    if !value.isEmpty {
                        sixthGuess = value
                    }
                case "guessNumber":
                    if !value.isEmpty {
                        guessNumber = value
                    }
                case "state":
                    if !value.isEmpty {
                        state = value
                    }
                case "playerOneUUID":
                    if !value.isEmpty {
                        playerOneUUID = value
                    }
                case "playerTwoUUID":
                    if !value.isEmpty {
                        playerTwoUUID = value
                    }
                case "currentPlayerUUID":
                    if !value.isEmpty {
                        currentPlayerUUID = value
                    }
                default: ()
                }
            }
        }
        
        let guessNumberValue = guessNumber ?? "first"
        let stateValue = state ?? "playing"
        
        if let id = id {
            let game = WordGuessGame(
                gameType: .wordGuess,
                id: id,
                answer: answer,
                guess1: firstGuess,
                guess2: secondGuess,
                guess3: thirdGuess,
                guess4: fourthGuess,
                guess5: fifthGuess,
                guess6: sixthGuess,
                guessNumber: Guess(rawValue: guessNumberValue),
                state: WGGameState(rawValue: stateValue) ?? .playing,
                playerOne: Player(uuidString: playerOneUUID, color: .blue),
                playerTwo: Player(uuidString: playerTwoUUID, color: .red),
                currentPlayerUUID: currentPlayerUUID)
            Model.shared.currentWGGame = game
            Model.shared.resetAnswerLetterCountDictionary {}
            Model.shared.populateAnswerLetterCountDictionary {}
        }
    }
    
    // MARK: - DECODE TIC TAC TOE MESSAGE
    private func decodeTicTacToeMessage(queryItems: [URLQueryItem]) {
        var id: UUID?
        var a1: String?
        var a2: String?
        var a3: String?
        var b1: String?
        var b2: String?
        var b3: String?
        var c1: String?
        var c2: String?
        var c3: String?
        var turnNumber: String?
        var playerOneUUID: String?
        var playerTwoUUID: String?
        var currentPlayerUUID: String?
        var winnerUUID: String?
        
        for queryItem in queryItems {
            if let value = queryItem.value {
                switch queryItem.name {
                case "id":
                    if !value.isEmpty {
                        id = UUID(uuidString: value)
                    }
                case "a1":
                    if !value.isEmpty {
                        a1 = value
                    }
                case "a2":
                    if !value.isEmpty {
                        a2 = value
                    }
                case "a3":
                    if !value.isEmpty {
                        a3 = value
                    }
                case "b1":
                    if !value.isEmpty {
                        b1 = value
                    }
                case "b2":
                    if !value.isEmpty {
                        b2 = value
                    }
                case "b3":
                    if !value.isEmpty {
                        b3 = value
                    }
                case "c1":
                    if !value.isEmpty {
                        c1 = value
                    }
                case "c2":
                    if !value.isEmpty {
                        c2 = value
                    }
                case "c3":
                    if !value.isEmpty {
                        c3 = value
                    }
                case "turnNumber":
                    if !value.isEmpty {
                        turnNumber = value
                    }
                case "playerOneUUID":
                    if !value.isEmpty {
                        playerOneUUID = value
                    }
                case "playerTwoUUID":
                    if !value.isEmpty {
                        playerTwoUUID = value
                    }
                case "currentPlayerUUID":
                    if !value.isEmpty {
                        currentPlayerUUID = value
                    }
                case "winnerUUID":
                    if !value.isEmpty {
                        winnerUUID = value
                    }
                default: ()
                }
            }
        }
        
        let turnNumberValue = turnNumber ?? "first"
        
        if let id = id {
            let game = TicTacToeGame(
                gameType: .ticTacToe,
                id: id,
                a1: a1,
                a2: a2,
                a3: a3,
                b1: b1,
                b2: b2,
                b3: b3,
                c1: c1,
                c2: c2,
                c3: c3,
                turnNumber: Turn(rawValue: turnNumberValue),
                playerOne: Player(uuidString: playerOneUUID, color: .blue),
                playerTwo: Player(uuidString: playerTwoUUID, color: .red),
                currentPlayerUUID: currentPlayerUUID,
                winnerUUID: winnerUUID)
            TicTacToeModel.shared.currentTTTGame = game
        }
    }
    
    // MARK: - DECODE BATTERY GUESS MESSAGE
    private func decodeBatteryGuessMessage(queryItems: [URLQueryItem]) {
        var id: UUID?
        var playerOneBatteryPercentage: String?
        var playerTwoBatteryPercentage: String?
        var playerOneGuess: String?
        var playerTwoGuess: String?
        var state: String?
        var playerOneUUID: String?
        var playerTwoUUID: String?
        var currentPlayerUUID: String?
        
        for queryItem in queryItems {
            if let value = queryItem.value {
                switch queryItem.name {
                case "id":
                    if !value.isEmpty {
                        id = UUID(uuidString: value)
                    }
                case "playerOneBatteryPercentage":
                    if !value.isEmpty {
                        playerOneBatteryPercentage = value
                    }
                case "playerTwoBatteryPercentage":
                    if !value.isEmpty {
                        playerTwoBatteryPercentage = value
                    }
                case "playerOneGuess":
                    if !value.isEmpty {
                        playerOneGuess = value
                    }
                case "playerTwoGuess":
                    if !value.isEmpty {
                        playerTwoGuess = value
                    }
                case "state":
                    if !value.isEmpty {
                        state = value
                    }
                case "playerOneUUID":
                    if !value.isEmpty {
                        playerOneUUID = value
                    }
                case "playerTwoUUID":
                    if !value.isEmpty {
                        playerTwoUUID = value
                    }
                case "currentPlayerUUID":
                    if !value.isEmpty {
                        currentPlayerUUID = value
                    }
                default: ()
                }
            }
        }
        
        let stateValue = state ?? "playing"
        
        if let id = id {
            let game = BatteryGuessGame(
                gameType: .batteryGuess,
                id: id,
                playerOneBatteryPercentage: playerOneBatteryPercentage,
                playerTwoBatteryPercentage: playerTwoBatteryPercentage,
                playerOneGuess: playerOneGuess,
                playerTwoGuess: playerTwoGuess,
                state: BGGameState(rawValue: stateValue) ?? .playing,
                playerOne: Player(uuidString: playerOneUUID, color: .blue),
                playerTwo: Player(uuidString: playerTwoUUID, color: .red),
                currentPlayerUUID: currentPlayerUUID)
            Model.shared.currentBGGame = game
        }
    }
    
    // MARK: - COME ALIVE
    func comeAlive(with conversation: MSConversation) {
        requestPresentationStyle(.expanded)
        
        containerView.wordGuessView.resetGame {}
        containerView.ticTacToeView.resetGame()
        containerView.batteryGuessView.resetGame()
        
        Model.shared.updateGamesFromUserDefaults()
        TicTacToeModel.shared.updateGamesFromUserDefaults()
        
        if let selectedMessage = conversation.selectedMessage {
            let appState = appStateFromDecoding(selectedMessage)
            switch appState {
                
            case .wordGuess:
                containerView.wordGuessView.keyboardView.isUserInteractionEnabled = true
                Model.shared.appState = .wordGuess
                Model.shared.wordGuessState = .grid
                updateWordGuessGame()

            case .ticTacToe:
                containerView.ticTacToeView.isUserInteractionEnabled = true
                Model.shared.appState = .ticTacToe
                TicTacToeModel.shared.ticTacToeState = .grid
                updateTicTacToeGame(from: conversation)
                
            case .batteryGuess:
                containerView.batteryGuessView.isUserInteractionEnabled = true
                Model.shared.appState = .batteryGuess
                //Model.shared.batteryGuessState = .main
                updateBatteryGuessGame(from: conversation)
                
            default:
                Model.shared.appState = .container
            }
        }
    }

    // MARK: - UPDATE WG GAME
    private func updateWordGuessGame() {
        
        // reset correct guess letter counts
        Model.shared.resetGuessLetterCountDictionary {
            
            // update the grid view with any cached guesses
            if let currentGame = Model.shared.currentWGGame,
               let answer = currentGame.answer,
               let guessNumber = currentGame.guessNumber {
                
                self.containerView.wordGuessView.gridView.updateRowsFromMessage(
                    answer: answer,
                    firstGuess: currentGame.guess1,
                    secondGuess: currentGame.guess2,
                    thirdGuess: currentGame.guess3,
                    fourthGuess: currentGame.guess4,
                    fifthGuess: currentGame.guess5,
                    sixthGuess: currentGame.guess6,
                    guessToAnimate: guessNumber,
                    completion: { gameState in
                                                    
                        // reset the emoji string
                        Model.shared.lastLastGuessInEmojis = Model.shared.lastGuessInEmojis
                        Model.shared.lastGuessInEmojis = ""
                        Model.shared.resetGuessLetterCountDictionary {}
                        
                        switch gameState {
                        case .won:
                            self.containerView.wordGuessView.showTheWin(currentGame: currentGame) {
                                self.containerView.wordGuessView.showNewGameButton()
                            }
                        case .lost:
                            self.containerView.wordGuessView.showTheLoss(currentGame: currentGame) {
                                self.containerView.wordGuessView.showNewGameButton()
                            }
                            
                        default: ()
                        }
                    }
                )
                Model.shared.advanceGuessNumberAndLetter()
            }
        }

    }
    
    // MARK: - UPDATE TTT GAME
    private func updateTicTacToeGame(from activeConversation: MSConversation) {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }

        containerView.ticTacToeView.threeRowGridView.updateSquaresFromMessage(
            a1: currentGame.a1,
            a2: currentGame.a2,
            a3: currentGame.a3,
            b1: currentGame.b1,
            b2: currentGame.b2,
            b3: currentGame.b3,
            c1: currentGame.c1,
            c2: currentGame.c2,
            c3: currentGame.c3,
            completion: { gameState in
                guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }

                if gameState == .someoneWon {
                    guard let winnerUUIDString = currentGame.winnerUUID else { return }
                    if remoteParticipantIdentifier.uuidString == winnerUUIDString {
                        self.showTTTLoss()
                    } else {
                        self.showTTTWin()
                    }
                } else if gameState == .catsGame {
                    self.showTTTCatsGame()
                }
            }
        )
        TicTacToeModel.shared.advanceTurnNumber()
    }
    
    // MARK: - UPDATE BG GAME
    private func updateBatteryGuessGame(from activeConversation: MSConversation) {
        guard let currentGame = Model.shared.currentBGGame else { return }
        guard let playerOneGuess = currentGame.playerOneGuess else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentPlayerUUIDString = currentGame.currentPlayerUUID else { return }

        if let playerTwoBatteryPercentage = currentGame.playerTwoBatteryPercentage,
            let actualBatteryPercentageInt = Int(playerTwoBatteryPercentage) {
            updateBatteryGuessSubviewsForCompletedGuess(
                remoteParticipantIdentifier: remoteParticipantIdentifier,
                currentPlayerUUIDString: currentPlayerUUIDString,
                actualBatteryPercentageInt: actualBatteryPercentageInt,
                playerOneGuess: playerOneGuess)
        } else {
            updateBatteryGuessSubviewsForNewGuess(
                remoteParticipantIdentifier: remoteParticipantIdentifier,
                currentPlayerUUIDString: currentPlayerUUIDString,
                currentGame: currentGame,
                batteryLevel: batteryLevel)
        }
    }
    
    private func updateBatteryGuessSubviewsForNewGuess(remoteParticipantIdentifier: UUID,
                                                       currentPlayerUUIDString: String,
                                                       currentGame: BatteryGuessGame,
                                                       batteryLevel: Float) {
        guard let playerOneGuess = currentGame.playerOneGuess else { return }
        guard let batteryGuessPercentageInt = Int(playerOneGuess) else { return }
        
        let actualBatteryPercentageInt = Int(batteryLevel * 100)
        let periodOrExclamation = batteryGuessPercentageInt == actualBatteryPercentageInt ? "!" : "."

        containerView.batteryGuessView.percentageLabel.text = ""
        containerView.batteryGuessView.batteryView.chargingImageView.alpha = 0
        
        let pronoun = remoteParticipantIdentifier.uuidString == currentPlayerUUIDString ? "Their" : "Your"

        containerView.batteryGuessView.topResultLabel.text = pronoun + " battery is at \(actualBatteryPercentageInt)%."
        containerView.batteryGuessView.topResultLabel.alpha = 0
        
        if remoteParticipantIdentifier.uuidString != currentPlayerUUIDString {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                self.containerView.batteryGuessView.topResultLabel.alpha = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Model.shared.currentBGGame?.playerTwoBatteryPercentage = "\(actualBatteryPercentageInt)"
            
            self.containerView.batteryGuessView.batteryView.currentProgress = actualBatteryPercentageInt
            self.containerView.updateConstraints(with: 2) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.containerView.batteryGuessView.batteryView.currentProgress = batteryGuessPercentageInt
                    
                    self.containerView.batteryGuessView.bottomResultLabel.alpha = 0
                    
                    let secondPronoun = remoteParticipantIdentifier.uuidString == currentPlayerUUIDString ? "Your" : "Their"

                    self.containerView.batteryGuessView.bottomResultLabel.text = secondPronoun + " guess was \(batteryGuessPercentageInt)%" + periodOrExclamation
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                        self.containerView.batteryGuessView.bottomResultLabel.alpha = 1
                    }
                    self.containerView.updateConstraints(with: 2) {
                        self.containerView.batteryGuessView.batteryView.chargingImageView.alpha = batteryGuessPercentageInt == 100 ? 1 : 0
                    }
                    
                    if remoteParticipantIdentifier.uuidString != currentPlayerUUIDString {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if self.containerView.batteryGuessView.sendButtonHidden {
                                self.containerView.batteryGuessView.sendButtonHidden.toggle()
                                self.containerView.updateConstraints()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func updateBatteryGuessSubviewsForCompletedGuess(remoteParticipantIdentifier: UUID,
                                                             currentPlayerUUIDString: String,
                                                             actualBatteryPercentageInt: Int,
                                                             playerOneGuess: String) {
        guard let batteryGuessPercentageInt = Int(playerOneGuess) else { return }

        let periodOrExclamation = batteryGuessPercentageInt == actualBatteryPercentageInt ? "!" : "."
        
        containerView.batteryGuessView.percentageLabel.text = ""
        containerView.batteryGuessView.batteryView.chargingImageView.alpha = 0
        
        let pronoun = remoteParticipantIdentifier.uuidString == currentPlayerUUIDString ? "They" : "You"
        
        containerView.batteryGuessView.topResultLabel.text = pronoun + " guessed \(playerOneGuess)%."
        containerView.batteryGuessView.topResultLabel.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
            self.containerView.batteryGuessView.topResultLabel.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Model.shared.currentBGGame?.playerTwoBatteryPercentage = "\(actualBatteryPercentageInt)"
            
            self.containerView.batteryGuessView.batteryView.currentProgress = batteryGuessPercentageInt
            self.containerView.updateConstraints(with: 2) {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.containerView.batteryGuessView.batteryView.currentProgress = actualBatteryPercentageInt
                    
                    self.containerView.batteryGuessView.bottomResultLabel.alpha = 0
                    
                    let secondPronoun = remoteParticipantIdentifier.uuidString == currentPlayerUUIDString ? "Your" : "Their"
                    
                    self.containerView.batteryGuessView.bottomResultLabel.text = secondPronoun + " battery was \(actualBatteryPercentageInt)%" + periodOrExclamation
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
                        self.containerView.batteryGuessView.bottomResultLabel.alpha = 1
                    }
                    self.containerView.updateConstraints(with: 2) {
                        self.containerView.batteryGuessView.batteryView.chargingImageView.alpha = batteryGuessPercentageInt == 100 ? 1 : 0
                    }
                }
            }
        }
    }
    
    // MARK: - TRAIT COLLECTION DID CHANGE
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        containerView.wordGuessView.updateConstraints()
        containerView.ticTacToeView.updateConstraints()
        containerView.batteryGuessView.updateConstraints()
    }
    
    // MARK: - WILL BECOME ACTIVE
    override func willBecomeActive(with conversation: MSConversation) {
        super.willBecomeActive(with: conversation)
        comeAlive(with: conversation)
    }
    
    // MARK: - DID BECOME ACTIVE
    override func didBecomeActive(with conversation: MSConversation) {
        super.didBecomeActive(with: conversation)
        if Model.shared.appState == .wordGuess {
            disableKeyboardIfNotOurTurn()
            updateWGOtherPlayerUUID()
        } else if Model.shared.appState == .ticTacToe {
            disableGridIfNotOurTurn()
            updateTTTOtherPlayerUUID()
        } else if Model.shared.appState == .batteryGuess {
            //disableGridIfNotOurTurn()
            updateBGOtherPlayerUUID()
        }
    }
    
    // MARK: - UPDATE WG OTHER PLAYER UUID
    private func updateWGOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.updateWGPlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - UPDATE TTT OTHER PLAYER UUID
    private func updateTTTOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        TicTacToeModel.shared.updateTTTPlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - UPDATE BG OTHER PLAYER UUID
    private func updateBGOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.updateBGPlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - DISABLE KEYBOARD IF NOT OUR TURN
    /// Disable keyboard if current player UUID is the same as the sender UUID.
    private func disableKeyboardIfNotOurTurn() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentGame = Model.shared.currentWGGame else { return }
        guard let currentPlayerUUIDString = currentGame.currentPlayerUUID else { return }
        if remoteParticipantIdentifier.uuidString == currentPlayerUUIDString {
            containerView.wordGuessView.disableKeyboard()
        } else {
            containerView.wordGuessView.enableKeyboard()
        }
    }
    
    // MARK: - DISABLE GRID IF NOT OUR TURN
    /// Disable three rwo grid view if current player UUID is the same as the sender UUID.
    private func disableGridIfNotOurTurn() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }
        guard let currentPlayerUUIDString = currentGame.currentPlayerUUID else { return }
        if remoteParticipantIdentifier.uuidString == currentPlayerUUIDString {
            containerView.ticTacToeView.disableGrid()
        } else {
            containerView.ticTacToeView.enableGrid()
        }
    }
    
    // MARK: - DID RESIGN ACTIVE
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    // MARK: - DID RECEIVE
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    // MARK: - DID START SENDING
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        super.didStartSending(message, conversation: conversation)
        requestPresentationStyle(.compact)
    }
    
    // MARK: - DID CANCEL SENDING
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    // MARK: - WILL TRANSITION
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    // MARK: - DID TRANSITION
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        containerView.updateConstraints()
    }
}

// MARK: - DID FINISH COMPOSING
extension MessagesViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //
    }
}

extension MessagesViewController {
    
    // MARK: - COMPOSE WG MESSAGE
    private func composeWGMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = Model.shared.currentWGGame {
            
            queryItems.append(URLQueryItem(name: "gameType", value: GameType.wordGuess.rawValue))
            queryItems.append(URLQueryItem(name: "id", value: "\(currentGame.id)"))
            queryItems.append(URLQueryItem(name: "state", value: "\(currentGame.state)"))

            if let answer = currentGame.answer {
                queryItems.append(URLQueryItem(name: "answer", value: "\(answer)"))
            }
            if let guess1 = currentGame.guess1 {
                queryItems.append(URLQueryItem(name: "guess1", value: "\(guess1)"))
            }
            if let guess2 = currentGame.guess2 {
                queryItems.append(URLQueryItem(name: "guess2", value: "\(guess2)"))
            }
            if let guess3 = currentGame.guess3 {
                queryItems.append(URLQueryItem(name: "guess3", value: "\(guess3)"))
            }
            if let guess4 = currentGame.guess4 {
                queryItems.append(URLQueryItem(name: "guess4", value: "\(guess4)"))
            }
            if let guess5 = currentGame.guess5 {
                queryItems.append(URLQueryItem(name: "guess5", value: "\(guess5)"))
            }
            if let guess6 = currentGame.guess6 {
                queryItems.append(URLQueryItem(name: "guess6", value: "\(guess6)"))
            }
            if let guessNumber = currentGame.guessNumber {
                queryItems.append(URLQueryItem(name: "guessNumber", value: "\(guessNumber)"))
            }
            if let playerOneUUID = currentGame.playerOne.uuidString {
                queryItems.append(URLQueryItem(name: "playerOneUUID", value: "\(playerOneUUID)"))
            }
            if let playerTwoUUID = currentGame.playerTwo.uuidString {
                queryItems.append(URLQueryItem(name: "playerTwoUUID", value: "\(playerTwoUUID)"))
            }
            if let currentPlayerUUID = currentGame.currentPlayerUUID {
                queryItems.append(URLQueryItem(name: "currentPlayerUUID", value: "\(currentPlayerUUID)"))
            }
        }
        components.queryItems = queryItems
        
        message.url = components.url!
        
        let layout = MSMessageTemplateLayout()
        if let image = UIImage.wordGuessMessageBubble {
            layout.image = image
        }
        layout.caption = "WORD GUESS"
        if let currentGame = Model.shared.currentWGGame,
           let guessNumber = currentGame.guessNumber {
            var subcaptionString: String
            switch guessNumber {
            case .first:
                if let answer = currentGame.answer,
                   let guess1 = currentGame.guess1,
                   answer == guess1 {
                    subcaptionString = "I got it in 1 💀"
                } else {
                    subcaptionString = "Guess it in 2."
                }
            case .second:
                if let answer = currentGame.answer,
                   let guess2 = currentGame.guess2,
                   answer == guess2 {
                    subcaptionString = "We got it in 2 🥴"
                } else {
                    subcaptionString = "Guess it in 3."
                }
            case .third:
                if let answer = currentGame.answer,
                   let guess3 = currentGame.guess3,
                   answer == guess3 {
                    subcaptionString = "We got it in 3 😎"
                } else {
                    subcaptionString = "Guess it in 4."
                }
            case .fourth:
                if let answer = currentGame.answer,
                   let guess4 = currentGame.guess4,
                   answer == guess4 {
                    subcaptionString = "We got it in 4 🤠"
                } else {
                    subcaptionString = "Guess it in 5."
                }
            case .fifth:
                if let answer = currentGame.answer,
                   let guess5 = currentGame.guess5,
                   answer == guess5 {
                    subcaptionString = "We got it in 5 😅"
                } else {
                    subcaptionString = "Guess it in 6 🫣"
                }
            case .sixth:
                if let answer = currentGame.answer,
                   let guess6 = currentGame.guess6,
                   answer == guess6 {
                    subcaptionString = "🫠 Did we get it?"
                } else {
                    subcaptionString = "🫥"
                }
            }
            layout.subcaption = subcaptionString
        }
        
        if #available(iOS 16.0, *) {
            layout.trailingCaption = Model.shared.lastGuessInEmojis
            //            layout.trailingSubcaption = GameModel.shared.lastGuessInEmojis
        } else {
            layout.trailingCaption = Model.shared.lastGuessInEmojis
        }
        
        message.layout = layout
        return message
    }
    
    // MARK: - COMPOSE TTT MESSAGE
    private func composeTTTMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = TicTacToeModel.shared.currentTTTGame {
            
            queryItems.append(URLQueryItem(name: "gameType", value: GameType.ticTacToe.rawValue))
            queryItems.append(URLQueryItem(name: "id", value: "\(currentGame.id)"))
            
            if let a1 = currentGame.a1 {
                queryItems.append(URLQueryItem(name: "a1", value: "\(a1)"))
            }
            if let a2 = currentGame.a2 {
                queryItems.append(URLQueryItem(name: "a2", value: "\(a2)"))
            }
            if let a3 = currentGame.a3 {
                queryItems.append(URLQueryItem(name: "a3", value: "\(a3)"))
            }
            if let b1 = currentGame.b1 {
                queryItems.append(URLQueryItem(name: "b1", value: "\(b1)"))
            }
            if let b2 = currentGame.b2 {
                queryItems.append(URLQueryItem(name: "b2", value: "\(b2)"))
            }
            if let b3 = currentGame.b3 {
                queryItems.append(URLQueryItem(name: "b3", value: "\(b3)"))
            }
            if let c1 = currentGame.c1 {
                queryItems.append(URLQueryItem(name: "c1", value: "\(c1)"))
            }
            if let c2 = currentGame.c2 {
                queryItems.append(URLQueryItem(name: "c2", value: "\(c2)"))
            }
            if let c3 = currentGame.c3 {
                queryItems.append(URLQueryItem(name: "c3", value: "\(c3)"))
            }
            if let turnNumber = currentGame.turnNumber {
                queryItems.append(URLQueryItem(name: "turnNumber", value: "\(turnNumber)"))
            }
            if let playerOneUUID = currentGame.playerOne.uuidString {
                queryItems.append(URLQueryItem(name: "playerOneUUID", value: "\(playerOneUUID)"))
            }
            if let playerTwoUUID = currentGame.playerTwo.uuidString {
                queryItems.append(URLQueryItem(name: "playerTwoUUID", value: "\(playerTwoUUID)"))
            }
            if let currentPlayerUUID = currentGame.currentPlayerUUID {
                queryItems.append(URLQueryItem(name: "currentPlayerUUID", value: "\(currentPlayerUUID)"))
            }
            if let winnerUUID = currentGame.winnerUUID {
                queryItems.append(URLQueryItem(name: "winnerUUID", value: "\(winnerUUID)"))
            }
        }
        components.queryItems = queryItems
        
        message.url = components.url!
        
        let layout = MSMessageTemplateLayout()
        if let image = UIImage.ticTacToeMessageBubble {
            layout.image = image
        }
        layout.caption = "TIC TAC TOE"
        layout.subcaption = "It is your turn."
        
        message.layout = layout
        return message
    }
    
    // MARK: - COMPOSE BG MESSAGE
    private func composeBGMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = Model.shared.currentBGGame {
            
            queryItems.append(URLQueryItem(name: "gameType", value: GameType.batteryGuess.rawValue))
            queryItems.append(URLQueryItem(name: "id", value: "\(currentGame.id)"))
            queryItems.append(URLQueryItem(name: "state", value: "\(currentGame.state)"))

            if let playerOneBatteryPercentage = currentGame.playerOneBatteryPercentage {
                queryItems.append(URLQueryItem(name: "playerOneBatteryPercentage", value: "\(playerOneBatteryPercentage)"))
            }
            if let playerTwoBatteryPercentage = currentGame.playerTwoBatteryPercentage {
                queryItems.append(URLQueryItem(name: "playerTwoBatteryPercentage", value: "\(playerTwoBatteryPercentage)"))
            }
            if let playerOneGuess = currentGame.playerOneGuess {
                queryItems.append(URLQueryItem(name: "playerOneGuess", value: "\(playerOneGuess)"))
            }
            if let playerTwoGuess = currentGame.playerTwoGuess {
                queryItems.append(URLQueryItem(name: "playerTwoGuess", value: "\(playerTwoGuess)"))
            }
            if let playerOneUUID = currentGame.playerOne.uuidString {
                queryItems.append(URLQueryItem(name: "playerOneUUID", value: "\(playerOneUUID)"))
            }
            if let playerTwoUUID = currentGame.playerTwo.uuidString {
                queryItems.append(URLQueryItem(name: "playerTwoUUID", value: "\(playerTwoUUID)"))
            }
            if let currentPlayerUUID = currentGame.currentPlayerUUID {
                queryItems.append(URLQueryItem(name: "currentPlayerUUID", value: "\(currentPlayerUUID)"))
            }
            if let winnerUUID = currentGame.winnerUUID {
                queryItems.append(URLQueryItem(name: "winnerUUID", value: "\(winnerUUID)"))
            }
        }
        components.queryItems = queryItems
        
        message.url = components.url!
        
        let layout = MSMessageTemplateLayout()
        if let image = UIImage.batteryGuessMessageBubble {
            layout.image = image
        }
        layout.caption = "BATTERY GUESS"
        layout.subcaption = "Your battery percentage is... 🥁"
        
        message.layout = layout
        return message
    }
}

extension MessagesViewController: ContainerDelegate {
    func didTapLogoButton() {
        showContainer()
    }
    
    func didTapWGSendButton() {
        guard let activeConversation = activeConversation else { return }
        updateCurrentWGPlayer(from: activeConversation)
        send(message: composeWGMessage(), from: activeConversation)
    }
    
    func didTapBGSendButton() {
        guard let activeConversation = activeConversation else { return }
        updateCurrentBGPlayer(from: activeConversation)
        send(message: composeBGMessage(), from: activeConversation)
    }
    
    private func updateCurrentWGPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.currentWGGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
    }
    
    private func updateCurrentTTTPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        TicTacToeModel.shared.currentTTTGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
    }
    
    private func updateCurrentBGPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.currentBGGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
    }
    
    func didTapWordGuessButton() {
        requestPresentationStyle(.expanded)
    }
    
    func didTapTicTacToeButton() {
        requestPresentationStyle(.expanded)
    }
    
    func didTapBatteryGuessButton() {
        requestPresentationStyle(.expanded)
    }
    
    func didTapTTTSquareButton() {
        guard let activeConversation = activeConversation else { return }
        
        updateCurrentTTTPlayer(from: activeConversation)
        send(message: composeTTTMessage(), from: activeConversation)
    }
    
    private func send(message: MSMessage, from activeConversation: MSConversation) {
        activeConversation.send(message, completionHandler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                
                if Model.shared.appState == .wordGuess {
                    Model.shared.resetWGGame {
                        DispatchQueue.main.async {
                            self.containerView.wordGuessView.resetGame {}
                        }
                    }
                } else if Model.shared.appState == .ticTacToe {
                    TicTacToeModel.shared.resetGame {
                        DispatchQueue.main.async {
                            self.containerView.ticTacToeView.resetGame()
                        }
                    }
                } else if Model.shared.appState == .batteryGuess {
                    Model.shared.resetBGGame {
                        DispatchQueue.main.async {
                            self.containerView.batteryGuessView.resetGame()
                        }
                    }
                }
            }
        })
    }
    
    func showTTTWin() {
        updateWinnerUUID()
        updateTTTGameWithWin()
    }
    
    func showTTTLoss() {
        updateGameWithLoss()
    }
    
    func showTTTCatsGame() {
        updateGameWithCatsGame()
    }
    
    private func updateWinnerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }

        if let playerOneUUIDString = currentGame.playerOne.uuidString,
            playerOneUUIDString != remoteParticipantIdentifier.uuidString {
            TicTacToeModel.shared.currentTTTGame?.winnerUUID = playerOneUUIDString
        } else if let playerTwoUUIDString = currentGame.playerTwo.uuidString,
                  playerTwoUUIDString != remoteParticipantIdentifier.uuidString {
            TicTacToeModel.shared.currentTTTGame?.winnerUUID = playerTwoUUIDString
        }
    }
    
    func updateTTTGameWithWin() {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }

        TicTacToeModel.shared.incrementMyWinCountAndStreak(with: currentGame)
        TicTacToeModel.shared.incrementTheirLossCountAndResetStreak(with: currentGame)
        TicTacToeModel.shared.incrementPlayedCount(with: currentGame)

        containerView.ticTacToeView.showTheWin(currentGame: currentGame) {
            TicTacToeModel.shared.updateGames()
        }
    }
    
    func updateGameWithLoss() {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }

        TicTacToeModel.shared.incrementMyLossCountAndResetStreak(with: currentGame)
        TicTacToeModel.shared.incrementTheirWinCountAndStreak(with: currentGame)
        TicTacToeModel.shared.incrementPlayedCount(with: currentGame)

        containerView.ticTacToeView.showTheLoss(currentGame: currentGame) {
            TicTacToeModel.shared.updateGames()
        }
    }
    
    func updateGameWithCatsGame() {
        guard let currentGame = TicTacToeModel.shared.currentTTTGame else { return }

        TicTacToeModel.shared.incrementCatsGameCount(with: currentGame)
        TicTacToeModel.shared.incrementPlayedCount(with: currentGame)
        
        containerView.ticTacToeView.showCatsGame(currentGame: currentGame) {
            TicTacToeModel.shared.updateGames()
        }
    }
}
