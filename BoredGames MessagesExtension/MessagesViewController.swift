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
    private var containerPortraitConstraints: [NSLayoutConstraint] = []
    private var containerLandscapeConstraints: [NSLayoutConstraint] = []
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        GameModel.shared.updateGamesFromUserDefaults()
        addContainerView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // portrait
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height {
            GameModel.shared.isLandscape = false
            activateContainerConstraints(isLandscape: false)
            
        // landscape
        } else {
            GameModel.shared.isLandscape = true
            activateContainerConstraints(isLandscape: true)
        }
        containerView.updateConstraints()
        updateBackgroundColor()
    }
    
    // MARK: - 🪟 🟩 🔄
    private func updateBackgroundColor() {
        var newColor: UIColor?
        switch GameModel.shared.appState {
        case .container:
            newColor = .containerBackground
        case .fiveLetterGuess:
            newColor = .fiveLetterGuessBackground
        case .ticTacToe:
            newColor = .ticTacToeBackground
        case .dots:
            newColor = .dotsBackground
        }
        guard let newColor = newColor else { return }
        UIView.animate(withDuration: 0.426, delay: 0, options: .curveEaseOut) {
            self.view.backgroundColor = newColor
        } completion: { _ in
        }
    }
    
    // MARK: - CONTAINER VIEW
    private func addContainerView() {
        containerView.containerDelegate = self
        view.addSubview(containerView)
        activateContainerConstraints(isLandscape: false)
    }
    
    // MARK: - CONTAINER CONSTRAINTS
    private func activateContainerConstraints(isLandscape: Bool) {
        NSLayoutConstraint.deactivate(containerPortraitConstraints)
        NSLayoutConstraint.deactivate(containerLandscapeConstraints)
        containerPortraitConstraints = [
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        if isLandscape {
            NSLayoutConstraint.activate(containerLandscapeConstraints)
        } else {
            NSLayoutConstraint.activate(containerPortraitConstraints)
        }
    }
    
    // MARK: - BECOME FIRST RESPONDER
    override func becomeFirstResponder() -> Bool {
        true
    }
    
    // MARK: - SHAKE
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        if GameModel.shared.appState == .fiveLetterGuess && GameModel.shared.fiveLetterGuessState == .debug {
            containerView.fiveLetterGuessView.hideDebugView()
        }
        showContainer()
    }
    
    // MARK: - SHOW CONTAINER
    private func showContainer() {
        guard GameModel.shared.appState != .container else { return }
        GameModel.shared.appState = .container
        containerView.updateConstraints()
    }
    

    // MARK: - DECODE
    private func decode(_ message: MSMessage) {
        guard let url = message.url else {
            print("Could not get URL from MSMessage.")
            return
        }
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false) else {
            print("Could not create NSURLComponents from MSMessage URL.")
            return
        }
        
        if let queryItems = components.queryItems {
            
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
                let game = Game(
                    id: id,
                    answer: answer,
                    guess1: firstGuess,
                    guess2: secondGuess,
                    guess3: thirdGuess,
                    guess4: fourthGuess,
                    guess5: fifthGuess,
                    guess6: sixthGuess,
                    guessNumber: Guess(rawValue: guessNumberValue),
                    state: GameState(rawValue: stateValue) ?? .playing,
                    playerOne: Player(uuidString: playerOneUUID, color: .blue),
                    playerTwo: Player(uuidString: playerTwoUUID, color: .red),
                    currentPlayerUUID: currentPlayerUUID)
                GameModel.shared.currentGame = game
                GameModel.shared.resetAnswerLetterCountDictionary {}
                GameModel.shared.populateAnswerLetterCountDictionary {}
            }
        }
        
        containerView.fiveLetterGuessView.keyboardView.isUserInteractionEnabled = true
    }
    
    // MARK: - COME ALIVE
    func comeAlive(with conversation: MSConversation) {
        requestPresentationStyle(.expanded)
        
        if let selectedMessage = conversation.selectedMessage {
            containerView.fiveLetterGuessView.resetGame()
            decode(selectedMessage)
            GameModel.shared.appState = .fiveLetterGuess
                                    
            // reset correct guess letter counts
            GameModel.shared.resetGuessLetterCountDictionary {
                
                // update the grid view with any cached guesses
                if let currentGame = GameModel.shared.currentGame,
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
                            GameModel.shared.lastLastGuessInEmojis = GameModel.shared.lastGuessInEmojis
                            GameModel.shared.lastGuessInEmojis = ""
                            GameModel.shared.resetGuessLetterCountDictionary {}
                            
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
                    
                    self.advanceGuessNumberAndLetter()
                }
            }
        } else {
            containerView.fiveLetterGuessView.resetGame()
        }
    }
    
    private func advanceGuessNumberAndLetter() {
        switch GameModel.shared.currentGame?.guessNumber {
        case .first:
            GameModel.shared.currentGame?.guessNumber = .second
            GameModel.shared.currentGame?.currentLetter = .b0
        case .second:
            GameModel.shared.currentGame?.guessNumber = .third
            GameModel.shared.currentGame?.currentLetter = .c0
        case .third:
            GameModel.shared.currentGame?.guessNumber = .fourth
            GameModel.shared.currentGame?.currentLetter = .d0
        case .fourth:
            GameModel.shared.currentGame?.guessNumber = .fifth
            GameModel.shared.currentGame?.currentLetter = .e0
        case .fifth:
            GameModel.shared.currentGame?.guessNumber = .sixth
            GameModel.shared.currentGame?.currentLetter = .f0
        default: ()
        }
    }
    
    // MARK: - TRAIT COLLECTION DID CHANGE
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        containerView.fiveLetterGuessView.updateConstraints()
    }
    
    // MARK: - WILL BECOME ACTIVE
    override func willBecomeActive(with conversation: MSConversation) {
        super.willBecomeActive(with: conversation)
        comeAlive(with: conversation)
    }
    
    // MARK: - DID BECOME ACTIVE
    override func didBecomeActive(with conversation: MSConversation) {
        super.didBecomeActive(with: conversation)
        disableKeyboardIfNotOurTurn()
        updateOtherPlayerUUID()
    }
    
    // MARK: - UPDATE OTHER PLAYER UUID
    private func updateOtherPlayerUUID() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        GameModel.shared.updatePlayerUUID(with: remoteParticipantIdentifier.uuidString)
    }
    
    // MARK: - DISABLE KEYBOARD IF NOT OUR TURN
    /// Disable keyboard if currentPlayer UUID is the same as the sender UUID.
    private func disableKeyboardIfNotOurTurn() {
        guard let activeConversation = activeConversation else { return }
        guard let remoteParticipantIdentifier = activeConversation.remoteParticipantIdentifiers.first else { return }
        guard let currentGame = GameModel.shared.currentGame else { return }
        guard let currentPlayerUUIDString = currentGame.currentPlayerUUID else { return }
        if remoteParticipantIdentifier.uuidString == currentPlayerUUIDString {
            containerView.fiveLetterGuessView.disableKeyboard()
        } else {
            containerView.fiveLetterGuessView.enableKeyboard()
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
    
    // MARK: - COMPOSE MESSAGE
    private func composeMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = GameModel.shared.currentGame {
            
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
        if let image = UIImage.werdMessageBubble {
            layout.image = image
        }
        layout.caption = "FIVE LETTER GUESS"
        if let currentGame = GameModel.shared.currentGame,
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
            layout.trailingCaption = GameModel.shared.lastGuessInEmojis
            //            layout.trailingSubcaption = GameModel.shared.lastGuessInEmojis
        } else {
            layout.trailingCaption = GameModel.shared.lastGuessInEmojis
        }
        
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
        updateCurrentPlayer(from: activeConversation)
        sendMessage(from: activeConversation)
    }
    
    private func updateCurrentPlayer(from activeConversation: MSConversation) {
        guard let remoteParticipantUUID = activeConversation.remoteParticipantIdentifiers.first else { return }
        GameModel.shared.currentGame?.currentPlayerUUID = remoteParticipantUUID.uuidString
    }
    
    private func sendMessage(from activeConversation: MSConversation) {
        activeConversation.send(composeMessage(), completionHandler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        })
    }
}
