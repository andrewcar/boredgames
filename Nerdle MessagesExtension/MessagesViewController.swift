//
//  MessagesViewController.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit
import Messages
import MessageUI

class MessagesViewController: MSMessagesAppViewController {
    
    // MARK: - Properties
    private var logoImageView: UIImageView?
    private var notInWordListView: NotInWordListView?
    private var successView: SuccessView?
    private var gridView: GridView?
    private var statsView: StatsView?
    private var sendButton: UIButton?
    private var newGameButton: UIButton?
    private var statsButton: UIButton?
    private var gridButton: UIButton?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        GameModel.shared.updateGamesFromUserDefaults()
        addLogo()
        addGridView()
        addNotInWordListView()
        addSuccessView()
        addStatsView()
        addSendButton()
        addNewGameButton()
        addStatsButton()
        addGridButton()
    }
    
    
    // MARK: - LOGO IMAGE VIEW
    private func addLogo() {
        logoImageView = UIImageView(frame: Frame.Logo.frame(view.frame))
        logoImageView?.image = UIImage(named: "nerdle.png")
        view.addSubview(logoImageView!)
    }
    
    // MARK: - NOT IN WORD LIST VIEW
    private func addNotInWordListView() {
        notInWordListView = NotInWordListView(frame: Frame.NotInWordList.frame(view.frame))
        view.addSubview(notInWordListView!)
    }
    
    // MARK: - SUCCESS VIEW
    private func addSuccessView() {
        successView = SuccessView(frame: Frame.Success.frame(view.frame))
        view.addSubview(successView!)
    }
    
    // MARK: - GRID VIEW
    private func addGridView() {
        gridView = GridView(frame: Frame.Grid.frame(view.frame))
        gridView?.gridDelegate = self
        view.addSubview(gridView!)
    }
    
    // MARK: - STATS VIEW
    private func addStatsView() {
        statsView = StatsView(frame: Frame.Stats.hiddenFrame(view.frame))
        view.addSubview(statsView!)
    }
    
    // MARK: - SEND BUTTON
    private func addSendButton() {
        sendButton = UIButton(frame: Frame.SendButton.hiddenFrame(view.frame))
        sendButton?.addTarget(self, action: #selector(didTapSendButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "arrow.up.circle.fill",
            size: Frame.Stats.buttonSize,
            weight: .bold,
            color: .messagesBlue)
        sendButton?.setImage(image, for: .normal)
        sendButton?.setTitleColor(.white, for: .normal)
        view.addSubview(sendButton!)
    }
    
    // MARK: - NEW GAME BUTTON
    /// gamecontroller.fill, eject.circle.fill, sparkles, wind, tornado, arrow.up.right.and.arrow.down.left.rectangle.fill, arrow.counterclockwise.circle.fill, arrow.triangle.2.circlepath, arrow.clockwise.circle.fill, arrow.triangle.2.circlepath, scribble.variable
    private func addNewGameButton() {
        newGameButton = UIButton(frame: Frame.NewGame.buttonFrame(view.frame))
        newGameButton?.addTarget(self, action: #selector(didTapNewGameButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "scribble",
            size: Frame.Stats.buttonSize,
            weight: .bold)
        newGameButton?.setImage(image, for: .normal)
        newGameButton?.setTitleColor(.white, for: .normal)
        view.addSubview(newGameButton!)
    }
    
    // MARK: - STATS BUTTON
    /// chart.bar.xaxis, chart.xyaxis.line, chart.bar.doc.horizontal, waveform.and.magnifyingglass
    private func addStatsButton() {
        statsButton = UIButton(frame: Frame.Stats.buttonFrame(view.frame))
        statsButton?.addTarget(self, action: #selector(didTapStatsButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "chart.bar.xaxis",
            size: Frame.Stats.buttonSize,
            weight: .regular)
        statsButton?.setImage(image, for: .normal)
        statsButton?.setTitleColor(.white, for: .normal)
        view.addSubview(statsButton!)
    }
    
    // MARK: - GRID BUTTON
    /// square.grid.3x3.middleright.filled, circle.grid.3x3.circle.fill, chart.xyaxis.line, chart.line.uptrend.xyaxis, chart.line.uptrend.xyaxis.circle.fill
    private func addGridButton() {
        gridButton = UIButton(frame: Frame.Grid.hiddenButtonFrame(view.frame))
        gridButton?.addTarget(self, action: #selector(didTapGridButton(sender:)), for: .touchUpInside)
        let image = UIImage().scaledSystemImage(
            named: "square.grid.3x3.middleright.filled",
            size: Frame.Grid.buttonSize,
            weight: .regular)
        gridButton?.setImage(image, for: .normal)
        gridButton?.setTitleColor(.white, for: .normal)
        view.addSubview(gridButton!)
    }
    
    // MARK: - DID TAP SEND BUTTON
    @objc
    private func didTapSendButton(sender: UIButton) {
        activeConversation?.send(composeMessage(), completionHandler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            self.gridView?.keyboardView?.showing = true
        })
    }
    
    // MARK: - DID TAP STATS BUTTON
    @objc
    private func didTapStatsButton(sender: UIButton) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.statsView?.frame = Frame.Stats.frame(self.view.frame)
            self.gridView?.frame = Frame.Grid.hiddenFrame(self.view.frame)
            self.successView?.frame = Frame.Success.hiddenFrame(self.view.frame)
            self.statsButton?.frame = Frame.Stats.hiddenButtonFrame(self.view.frame)
            self.gridButton?.frame = Frame.Grid.buttonFrame(self.view.frame)
            self.newGameButton?.frame = Frame.NewGame.hiddenButtonFrame(self.view.frame)
            self.sendButton?.frame = Frame.SendButton.hiddenFrame(self.view.frame)
        } completion: { _ in
        }
    }
    
    // MARK: - DID TAP GRID BUTTON
    @objc
    private func didTapGridButton(sender: UIButton) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.gridView?.frame = Frame.Grid.frame(self.view.frame)
            self.statsView?.frame = Frame.Stats.hiddenFrame(self.view.frame)
            self.successView?.frame = Frame.Success.frame(self.view.frame)
            self.newGameButton?.frame = Frame.NewGame.buttonFrame(self.view.frame)
            self.gridButton?.frame = Frame.Grid.hiddenButtonFrame(self.view.frame)
            self.statsButton?.frame = Frame.Stats.buttonFrame(self.view.frame)
            if let keyboardView = self.gridView?.keyboardView, !keyboardView.showing {
                self.sendButton?.frame = Frame.SendButton.frame(self.view.frame)
            }
        } completion: { _ in
        }
    }
    
    // MARK: - DID TAP NEW GAME BUTTON
    @objc
    private func didTapNewGameButton(sender: UIButton) {
        reset()
    }
    
    // MARK: - RESET
    private func reset() {
        GameModel.shared.resetGame {
            self.gridView?.resetRows()
            self.gridView?.keyboardView?.resetKeyboard()
            self.successView?.isHidden = true
        }
    }
    
    // MARK: - COMPOSE MESSAGE
    private func composeMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        var queryItems: [URLQueryItem] = []
        if let currentGame = GameModel.shared.currentGame {
            
            queryItems.append(URLQueryItem(name: "gameNumber", value: "\(currentGame.number)"))
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
        }
        components.queryItems = queryItems
        
        message.url = components.url!

        let layout = MSMessageTemplateLayout()
        layout.image = UIImage(named: "nerdle.png")
        layout.caption = "Nerdle"
        layout.subcaption = "It's your turn!"
        layout.trailingSubcaption = GameModel.shared.lastGuessInEmojis

        message.layout = layout
        return message
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
            
            var gameNumber: String?
            var answer: String?
            var firstGuess: String?
            var secondGuess: String?
            var thirdGuess: String?
            var fourthGuess: String?
            var fifthGuess: String?
            var sixthGuess: String?
            var guessNumber: String?
            var state: String?
            
            for queryItem in queryItems {
                if let value = queryItem.value {
                    switch queryItem.name {
                    case "gameNumber":
                        if !value.isEmpty {
                            gameNumber = value
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
                    default: ()
                    }
                }
            }
           
            let guessNumberValue = guessNumber ?? "first"
            let stateValue = state ?? "playing"
            if let gameNumber = gameNumber, let gameNumberInt = Int(gameNumber) {
                let game = Game(
                    number: gameNumberInt,
                    answer: answer,
                    guess1: firstGuess,
                    guess2: secondGuess,
                    guess3: thirdGuess,
                    guess4: fourthGuess,
                    guess5: fifthGuess,
                    guess6: sixthGuess,
                    guessNumber: Guess(rawValue: guessNumberValue),
                    state: GameState(rawValue: stateValue) ?? .playing)
                GameModel.shared.currentGame = game
                GameModel.shared.updateGames(with: game)
                GameModel.shared.resetAnswerLetterCountDictionary {}
                GameModel.shared.populateAnswerLetterCountDictionary {}
            }
        }
        
        gridView?.keyboardView?.isUserInteractionEnabled = true
    }
    
    // MARK: - COME ALIVE
    private func comeAlive(with conversation: MSConversation) {
        requestPresentationStyle(.expanded)
                
        if let selectedMessage = conversation.selectedMessage {
            reset()
            decode(selectedMessage)
            
            // reset correct guess letter counts
            GameModel.shared.resetGuessLetterCountDictionary {
                
                // update the grid view with any cached guesses
                self.gridView?.updateRowsFromMessage(
                    firstGuess: GameModel.shared.currentGame?.guess1,
                    secondGuess: GameModel.shared.currentGame?.guess2,
                    thirdGuess: GameModel.shared.currentGame?.guess3,
                    fourthGuess: GameModel.shared.currentGame?.guess4,
                    fifthGuess: GameModel.shared.currentGame?.guess5,
                    sixthGuess: GameModel.shared.currentGame?.guess6,
                    guessToAnimate: GameModel.shared.currentGame?.guessNumber,
                    completion: {
                        
                        // reset the emoji string
                        GameModel.shared.lastGuessInEmojis = ""
                        GameModel.shared.resetGuessLetterCountDictionary {}
                        
                        // if we have a cached guessNumber
                        if let guessNumber = GameModel.shared.currentGame?.guessNumber {
                            var currentGuess: String?
                            switch guessNumber {
                            case .first:
                                if let firstGuess = GameModel.shared.currentGame?.guess1 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: firstGuess) {
                                        currentGuess = firstGuess
                                    }
                                }
                            case .second:
                                if let secondGuess = GameModel.shared.currentGame?.guess2 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: secondGuess) {
                                        currentGuess = secondGuess
                                    }
                                }
                            case .third:
                                if let thirdGuess = GameModel.shared.currentGame?.guess3 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: thirdGuess) {
                                        currentGuess = thirdGuess
                                    }
                                }
                            case .fourth:
                                if let fourthGuess = GameModel.shared.currentGame?.guess4 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: fourthGuess) {
                                        currentGuess = fourthGuess
                                    }
                                }
                            case .fifth:
                                if let fifthGuess = GameModel.shared.currentGame?.guess5 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: fifthGuess) {
                                        currentGuess = fifthGuess
                                    }
                                }
                            case .sixth:
                                if let sixthGuess = GameModel.shared.currentGame?.guess6 {
                                    GameModel.shared.populateGuessLetterCountDictionary(with: sixthGuess) {
                                        currentGuess = sixthGuess
                                    }
                                }
                            }

                            if currentGuess == GameModel.shared.currentGame?.answer {
                                self.gridView?.keyboardView?.isUserInteractionEnabled = false
                                self.showSuccessView()
                            }
                        }
                    }
                )
                
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
        } else {
            reset()
        }
    }
    
    // MARK: - WILL BECOME ACTIVE
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
        comeAlive(with: conversation)
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
        // Called when the user taps the send button.
        requestPresentationStyle(.compact)
    }
    
    // MARK: - DID CANCEL SENDING
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    // MARK: - DID SELECT
    override func didSelect(_ message: MSMessage, conversation: MSConversation) {
        if let selectedMessage = conversation.selectedMessage {
            decode(selectedMessage)
        }
    }
    
    // MARK: - WILL TRANSITION
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        if let selectedMessage = activeConversation?.selectedMessage {
            decode(selectedMessage)
        }
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

// MARK: - GRID DELEGATE
extension MessagesViewController: GridDelegate {
    func showNotInWordListView() {
        
        notInWordListView?.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.notInWordListView?.isHidden = true
        }
    }
    
    func showSuccessView() {
        self.successView?.isHidden = false
    }
    
    func showAnswer() {
        successView?.showAnswer()
        successView?.isHidden = false
    }
    
    func showSendButton(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1.5, options: .curveEaseIn) {
            self.sendButton?.frame = Frame.SendButton.frame(self.view.frame)
        } completion: { _ in
            completion()
        }
    }
}
