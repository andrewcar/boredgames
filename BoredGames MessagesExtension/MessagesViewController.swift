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
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addContainerView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // portrait
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height {
            Model.shared.isLandscape = false

        // landscape
        } else {
            Model.shared.isLandscape = true
        }
        
        activateContainerConstraints()
        containerView.updateConstraints()
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
                if gameType == GameType.fiveLetterGuess.rawValue {
                    decodeFiveLetterGuessMessage(queryItems: queryItems)
                    return .fiveLetterGuess
                } else if gameType == GameType.ticTacToe.rawValue {
                    decodeTicTacToeMessage(queryItems: queryItems)
                    return .ticTacToe
                }
            }
        }
        return .container
    }
    
    // MARK: - DECODE FIVE LETTER GUESS MESSAGE
    private func decodeFiveLetterGuessMessage(queryItems: [URLQueryItem]) {
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
            let game = FiveLetterGuessGame(
                gameType: .fiveLetterGuess,
                id: id,
                answer: answer,
                guess1: firstGuess,
                guess2: secondGuess,
                guess3: thirdGuess,
                guess4: fourthGuess,
                guess5: fifthGuess,
                guess6: sixthGuess,
                guessNumber: Guess(rawValue: guessNumberValue),
                state: FLGGameState(rawValue: stateValue) ?? .playing,
                playerOne: Player(uuidString: playerOneUUID, color: .blue),
                playerTwo: Player(uuidString: playerTwoUUID, color: .red),
                currentPlayerUUID: currentPlayerUUID)
            Model.shared.currentFLGGame = game
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
    
    // MARK: - COME ALIVE
    func comeAlive(with conversation: MSConversation) {
        requestPresentationStyle(.expanded)
        
        containerView.fiveLetterGuessView.resetGame()
        containerView.ticTacToeView.resetGame()
        
        Model.shared.updateGamesFromUserDefaults()
        
        if let selectedMessage = conversation.selectedMessage {
            let appState = appStateFromDecoding(selectedMessage)
            switch appState {
                
            case .fiveLetterGuess:
                containerView.fiveLetterGuessView.keyboardView.isUserInteractionEnabled = true
                Model.shared.appState = .fiveLetterGuess
                Model.shared.fiveLetterGuessState = .grid
                updateFiveLetterGuessGame()

            case .ticTacToe:
                containerView.ticTacToeView.isUserInteractionEnabled = true
                Model.shared.appState = .ticTacToe
                TicTacToeModel.shared.ticTacToeState = .grid
                updateTicTacToeGame(from: conversation)
                
            default:
                Model.shared.appState = .container
            }
        }
    }

    // MARK: - UPDATE FLG GAME
    private func updateFiveLetterGuessGame() {
        
        // reset correct guess letter counts
        Model.shared.resetGuessLetterCountDictionary {
            
            // update the grid view with any cached guesses
            if let currentGame = Model.shared.currentFLGGame,
               let answer = currentGame.answer,
               let guessNumber = currentGame.guessNumber {
                
                self.containerView.fiveLetterGuessView.gridView.updateRowsFromMessage(
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
                            self.containerView.fiveLetterGuessView.showTheWin(currentGame: currentGame) {
                                self.containerView.fiveLetterGuessView.showNewGameButton()
                            }
                        case .lost:
                            self.containerView.fiveLetterGuessView.showTheLoss(currentGame: currentGame) {
                                self.containerView.fiveLetterGuessView.showNewGameButton()
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
                        self.showTheLoss()
                    } else {
                        self.showTheWin()
                    }
                } else if gameState == .catsGame {
                    self.showCatsGame()
                }
            }
        )
        TicTacToeModel.shared.advanceTurnNumber()
    }

    
    // MARK: - TRAIT COLLECTION DID CHANGE
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        containerView.fiveLetterGuessView.updateConstraints()
        containerView.ticTacToeView.updateConstraints()
    }
    
    // MARK: - WILL BECOME ACTIVE
    override func willBecomeActive(with conversation: MSConversation) {
        super.willBecomeActive(with: conversation)
        comeAlive(with: conversation)
    }
    
    // MARK: - DID BECOME ACTIVE
    override func didBecomeActive(with conversation: MSConversation) {
        super.didBecomeActive(with: conversation)
        if Model.shared.appState == .fiveLetterGuess {
            disableKeyboardIfNotOurTurn()
            updateFLGOtherPlayerUUID()
        } else if Model.shared.appState == .ticTacToe {
            disableGridIfNotOurTurn()
            updateTTTOtherPlayerUUID()
        }
    }
    
    // MARK: - UPDATE FLG OTHER PLAYER UUID
    private func updateFLGOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.updateFLGPlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - UPDATE TTT OTHER PLAYER UUID
    private func updateTTTOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        TicTacToeModel.shared.updateTTTPlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - DISABLE KEYBOARD IF NOT OUR TURN
    /// Disable keyboard if current player UUID is the same as the sender UUID.
    private func disableKeyboardIfNotOurTurn() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentGame = Model.shared.currentFLGGame else { return }
        guard let currentPlayerUUIDString = currentGame.currentPlayerUUID else { return }
        if remoteParticipantIdentifier.uuidString == currentPlayerUUIDString {
            containerView.fiveLetterGuessView.disableKeyboard()
        } else {
            containerView.fiveLetterGuessView.enableKeyboard()
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
    }
}

// MARK: - DID FINISH COMPOSING
extension MessagesViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //
    }
}

extension MessagesViewController {
    
    // MARK: - COMPOSE FLG MESSAGE
    private func composeFLGMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = Model.shared.currentFLGGame {
            
            queryItems.append(URLQueryItem(name: "gameType", value: GameType.fiveLetterGuess.rawValue))
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
        if let image = UIImage.logoMessageBubble {
            layout.image = image
        }
        layout.caption = "FIVE LETTER GUESS"
        if let currentGame = Model.shared.currentFLGGame,
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
}

extension MessagesViewController: ContainerDelegate {
    func didTapLogoButton() {
        showContainer()
    }
    
    func didTapSendButton() {
        guard let activeConversation = activeConversation else { return }
        updateCurrentFLGPlayer(from: activeConversation)
        send(message: composeFLGMessage(), from: activeConversation)
    }
    
    private func updateCurrentFLGPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        Model.shared.currentFLGGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
    }
    
    private func updateCurrentTTTPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        TicTacToeModel.shared.currentTTTGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
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
            }
        })
    }
    
    func showTheWin() {
        updateWinnerUUID()
        updateGameWithWin()
    }
    
    func showTheLoss() {
        updateGameWithLoss()
    }
    
    func showCatsGame() {
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
    
    func updateGameWithWin() {
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
