//
//  GridView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

class GridView: UIView {
    
    // MARK: - Properties
    private var a1: GridLetterView?
    private var a2: GridLetterView?
    private var a3: GridLetterView?
    private var a4: GridLetterView?
    private var a5: GridLetterView?
    private var b1: GridLetterView?
    private var b2: GridLetterView?
    private var b3: GridLetterView?
    private var b4: GridLetterView?
    private var b5: GridLetterView?
    private var c1: GridLetterView?
    private var c2: GridLetterView?
    private var c3: GridLetterView?
    private var c4: GridLetterView?
    private var c5: GridLetterView?
    private var d1: GridLetterView?
    private var d2: GridLetterView?
    private var d3: GridLetterView?
    private var d4: GridLetterView?
    private var d5: GridLetterView?
    private var e1: GridLetterView?
    private var e2: GridLetterView?
    private var e3: GridLetterView?
    private var e4: GridLetterView?
    private var e5: GridLetterView?
    private var f1: GridLetterView?
    private var f2: GridLetterView?
    private var f3: GridLetterView?
    private var f4: GridLetterView?
    private var f5: GridLetterView?
    private var keyboardView: KeyboardView?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addLetters()
        addKeyboardView()
        setupGame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func addLetters() {

        // first row
        a1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        a5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // second row
        b1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        b5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // third row
        c1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        c5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fourth row
        d1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        d5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // fifth row
        e1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        e5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // sixth row
        f1 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f2 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f3 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f4 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        f5 = GridLetterView(
            frame: CGRect(
                x: Frame.Grid.outerPadding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding + Frame.Grid.letterSize(frame).width + Frame.padding,
                y: Frame.Logo.bottomPadding + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding + Frame.Grid.letterSize(frame).height + Frame.padding,
                width: Frame.Grid.letterSize(frame).width,
                height: Frame.Grid.letterSize(frame).height))
        
        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            guard let letter = letter else { return }
            addSubview(letter)
        }
    }

    private func addKeyboardView() {
        keyboardView = KeyboardView(frame: Frame.Keyboard.frame(frame))
        keyboardView?.keyboardDelegate = self
        addSubview(keyboardView!)
    }
    
    private func setupGame() {
        a1?.setBorderActive()
    }
}

// MARK: - KeyboardDelegate
extension GridView: KeyboardDelegate {
    func didTapLetter(_ letter: String) {
        switch GameModel.shared.currentLetter {
        case .a1:
            a1?.updateLetter(with: letter)
            a1?.setBorderInactive()
            a2?.setBorderActive()
            GameModel.shared.currentLetter = .a2
        case .a2:
            a2?.updateLetter(with: letter)
            a2?.setBorderInactive()
            a3?.setBorderActive()
            GameModel.shared.currentLetter = .a3
        case .a3:
            a3?.updateLetter(with: letter)
            a3?.setBorderInactive()
            a4?.setBorderActive()
            GameModel.shared.currentLetter = .a4
        case .a4:
            a4?.updateLetter(with: letter)
            a4?.setBorderInactive()
            a5?.setBorderActive()
            GameModel.shared.currentLetter = .a5
        case .a5:
            a5?.updateLetter(with: letter)
        case .b1:
            b1?.updateLetter(with: letter)
            b1?.setBorderInactive()
            b2?.setBorderActive()
            GameModel.shared.currentLetter = .b2
        case .b2:
            b2?.updateLetter(with: letter)
            b2?.setBorderInactive()
            b3?.setBorderActive()
            GameModel.shared.currentLetter = .b3
        case .b3:
            b3?.updateLetter(with: letter)
            b3?.setBorderInactive()
            b4?.setBorderActive()
            GameModel.shared.currentLetter = .b4
        case .b4:
            b4?.updateLetter(with: letter)
            b4?.setBorderInactive()
            b5?.setBorderActive()
            GameModel.shared.currentLetter = .b5
        case .b5:
            b5?.updateLetter(with: letter)
        case .c1:
            c1?.updateLetter(with: letter)
            c1?.setBorderInactive()
            c2?.setBorderActive()
            GameModel.shared.currentLetter = .c2
        case .c2:
            c2?.updateLetter(with: letter)
            c2?.setBorderInactive()
            c3?.setBorderActive()
            GameModel.shared.currentLetter = .c3
        case .c3:
            c3?.updateLetter(with: letter)
            c3?.setBorderInactive()
            c4?.setBorderActive()
            GameModel.shared.currentLetter = .c4
        case .c4:
            c4?.updateLetter(with: letter)
            c4?.setBorderInactive()
            c5?.setBorderActive()
            GameModel.shared.currentLetter = .c5
        case .c5:
            c5?.updateLetter(with: letter)
        case .d1:
            d1?.updateLetter(with: letter)
            d1?.setBorderInactive()
            d2?.setBorderActive()
            GameModel.shared.currentLetter = .d2
        case .d2:
            d2?.updateLetter(with: letter)
            d2?.setBorderInactive()
            d3?.setBorderActive()
            GameModel.shared.currentLetter = .d3
        case .d3:
            d3?.updateLetter(with: letter)
            d3?.setBorderInactive()
            d4?.setBorderActive()
            GameModel.shared.currentLetter = .d4
        case .d4:
            d4?.updateLetter(with: letter)
            d4?.setBorderInactive()
            d5?.setBorderActive()
            GameModel.shared.currentLetter = .d5
        case .d5:
            d5?.updateLetter(with: letter)
        case .e1:
            e1?.updateLetter(with: letter)
            e1?.setBorderInactive()
            e2?.setBorderActive()
            GameModel.shared.currentLetter = .e2
        case .e2:
            e2?.updateLetter(with: letter)
            e2?.setBorderInactive()
            e3?.setBorderActive()
            GameModel.shared.currentLetter = .e3
        case .e3:
            e3?.updateLetter(with: letter)
            e3?.setBorderInactive()
            e4?.setBorderActive()
            GameModel.shared.currentLetter = .e4
        case .e4:
            e4?.updateLetter(with: letter)
            e4?.setBorderInactive()
            e5?.setBorderActive()
            GameModel.shared.currentLetter = .e5
        case .e5:
            e5?.updateLetter(with: letter)
        case .f1:
            f1?.updateLetter(with: letter)
            f1?.setBorderInactive()
            f2?.setBorderActive()
            GameModel.shared.currentLetter = .f2
        case .f2:
            f2?.updateLetter(with: letter)
            f2?.setBorderInactive()
            f3?.setBorderActive()
            GameModel.shared.currentLetter = .f3
        case .f3:
            f3?.updateLetter(with: letter)
            f3?.setBorderInactive()
            f4?.setBorderActive()
            GameModel.shared.currentLetter = .f4
        case .f4:
            f4?.updateLetter(with: letter)
            f4?.setBorderInactive()
            f5?.setBorderActive()
            GameModel.shared.currentLetter = .f5
        case .f5:
            f5?.updateLetter(with: letter)
        }
    }
    
    func didTapEnter() {
        //
    }
    
    func didTapBackspace() {
        //
    }
}
