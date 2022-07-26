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
        logoBottomPadding + logoSize.height + (padding * 6) + (letterSize.height * 6)
    }
    
    var a1: LetterView?
    var a2: LetterView?
    var a3: LetterView?
    var a4: LetterView?
    var a5: LetterView?
    var b1: LetterView?
    var b2: LetterView?
    var b3: LetterView?
    var b4: LetterView?
    var b5: LetterView?
    var c1: LetterView?
    var c2: LetterView?
    var c3: LetterView?
    var c4: LetterView?
    var c5: LetterView?
    var d1: LetterView?
    var d2: LetterView?
    var d3: LetterView?
    var d4: LetterView?
    var d5: LetterView?
    var e1: LetterView?
    var e2: LetterView?
    var e3: LetterView?
    var e4: LetterView?
    var e5: LetterView?
    var f1: LetterView?
    var f2: LetterView?
    var f3: LetterView?
    var f4: LetterView?
    var f5: LetterView?
    

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
        a1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        a2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        a3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        a4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        a5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // second row
        b1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        b2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        b3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        b4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        b5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // third row
        c1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        c2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        c3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        c4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        c5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // fourth row
        d1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        d2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        d3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        d4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        d5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // fifth row
        e1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        e2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        e3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        e4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        e5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // sixth row
        f1 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        f2 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        f3 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        f4 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        f5 = LetterView(
            frame: CGRect(
                x: gridOriginX + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding + letterSize.width + padding,
                y: logoBottomPadding + logoSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding + letterSize.height + padding,
                width: letterSize.width,
                height: letterSize.height))
        
        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            guard let letter = letter else { return }
            view.addSubview(letter)
        }
    }
    
    private func addKeyboardView() {
        let frame = CGRect(x: 0, y: gridMaxY + logoBottomPadding, width: view.frame.width, height: gridWidth)
        let keyboardView = KeyboardView(frame: frame)
        keyboardView.keyboardDelegate = self
        view.addSubview(keyboardView)
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


// MARK: - KeyboardDelegate
extension MessagesViewController: KeyboardDelegate {
    func didTapLetter(_ letter: String) {
        switch Game.shared.currentLetter {
        case .a1:
            a1?.letter = letter
        case .a2:
            a2?.letter = letter
        case .a3:
            a3?.letter = letter
        case .a4:
            a4?.letter = letter
        case .a5:
            a5?.letter = letter
        case .b1:
            b1?.letter = letter
        case .b2:
            b2?.letter = letter
        case .b3:
            b3?.letter = letter
        case .b4:
            b4?.letter = letter
        case .b5:
            b5?.letter = letter
        case .c1:
            c1?.letter = letter
        case .c2:
            c2?.letter = letter
        case .c3:
            c3?.letter = letter
        case .c4:
            c4?.letter = letter
        case .c5:
            c5?.letter = letter
        case .d1:
            d1?.letter = letter
        case .d2:
            d2?.letter = letter
        case .d3:
            d3?.letter = letter
        case .d4:
            d4?.letter = letter
        case .d5:
            d5?.letter = letter
        case .e1:
            e1?.letter = letter
        case .e2:
            e2?.letter = letter
        case .e3:
            e3?.letter = letter
        case .e4:
            e4?.letter = letter
        case .e5:
            e5?.letter = letter
        case .f1:
            f1?.letter = letter
        case .f2:
            f2?.letter = letter
        case .f3:
            f3?.letter = letter
        case .f4:
            f4?.letter = letter
        case .f5:
            f5?.letter = letter
        }
    }
    
    func didTapEnter() {
        //
    }
    
    func didTapBackspace() {
        //
    }
}
