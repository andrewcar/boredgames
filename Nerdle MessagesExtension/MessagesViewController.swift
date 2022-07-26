//
//  MessagesViewController.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
        
    // MARK: - Properties
    let padding: CGFloat = 5
    var centerX: CGFloat {
        view.frame.width / 2
    }
    let logoSize = CGSize(width: 117, height: 30)
    let logoBottomPadding: CGFloat = 15
    var logoOriginX: CGFloat {
        centerX - (logoSize.width / 2)
    }
    let letterSize = CGSize(width: 50, height: 50)
    var gridWidth: CGFloat {
        (letterSize.width * 5) + (padding * 6)
    }
    var gridOriginX: CGFloat {
        centerX - (gridWidth / 2)
    }
    var gridMaxY: CGFloat {
        logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogo()
        addLetters()
        addKeyboardView()
    }
    
    // MARK: - Private Methods
    private func addLogo() {
        let logoImageView = UIImageView(frame: CGRect(x: logoOriginX, y: padding, width: logoSize.width, height: logoSize.height))
        logoImageView.image = UIImage(named: "nerdle.png")
        view.addSubview(logoImageView)
    }
    
    private func addLetters() {

        // first row
        let a1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let a2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let a3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let a4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let a5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // second row
        let b1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let b2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let b3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let b4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let b5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // third row
        let c1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let c2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let c3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let c4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let c5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // fourth row
        let d1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let d2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let d3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let d4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let d5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // fifth row
        let e1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let e2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let e3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let e4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let e5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // sixth row
        let f1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let f2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let f3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let f4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        let f5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            view.addSubview(letter)
        }
    }
    
    private func addKeyboardView() {
        let frame = CGRect(x: 0, y: gridMaxY + logoBottomPadding, width: view.frame.width, height: gridWidth)
        view.addSubview(KeyboardView(frame: frame))
    }
    
    // MARK: - Conversation Handling
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
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
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}

extension MessagesViewController: KeyboardDelegate {
    func didTapLetter(_ letter: String) {
        <#code#>
    }
    
    func didTapEnter() {
        //
    }
    
    func didTapBackspace() {
        //
    }
}
