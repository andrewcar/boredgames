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
    private var gridView: GridView?
    private var sendButton: UIButton?
    private var resetButton: UIButton?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogo()
        addGridView()
        addSendButton()
        addResetButton()
    }
    
    
    // MARK: - Private Methods
    private func addLogo() {
        logoImageView = UIImageView(frame: Frame.Logo.frame(view.frame))
        logoImageView?.image = UIImage(named: "nerdle.png")
        view.addSubview(logoImageView!)
    }
    
    private func addGridView() {
        gridView = GridView(frame: Frame.Grid.frame(view.frame))
        view.addSubview(gridView!)
    }
    
    private func addSendButton() {
        sendButton = UIButton(frame: Frame.SendButton.frame(view.frame))
        sendButton?.addTarget(self, action: #selector(didTapSendButton(sender:)), for: .touchUpInside)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 42, weight: .bold, scale: .medium)
        let image = UIImage(systemName: "arrow.up.circle.fill", withConfiguration: largeConfig)!
        sendButton?.setImage(image, for: .normal)
        sendButton?.setTitleColor(.white, for: .normal)
        view.addSubview(sendButton!)
    }
    
    private func addResetButton() {
        resetButton = UIButton(frame: Frame.ResetButton.frame(view.frame))
        resetButton?.addTarget(self, action: #selector(didTapResetButton(sender:)), for: .touchUpInside)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 42, weight: .bold, scale: .medium)
        let image = UIImage(systemName: "trash.circle.fill", withConfiguration: largeConfig)!
        resetButton?.setImage(image, for: .normal)
        resetButton?.setTitleColor(.white, for: .normal)
        view.addSubview(resetButton!)
    }
    
    @objc
    private func didTapSendButton(sender: UIButton) {
        activeConversation?.send(composeMessage(), completionHandler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        })
    }
    
    @objc
    private func didTapResetButton(sender: UIButton) {
        GameModel.shared.resetGame()
        gridView?.resetRows()
        gridView?.keyboardView?.resetKeyboard()
    }
    
    private func composeMessage() -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        
        let components = NSURLComponents()
        components.queryItems = [
            URLQueryItem(name: "answer", value: GameModel.shared.answer),
            URLQueryItem(name: "guess1", value: GameModel.shared.firstGuess),
            URLQueryItem(name: "guess2", value: GameModel.shared.secondGuess),
            URLQueryItem(name: "guess3", value: GameModel.shared.thirdGuess),
            URLQueryItem(name: "guess4", value: GameModel.shared.fourthGuess),
            URLQueryItem(name: "guess5", value: GameModel.shared.fifthGuess),
            URLQueryItem(name: "guess6", value: GameModel.shared.sixthGuess),
            URLQueryItem(name: "guessNumber", value: GameModel.shared.guessNumber.rawValue)
        ]
        message.url = components.url!

        let layout = MSMessageTemplateLayout()
        layout.image = UIImage(named: "nerdle.png")
        layout.caption = "Nerdle"
        layout.subcaption = "It's your turn!"
        layout.trailingSubcaption = "🟨🟩⬜️⬜️⬜️"

        message.layout = layout
        return message
    }
    
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
            
            var answer: String?
            var firstGuess: String?
            var secondGuess: String?
            var thirdGuess: String?
            var fourthGuess: String?
            var fifthGuess: String?
            var sixthGuess: String?
            var guessNumber: String?
            
            for queryItem in queryItems {
                if let value = queryItem.value {
                    switch queryItem.name {
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
                    default: ()
                    }
                }
            }
            
            if let answer = answer {
                GameModel.shared.save(answer: answer)
            }
            if let firstGuess = firstGuess {
                GameModel.shared.save(firstGuess: firstGuess)
            }
            if let secondGuess = secondGuess {
                GameModel.shared.save(secondGuess: secondGuess)
            }
            if let thirdGuess = thirdGuess {
                GameModel.shared.save(thirdGuess: thirdGuess)
            }
            if let fourthGuess = fourthGuess {
                GameModel.shared.save(fourthGuess: fourthGuess)
            }
            if let fifthGuess = fifthGuess {
                GameModel.shared.save(fifthGuess: fifthGuess)
            }
            if let sixthGuess = sixthGuess {
                GameModel.shared.save(sixthGuess: sixthGuess)
            }
            if let guessNumber = guessNumber {
                GameModel.shared.save(guessNumber: guessNumber)
            }
            
            GameModel.shared.populateAnswerLetterCountDictionary {}
        }
        
        gridView?.keyboardView?.isUserInteractionEnabled = true
    }
    
    // MARK: - Conversation Handling
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
        requestPresentationStyle(.expanded)
        
        if let selectedMessage = conversation.selectedMessage {
            decode(selectedMessage)
            
            if let answer = GameModel.shared.retrieveAnswer() {
                GameModel.shared.answer = answer
            }
            
            if let guessNumber = GameModel.shared.retrieveGuessNumber() {
                GameModel.shared.guessNumber = guessNumber
            }
            
            gridView?.updateRows(
                firstGuess: GameModel.shared.retrieveFirstGuess(),
                secondGuess: GameModel.shared.retrieveSecondGuess(),
                thirdGuess: GameModel.shared.retrieveThirdGuess(),
                fourthGuess: GameModel.shared.retrieveFourthGuess(),
                fifthGuess: GameModel.shared.retrieveFifthGuess(),
                sixthGuess: GameModel.shared.retrieveSixthGuess(),
                guessToAnimate: GameModel.shared.retrieveGuessNumber()
            )
            
            switch GameModel.shared.guessNumber {
            case .first:
                GameModel.shared.guessNumber = .second
                GameModel.shared.currentLetter = .b0
            case .second:
                GameModel.shared.guessNumber = .third
                GameModel.shared.currentLetter = .c0
            case .third:
                GameModel.shared.guessNumber = .fourth
                GameModel.shared.currentLetter = .d0
            case .fourth:
                GameModel.shared.guessNumber = .fifth
                GameModel.shared.currentLetter = .e0
            case .fifth:
                GameModel.shared.guessNumber = .sixth
                GameModel.shared.currentLetter = .f0
            case .sixth: ()
            }
        }
    }
    
    override func didBecomeActive(with conversation: MSConversation) {
        //
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        requestPresentationStyle(.compact)
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func didSelect(_ message: MSMessage, conversation: MSConversation) {
        if let selectedMessage = conversation.selectedMessage {
            decode(selectedMessage)
        }
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        if let selectedMessage = activeConversation?.selectedMessage {
            decode(selectedMessage)
        }
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}

extension MessagesViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //
    }
}
