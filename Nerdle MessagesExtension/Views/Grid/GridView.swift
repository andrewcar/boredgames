//
//  GridView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

protocol GridDelegate {
    func showNotInWordListView()
    func showSuccessView()
    func showAnswer()
    func disableKeyboard()
    func setKeyToGreen(for guessLetter: String)
    func setKeyToGray(for guessLetter: String)
    func setKeyToYellow(for guessLetter: String)
    func showSendButton()
}

class GridView: UIView {
    
    // MARK: - Properties
    var a1 = GridLetterView()
    var a2 = GridLetterView()
    var a3 = GridLetterView()
    var a4 = GridLetterView()
    var a5 = GridLetterView()
    var b1 = GridLetterView()
    var b2 = GridLetterView()
    var b3 = GridLetterView()
    var b4 = GridLetterView()
    var b5 = GridLetterView()
    var c1 = GridLetterView()
    var c2 = GridLetterView()
    var c3 = GridLetterView()
    var c4 = GridLetterView()
    var c5 = GridLetterView()
    var d1 = GridLetterView()
    var d2 = GridLetterView()
    var d3 = GridLetterView()
    var d4 = GridLetterView()
    var d5 = GridLetterView()
    var e1 = GridLetterView()
    var e2 = GridLetterView()
    var e3 = GridLetterView()
    var e4 = GridLetterView()
    var e5 = GridLetterView()
    var f1 = GridLetterView()
    var f2 = GridLetterView()
    var f3 = GridLetterView()
    var f4 = GridLetterView()
    var f5 = GridLetterView()
    private var letterPortraitConstraints: [NSLayoutConstraint] = []
    private var letterLandscapeConstraints: [NSLayoutConstraint] = []
    var gridDelegate: GridDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLetters()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LETTER PORTRAIT CONSTRAINTS
    func activateLetterPortraitConstraints() {
        NSLayoutConstraint.deactivate(letterPortraitConstraints)
        NSLayoutConstraint.deactivate(letterLandscapeConstraints)
        let twoThirdsWidth = (UIScreen.main.bounds.width / 3) * 2
        let scaledPadding = (Frame.padding / 3) * 2
        let oneFifthSansPadding: CGFloat = (twoThirdsWidth - (scaledPadding * 6)) / 5
        let size = CGSize(width: oneFifthSansPadding, height: oneFifthSansPadding)
        letterPortraitConstraints = [
            
            // FIRST ROW
            a1.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            a1.widthAnchor.constraint(equalToConstant: size.width),
            a1.heightAnchor.constraint(equalToConstant: size.height),
            
            a2.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a2.leadingAnchor.constraint(equalTo: a1.trailingAnchor, constant: Frame.padding),
            a2.widthAnchor.constraint(equalToConstant: size.width),
            a2.heightAnchor.constraint(equalToConstant: size.height),
            
            a3.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: Frame.padding),
            a3.widthAnchor.constraint(equalToConstant: size.width),
            a3.heightAnchor.constraint(equalToConstant: size.height),
            
            a4.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a4.leadingAnchor.constraint(equalTo: a3.trailingAnchor, constant: Frame.padding),
            a4.widthAnchor.constraint(equalToConstant: size.width),
            a4.heightAnchor.constraint(equalToConstant: size.height),
            
            a5.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a5.leadingAnchor.constraint(equalTo: a4.trailingAnchor, constant: Frame.padding),
            a5.widthAnchor.constraint(equalToConstant: size.width),
            a5.heightAnchor.constraint(equalToConstant: size.height),
            
            // SECOND ROW
            b1.topAnchor.constraint(equalTo: a1.bottomAnchor, constant: Frame.padding),
            b1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            b1.widthAnchor.constraint(equalToConstant: size.width),
            b1.heightAnchor.constraint(equalToConstant: size.height),
            
            b2.topAnchor.constraint(equalTo: a2.bottomAnchor, constant: Frame.padding),
            b2.leadingAnchor.constraint(equalTo: b1.trailingAnchor, constant: Frame.padding),
            b2.widthAnchor.constraint(equalToConstant: size.width),
            b2.heightAnchor.constraint(equalToConstant: size.height),
            
            b3.topAnchor.constraint(equalTo: a3.bottomAnchor, constant: Frame.padding),
            b3.leadingAnchor.constraint(equalTo: b2.trailingAnchor, constant: Frame.padding),
            b3.widthAnchor.constraint(equalToConstant: size.width),
            b3.heightAnchor.constraint(equalToConstant: size.height),
            
            b4.topAnchor.constraint(equalTo: a4.bottomAnchor, constant: Frame.padding),
            b4.leadingAnchor.constraint(equalTo: b3.trailingAnchor, constant: Frame.padding),
            b4.widthAnchor.constraint(equalToConstant: size.width),
            b4.heightAnchor.constraint(equalToConstant: size.height),
            
            b5.topAnchor.constraint(equalTo: a5.bottomAnchor, constant: Frame.padding),
            b5.leadingAnchor.constraint(equalTo: b4.trailingAnchor, constant: Frame.padding),
            b5.widthAnchor.constraint(equalToConstant: size.width),
            b5.heightAnchor.constraint(equalToConstant: size.height),
            
            // THIRD ROW
            c1.topAnchor.constraint(equalTo: b1.bottomAnchor, constant: Frame.padding),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            c1.widthAnchor.constraint(equalToConstant: size.width),
            c1.heightAnchor.constraint(equalToConstant: size.height),
            
            c2.topAnchor.constraint(equalTo: b2.bottomAnchor, constant: Frame.padding),
            c2.leadingAnchor.constraint(equalTo: c1.trailingAnchor, constant: Frame.padding),
            c2.widthAnchor.constraint(equalToConstant: size.width),
            c2.heightAnchor.constraint(equalToConstant: size.height),
            
            c3.topAnchor.constraint(equalTo: b3.bottomAnchor, constant: Frame.padding),
            c3.leadingAnchor.constraint(equalTo: c2.trailingAnchor, constant: Frame.padding),
            c3.widthAnchor.constraint(equalToConstant: size.width),
            c3.heightAnchor.constraint(equalToConstant: size.height),
            
            c4.topAnchor.constraint(equalTo: b4.bottomAnchor, constant: Frame.padding),
            c4.leadingAnchor.constraint(equalTo: c3.trailingAnchor, constant: Frame.padding),
            c4.widthAnchor.constraint(equalToConstant: size.width),
            c4.heightAnchor.constraint(equalToConstant: size.height),
            
            c5.topAnchor.constraint(equalTo: b5.bottomAnchor, constant: Frame.padding),
            c5.leadingAnchor.constraint(equalTo: c4.trailingAnchor, constant: Frame.padding),
            c5.widthAnchor.constraint(equalToConstant: size.width),
            c5.heightAnchor.constraint(equalToConstant: size.height),
            
            // FOURTH ROW
            d1.topAnchor.constraint(equalTo: c1.bottomAnchor, constant: Frame.padding),
            d1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            d1.widthAnchor.constraint(equalToConstant: size.width),
            d1.heightAnchor.constraint(equalToConstant: size.height),
            
            d2.topAnchor.constraint(equalTo: c2.bottomAnchor, constant: Frame.padding),
            d2.leadingAnchor.constraint(equalTo: d1.trailingAnchor, constant: Frame.padding),
            d2.widthAnchor.constraint(equalToConstant: size.width),
            d2.heightAnchor.constraint(equalToConstant: size.height),
            
            d3.topAnchor.constraint(equalTo: c3.bottomAnchor, constant: Frame.padding),
            d3.leadingAnchor.constraint(equalTo: d2.trailingAnchor, constant: Frame.padding),
            d3.widthAnchor.constraint(equalToConstant: size.width),
            d3.heightAnchor.constraint(equalToConstant: size.height),
            
            d4.topAnchor.constraint(equalTo: c4.bottomAnchor, constant: Frame.padding),
            d4.leadingAnchor.constraint(equalTo: d3.trailingAnchor, constant: Frame.padding),
            d4.widthAnchor.constraint(equalToConstant: size.width),
            d4.heightAnchor.constraint(equalToConstant: size.height),
            
            d5.topAnchor.constraint(equalTo: c5.bottomAnchor, constant: Frame.padding),
            d5.leadingAnchor.constraint(equalTo: d4.trailingAnchor, constant: Frame.padding),
            d5.widthAnchor.constraint(equalToConstant: size.width),
            d5.heightAnchor.constraint(equalToConstant: size.height),
            
            // FIFTH ROW
            e1.topAnchor.constraint(equalTo: d1.bottomAnchor, constant: Frame.padding),
            e1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            e1.widthAnchor.constraint(equalToConstant: size.width),
            e1.heightAnchor.constraint(equalToConstant: size.height),
            
            e2.topAnchor.constraint(equalTo: d2.bottomAnchor, constant: Frame.padding),
            e2.leadingAnchor.constraint(equalTo: e1.trailingAnchor, constant: Frame.padding),
            e2.widthAnchor.constraint(equalToConstant: size.width),
            e2.heightAnchor.constraint(equalToConstant: size.height),
            
            e3.topAnchor.constraint(equalTo: d3.bottomAnchor, constant: Frame.padding),
            e3.leadingAnchor.constraint(equalTo: e2.trailingAnchor, constant: Frame.padding),
            e3.widthAnchor.constraint(equalToConstant: size.width),
            e3.heightAnchor.constraint(equalToConstant: size.height),
            
            e4.topAnchor.constraint(equalTo: d4.bottomAnchor, constant: Frame.padding),
            e4.leadingAnchor.constraint(equalTo: e3.trailingAnchor, constant: Frame.padding),
            e4.widthAnchor.constraint(equalToConstant: size.width),
            e4.heightAnchor.constraint(equalToConstant: size.height),
            
            e5.topAnchor.constraint(equalTo: d5.bottomAnchor, constant: Frame.padding),
            e5.leadingAnchor.constraint(equalTo: e4.trailingAnchor, constant: Frame.padding),
            e5.widthAnchor.constraint(equalToConstant: size.width),
            e5.heightAnchor.constraint(equalToConstant: size.height),
            
            // SIXTH ROW
            f1.topAnchor.constraint(equalTo: e1.bottomAnchor, constant: Frame.padding),
            f1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            f1.widthAnchor.constraint(equalToConstant: size.width),
            f1.heightAnchor.constraint(equalToConstant: size.height),
            
            f2.topAnchor.constraint(equalTo: e2.bottomAnchor, constant: Frame.padding),
            f2.leadingAnchor.constraint(equalTo: f1.trailingAnchor, constant: Frame.padding),
            f2.widthAnchor.constraint(equalToConstant: size.width),
            f2.heightAnchor.constraint(equalToConstant: size.height),
            
            f3.topAnchor.constraint(equalTo: e3.bottomAnchor, constant: Frame.padding),
            f3.leadingAnchor.constraint(equalTo: f2.trailingAnchor, constant: Frame.padding),
            f3.widthAnchor.constraint(equalToConstant: size.width),
            f3.heightAnchor.constraint(equalToConstant: size.height),
            
            f4.topAnchor.constraint(equalTo: e4.bottomAnchor, constant: Frame.padding),
            f4.leadingAnchor.constraint(equalTo: f3.trailingAnchor, constant: Frame.padding),
            f4.widthAnchor.constraint(equalToConstant: size.width),
            f4.heightAnchor.constraint(equalToConstant: size.height),
            
            f5.topAnchor.constraint(equalTo: e5.bottomAnchor, constant: Frame.padding),
            f5.leadingAnchor.constraint(equalTo: f4.trailingAnchor, constant: Frame.padding),
            f5.widthAnchor.constraint(equalToConstant: size.width),
            f5.heightAnchor.constraint(equalToConstant: size.height),
        ]
        NSLayoutConstraint.activate(letterPortraitConstraints)
    }

    
    // MARK: - LETTER LANDSCAPE CONSTRAINTS
    func activateLetterLandscapeConstraints() {
        NSLayoutConstraint.deactivate(letterPortraitConstraints)
        NSLayoutConstraint.deactivate(letterLandscapeConstraints)
        let oneFifthSansPadding: CGFloat = ((UIScreen.main.bounds.size.width / 2.3) / 5) - (Frame.padding * 6)
        let size = CGSize(width: oneFifthSansPadding, height: oneFifthSansPadding)
        letterLandscapeConstraints = [
            
            // FIRST ROW
            a1.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            a1.widthAnchor.constraint(equalToConstant: size.width),
            a1.heightAnchor.constraint(equalToConstant: size.height),
            
            a2.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a2.leadingAnchor.constraint(equalTo: a1.trailingAnchor, constant: Frame.padding),
            a2.widthAnchor.constraint(equalToConstant: size.width),
            a2.heightAnchor.constraint(equalToConstant: size.height),
            
            a3.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: Frame.padding),
            a3.widthAnchor.constraint(equalToConstant: size.width),
            a3.heightAnchor.constraint(equalToConstant: size.height),
            
            a4.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a4.leadingAnchor.constraint(equalTo: a3.trailingAnchor, constant: Frame.padding),
            a4.widthAnchor.constraint(equalToConstant: size.width),
            a4.heightAnchor.constraint(equalToConstant: size.height),
            
            a5.topAnchor.constraint(equalTo: topAnchor, constant: Frame.padding),
            a5.leadingAnchor.constraint(equalTo: a4.trailingAnchor, constant: Frame.padding),
            a5.widthAnchor.constraint(equalToConstant: size.width),
            a5.heightAnchor.constraint(equalToConstant: size.height),
            
            // SECOND ROW
            b1.topAnchor.constraint(equalTo: a1.bottomAnchor, constant: Frame.padding),
            b1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            b1.widthAnchor.constraint(equalToConstant: size.width),
            b1.heightAnchor.constraint(equalToConstant: size.height),
            
            b2.topAnchor.constraint(equalTo: a2.bottomAnchor, constant: Frame.padding),
            b2.leadingAnchor.constraint(equalTo: b1.trailingAnchor, constant: Frame.padding),
            b2.widthAnchor.constraint(equalToConstant: size.width),
            b2.heightAnchor.constraint(equalToConstant: size.height),
            
            b3.topAnchor.constraint(equalTo: a3.bottomAnchor, constant: Frame.padding),
            b3.leadingAnchor.constraint(equalTo: b2.trailingAnchor, constant: Frame.padding),
            b3.widthAnchor.constraint(equalToConstant: size.width),
            b3.heightAnchor.constraint(equalToConstant: size.height),
            
            b4.topAnchor.constraint(equalTo: a4.bottomAnchor, constant: Frame.padding),
            b4.leadingAnchor.constraint(equalTo: b3.trailingAnchor, constant: Frame.padding),
            b4.widthAnchor.constraint(equalToConstant: size.width),
            b4.heightAnchor.constraint(equalToConstant: size.height),
            
            b5.topAnchor.constraint(equalTo: a5.bottomAnchor, constant: Frame.padding),
            b5.leadingAnchor.constraint(equalTo: b4.trailingAnchor, constant: Frame.padding),
            b5.widthAnchor.constraint(equalToConstant: size.width),
            b5.heightAnchor.constraint(equalToConstant: size.height),
            
            // THIRD ROW
            c1.topAnchor.constraint(equalTo: b1.bottomAnchor, constant: Frame.padding),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            c1.widthAnchor.constraint(equalToConstant: size.width),
            c1.heightAnchor.constraint(equalToConstant: size.height),
            
            c2.topAnchor.constraint(equalTo: b2.bottomAnchor, constant: Frame.padding),
            c2.leadingAnchor.constraint(equalTo: c1.trailingAnchor, constant: Frame.padding),
            c2.widthAnchor.constraint(equalToConstant: size.width),
            c2.heightAnchor.constraint(equalToConstant: size.height),
            
            c3.topAnchor.constraint(equalTo: b3.bottomAnchor, constant: Frame.padding),
            c3.leadingAnchor.constraint(equalTo: c2.trailingAnchor, constant: Frame.padding),
            c3.widthAnchor.constraint(equalToConstant: size.width),
            c3.heightAnchor.constraint(equalToConstant: size.height),
            
            c4.topAnchor.constraint(equalTo: b4.bottomAnchor, constant: Frame.padding),
            c4.leadingAnchor.constraint(equalTo: c3.trailingAnchor, constant: Frame.padding),
            c4.widthAnchor.constraint(equalToConstant: size.width),
            c4.heightAnchor.constraint(equalToConstant: size.height),
            
            c5.topAnchor.constraint(equalTo: b5.bottomAnchor, constant: Frame.padding),
            c5.leadingAnchor.constraint(equalTo: c4.trailingAnchor, constant: Frame.padding),
            c5.widthAnchor.constraint(equalToConstant: size.width),
            c5.heightAnchor.constraint(equalToConstant: size.height),
            
            // FOURTH ROW
            d1.topAnchor.constraint(equalTo: c1.bottomAnchor, constant: Frame.padding),
            d1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            d1.widthAnchor.constraint(equalToConstant: size.width),
            d1.heightAnchor.constraint(equalToConstant: size.height),
            
            d2.topAnchor.constraint(equalTo: c2.bottomAnchor, constant: Frame.padding),
            d2.leadingAnchor.constraint(equalTo: d1.trailingAnchor, constant: Frame.padding),
            d2.widthAnchor.constraint(equalToConstant: size.width),
            d2.heightAnchor.constraint(equalToConstant: size.height),
            
            d3.topAnchor.constraint(equalTo: c3.bottomAnchor, constant: Frame.padding),
            d3.leadingAnchor.constraint(equalTo: d2.trailingAnchor, constant: Frame.padding),
            d3.widthAnchor.constraint(equalToConstant: size.width),
            d3.heightAnchor.constraint(equalToConstant: size.height),
            
            d4.topAnchor.constraint(equalTo: c4.bottomAnchor, constant: Frame.padding),
            d4.leadingAnchor.constraint(equalTo: d3.trailingAnchor, constant: Frame.padding),
            d4.widthAnchor.constraint(equalToConstant: size.width),
            d4.heightAnchor.constraint(equalToConstant: size.height),
            
            d5.topAnchor.constraint(equalTo: c5.bottomAnchor, constant: Frame.padding),
            d5.leadingAnchor.constraint(equalTo: d4.trailingAnchor, constant: Frame.padding),
            d5.widthAnchor.constraint(equalToConstant: size.width),
            d5.heightAnchor.constraint(equalToConstant: size.height),
            
            // FIFTH ROW
            e1.topAnchor.constraint(equalTo: d1.bottomAnchor, constant: Frame.padding),
            e1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            e1.widthAnchor.constraint(equalToConstant: size.width),
            e1.heightAnchor.constraint(equalToConstant: size.height),
            
            e2.topAnchor.constraint(equalTo: d2.bottomAnchor, constant: Frame.padding),
            e2.leadingAnchor.constraint(equalTo: e1.trailingAnchor, constant: Frame.padding),
            e2.widthAnchor.constraint(equalToConstant: size.width),
            e2.heightAnchor.constraint(equalToConstant: size.height),
            
            e3.topAnchor.constraint(equalTo: d3.bottomAnchor, constant: Frame.padding),
            e3.leadingAnchor.constraint(equalTo: e2.trailingAnchor, constant: Frame.padding),
            e3.widthAnchor.constraint(equalToConstant: size.width),
            e3.heightAnchor.constraint(equalToConstant: size.height),
            
            e4.topAnchor.constraint(equalTo: d4.bottomAnchor, constant: Frame.padding),
            e4.leadingAnchor.constraint(equalTo: e3.trailingAnchor, constant: Frame.padding),
            e4.widthAnchor.constraint(equalToConstant: size.width),
            e4.heightAnchor.constraint(equalToConstant: size.height),
            
            e5.topAnchor.constraint(equalTo: d5.bottomAnchor, constant: Frame.padding),
            e5.leadingAnchor.constraint(equalTo: e4.trailingAnchor, constant: Frame.padding),
            e5.widthAnchor.constraint(equalToConstant: size.width),
            e5.heightAnchor.constraint(equalToConstant: size.height),
            
            // SIXTH ROW
            f1.topAnchor.constraint(equalTo: e1.bottomAnchor, constant: Frame.padding),
            f1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding),
            f1.widthAnchor.constraint(equalToConstant: size.width),
            f1.heightAnchor.constraint(equalToConstant: size.height),
            
            f2.topAnchor.constraint(equalTo: e2.bottomAnchor, constant: Frame.padding),
            f2.leadingAnchor.constraint(equalTo: f1.trailingAnchor, constant: Frame.padding),
            f2.widthAnchor.constraint(equalToConstant: size.width),
            f2.heightAnchor.constraint(equalToConstant: size.height),
            
            f3.topAnchor.constraint(equalTo: e3.bottomAnchor, constant: Frame.padding),
            f3.leadingAnchor.constraint(equalTo: f2.trailingAnchor, constant: Frame.padding),
            f3.widthAnchor.constraint(equalToConstant: size.width),
            f3.heightAnchor.constraint(equalToConstant: size.height),
            
            f4.topAnchor.constraint(equalTo: e4.bottomAnchor, constant: Frame.padding),
            f4.leadingAnchor.constraint(equalTo: f3.trailingAnchor, constant: Frame.padding),
            f4.widthAnchor.constraint(equalToConstant: size.width),
            f4.heightAnchor.constraint(equalToConstant: size.height),
            
            f5.topAnchor.constraint(equalTo: e5.bottomAnchor, constant: Frame.padding),
            f5.leadingAnchor.constraint(equalTo: f4.trailingAnchor, constant: Frame.padding),
            f5.widthAnchor.constraint(equalToConstant: size.width),
            f5.heightAnchor.constraint(equalToConstant: size.height),
        ]
        NSLayoutConstraint.activate(letterLandscapeConstraints)
    }
    
    // MARK: - ADD LETTERS
    func addLetters() {

        // first row
        a1 = GridLetterView(frame: .zero)
        a2 = GridLetterView(frame: .zero)
        a3 = GridLetterView(frame: .zero)
        a4 = GridLetterView(frame: .zero)
        a5 = GridLetterView(frame: .zero)
        
        // second row
        b1 = GridLetterView(frame: .zero)
        b2 = GridLetterView(frame: .zero)
        b3 = GridLetterView(frame: .zero)
        b4 = GridLetterView(frame: .zero)
        b5 = GridLetterView(frame: .zero)
        
        // third row
        c1 = GridLetterView(frame: .zero)
        c2 = GridLetterView(frame: .zero)
        c3 = GridLetterView(frame: .zero)
        c4 = GridLetterView(frame: .zero)
        c5 = GridLetterView(frame: .zero)
        
        // fourth row
        d1 = GridLetterView(frame: .zero)
        d2 = GridLetterView(frame: .zero)
        d3 = GridLetterView(frame: .zero)
        d4 = GridLetterView(frame: .zero)
        d5 = GridLetterView(frame: .zero)
        
        // fifth row
        e1 = GridLetterView(frame: .zero)
        e2 = GridLetterView(frame: .zero)
        e3 = GridLetterView(frame: .zero)
        e4 = GridLetterView(frame: .zero)
        e5 = GridLetterView(frame: .zero)
        
        // sixth row
        f1 = GridLetterView(frame: .zero)
        f2 = GridLetterView(frame: .zero)
        f3 = GridLetterView(frame: .zero)
        f4 = GridLetterView(frame: .zero)
        f5 = GridLetterView(frame: .zero)

        // add all letter subviews to view
        for letter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            addSubview(letter)
        }
    }
    
    // MARK: - RESET ROWS
    func resetRows() {
        for gridLetter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            gridLetter.updateLetter(with: "")
            gridLetter.updateLetter(to: .blank, animated: false, completion: {})
            gridLetter.setBorderInactive()
        }
    }

    // MARK: - UPDATE ROWS FROM MESSAGE
    func updateRowsFromMessage(
                    answer: String?,
                    firstGuess: String?,
                    secondGuess: String?,
                    thirdGuess: String?,
                    fourthGuess: String?,
                    fifthGuess: String?,
                    sixthGuess: String?,
                    guessToAnimate: Guess? = .first,
                    completion: @escaping (GameState) -> ()) {
        
        if let firstGuess = firstGuess, let answer = answer {
            let guess = firstGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFirstRow(guess: guess,
                                    animated: guessToAnimate == .first ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let secondGuess = secondGuess, let answer = answer {
            let guess = secondGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateSecondRow(guess: guess,
                                animated: guessToAnimate == .second ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let thirdGuess = thirdGuess, let answer = answer {
            let guess = thirdGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateThirdRow(guess: guess,
                                animated: guessToAnimate == .third ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let fourthGuess = fourthGuess, let answer = answer {
            let guess = fourthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFourthRow(guess: guess,
                                animated: guessToAnimate == .fourth ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let fifthGuess = fifthGuess, let answer = answer {
            let guess = fifthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateFifthRow(guess: guess,
                                animated: guessToAnimate == .fifth ? true : false) {
                    completion(guess == answer ? .won : .playing)
                }
            }
        }
        if let sixthGuess = sixthGuess, let answer = answer {
            let guess = sixthGuess.lowercased()
            GameModel.shared.populateGuessLetterCountDictionary(with: guess) {
                self.updateSixthRow(guess: guess,
                                animated: guessToAnimate == .sixth ? true : false) {
                    completion(guess == answer ? .won : .lost)
                }
            }
        }
    }
    
    // MARK: - UPDATE FIRST ROW
    func updateFirstRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateA1(for: guess, animated: animated) {
                self.updateA2(for: guess, animated: animated) {
                    self.updateA3(for: guess, animated: animated) {
                        self.updateA4(for: guess, animated: animated) {
                            self.updateA5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE SECOND ROW
    func updateSecondRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateB1(for: guess, animated: animated) {
                self.updateB2(for: guess, animated: animated) {
                    self.updateB3(for: guess, animated: animated) {
                        self.updateB4(for: guess, animated: animated) {
                            self.updateB5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE THIRD ROW
    func updateThirdRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateC1(for: guess, animated: animated) {
                self.updateC2(for: guess, animated: animated) {
                    self.updateC3(for: guess, animated: animated) {
                        self.updateC4(for: guess, animated: animated) {
                            self.updateC5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FOURTH ROW
    func updateFourthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateD1(for: guess, animated: animated) {
                self.updateD2(for: guess, animated: animated) {
                    self.updateD3(for: guess, animated: animated) {
                        self.updateD4(for: guess, animated: animated) {
                            self.updateD5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FIFTH ROW
    func updateFifthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateE1(for: guess, animated: animated) {
                self.updateE2(for: guess, animated: animated) {
                    self.updateE3(for: guess, animated: animated) {
                        self.updateE4(for: guess, animated: animated) {
                            self.updateE5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE SIXTH ROW
    func updateSixthRow(guess: String, animated: Bool = false, completion: @escaping () -> ()) {
        incrementLetterCounts(guess: guess) {
            self.updateF1(for: guess, animated: animated) {
                self.updateF2(for: guess, animated: animated) {
                    self.updateF3(for: guess, animated: animated) {
                        self.updateF4(for: guess, animated: animated) {
                            self.updateF5(for: guess, animated: animated) {
                                completion()
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - UPDATE FIRST ROW FROM ENTER
    private func updateFirstRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .a5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess1 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased(), completion: {
            self.updateFirstRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        })
    }
    
    // MARK: - UPDATE SECOND ROW FROM ENTER
    private func updateSecondRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .b5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess2 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSecondRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE THIRD ROW FROM ENTER
    private func updateThirdRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .c5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess3 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateThirdRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE FOURTH ROW FROM ENTER
    private func updateFourthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .d5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess4 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFourthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE FIFTH ROW FROM ENTER
    private func updateFifthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .e5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess5 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateFifthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }
    
    // MARK: - UPDATE SIXTH ROW FROM ENTER
    private func updateSixthRowFromEnter(completion: @escaping () -> ()) {
        guard GameModel.shared.currentGame?.currentLetter == .f5 && GameModel.shared.currentGuess.count == 5 else { completion(); return }
        gridDelegate?.disableKeyboard()
        GameModel.shared.currentGame?.guess6 = GameModel.shared.currentGuess.lowercased()
        incrementLetterCounts(guess: GameModel.shared.currentGuess.lowercased()) {
            self.updateSixthRow(guess: GameModel.shared.currentGuess, animated: true) {
                completion()
            }
        }
    }

    // MARK: - UPDATE GRID LETTER COLORS
    func updateGridLetterColors() {
        for gridLetter in [a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5] {
            gridLetter.updateColors()
        }
    }
    
    // MARK: - UPDATE ROWS FROM ENTER
    func updateRowsFromEnter(completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let guessNumber = currentGame.guessNumber else { completion(); return }
        switch guessNumber {
        case .first:
            updateFirstRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        case .second:
            updateSecondRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        case .third:
            updateThirdRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        case .fourth:
            updateFourthRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        case .fifth:
            updateFifthRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        case .sixth:
            updateSixthRowFromEnter {
                self.gridDelegate?.showSendButton()
                completion()
            }
        }
    }
    
    // MARK: - JUMP FOR JOY
    func jumpForJoy(completion: @escaping () -> ()) {
        a1.jumpForJoy {
            self.a2.jumpForJoy {
                self.a3.jumpForJoy {
                    self.a4.jumpForJoy {
                        self.a5.jumpForJoy {
                            self.b1.jumpForJoy {
                                self.b2.jumpForJoy {
                                    self.b3.jumpForJoy {
                                        self.b4.jumpForJoy {
                                            self.b5.jumpForJoy {
                                                self.c1.jumpForJoy {
                                                    self.c2.jumpForJoy {
                                                        self.c3.jumpForJoy {
                                                            self.c4.jumpForJoy {
                                                                self.c5.jumpForJoy {
                                                                    self.d1.jumpForJoy {
                                                                        self.d2.jumpForJoy {
                                                                            self.d3.jumpForJoy {
                                                                                self.d4.jumpForJoy {
                                                                                    self.d5.jumpForJoy {
                                                                                        self.e1.jumpForJoy {
                                                                                            self.e2.jumpForJoy {
                                                                                                self.e3.jumpForJoy {
                                                                                                    self.e4.jumpForJoy {
                                                                                                        self.e5.jumpForJoy {
                                                                                                            self.f1.jumpForJoy {
                                                                                                                self.f2.jumpForJoy {
                                                                                                                    self.f3.jumpForJoy {
                                                                                                                        self.f4.jumpForJoy {
                                                                                                                            self.f5.jumpForJoy {
                                                                                                                                completion()
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - INCREMENT LETTER COUNTS
    private func incrementLetterCounts(guess: String, completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let answer = currentGame.answer else { completion(); return }

        for (letterIndex, letterCharacter) in guess.enumerated() {
            let letter = "\(letterCharacter)"
            
            // Handling Correct Guess Letters:
                // if the guess letter is the same as the answer's letter in that slot, mark it green
            if guess[letterIndex] == answer[letterIndex] {
                GameModel.shared.incrementGreenGuessLetter(letter)
            }
        }
        completion()
    }
    
    // MARK: - UPDATE LETTER VIEW
    private func updateHint(letterView: GridLetterView?, with guess: String?, at guessIndex: Int, animated: Bool, completion: @escaping () -> ()) {
        guard let currentGame = GameModel.shared.currentGame else { completion(); return }
        guard let answer = currentGame.answer else { completion(); return }
        if let guess = guess {
            letterView?.updateLetter(with: "\(guess.uppercased()[guessIndex])")
        }
        
        let guess = guess?.lowercased() ?? GameModel.shared.currentGuess.lowercased()
        let guessLetter = "\(guess[guessIndex])".lowercased()
        guard let answerLetterCount = GameModel.shared.answerLetterCounts[guessLetter] else { completion(); return }
        guard let guessLetterCount = GameModel.shared.guessLetterCounts[guessLetter] else { completion(); return }
        guard let yellowLetterCount = GameModel.shared.guessYellowLetterCounts[guessLetter] else { completion(); return }
        guard let greenLetterCount = GameModel.shared.guessGreenLetterCounts[guessLetter] else { completion(); return }

        // Handling Correct Guess Letters:
            // if the guess letter is the same as the answer's letter in that slot, mark it green
        if guess[guessIndex] == answer[guessIndex] {
            gridDelegate?.setKeyToGreen(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟩"
            letterView?.updateLetter(to: .green, animated: animated, completion: {
                completion()
            })
            
        // Handling Incorrect Guess Letters:
            // if the guess letter is not in the answer, make it gray
        } else if !answer.contains(guessLetter) {
            gridDelegate?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
            
        // Handling Guess Letter Overflow:
            // if there are more of the guess letter in the guess than in the answer...
            // it's either gray or yellow...
        } else if guessLetterCount > answerLetterCount {
            
            // if there is already the same number of confirmed green guess letters as in the answer...
            // it must be gray
            if greenLetterCount == answerLetterCount {
                gridDelegate?.setKeyToGray(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "⬜️"
                letterView?.updateLetter(to: .gray, animated: animated, completion: {
                    completion()
                })
                
            // else if there are less of the confirmed yellow guess letters than in the answer...
            // it must be yellow
            } else if yellowLetterCount < answerLetterCount  {
                GameModel.shared.incrementYellowGuessLetter(guessLetter)
                gridDelegate?.setKeyToYellow(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "🟨"
                letterView?.updateLetter(to: .yellow, animated: animated, completion: {
                    completion()
                })
                
            // else there are more or the same amount of the confirmed yellow guess letters than in the answer
            } else {
                gridDelegate?.setKeyToGray(for: guessLetter)
                GameModel.shared.lastGuessInEmojis += "⬜️"
                letterView?.updateLetter(to: .gray, animated: animated, completion: {
                    completion()
                })
            }

        // Handling Guess Letter Scarcity:
            // if there are more of the guess letter in the answer than in the guess...
        } else if answerLetterCount > yellowLetterCount {
            GameModel.shared.incrementYellowGuessLetter(guessLetter)
            gridDelegate?.setKeyToYellow(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "🟨"
            letterView?.updateLetter(to: .yellow, animated: animated, completion: {
                completion()
            })
        } else if answerLetterCount == yellowLetterCount {
            gridDelegate?.setKeyToGray(for: guessLetter)
            GameModel.shared.lastGuessInEmojis += "⬜️"
            letterView?.updateLetter(to: .gray, animated: animated, completion: {
                completion()
            })
        }
    }
    
    // MARK: - UPDATE GRID
    private func updateA1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateA2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateA3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateA4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateA5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: a5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateB1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateB2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateB3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateB4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateB5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: b5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateC1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateC2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateC3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateC4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateC5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: c5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateD1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateD2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateD3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateD4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateD5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: d5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateE1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateE2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateE3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateE4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateE5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: e5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    private func updateF1(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f1, with: guess, at: 0, animated: animated) {
            completion()
        }
    }
    
    private func updateF2(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f2, with: guess, at: 1, animated: animated) {
            completion()
        }
    }
    
    private func updateF3(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f3, with: guess, at: 2, animated: animated) {
            completion()
        }
    }
    
    private func updateF4(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f4, with: guess, at: 3, animated: animated) {
            completion()
        }
    }
    
    private func updateF5(for guess: String? = nil, animated: Bool = true, completion: @escaping () -> ()) {
        updateHint(letterView: f5, with: guess, at: 4, animated: animated) {
            completion()
        }
    }
    
    // MARK: - SHAKE CURRENT ROW
    private func shakeCurrentRow() {
        guard let currentGame = GameModel.shared.currentGame else { return }
        guard let guessNumber = currentGame.guessNumber else { return }
        
        switch guessNumber {
        case .first:
            for letterView in [a1, a2, a3, a4, a5] {
                letterView.shake()
            }
        case .second:
            for letterView in [b1, b2, b3, b4, b5] {
                letterView.shake()
            }
        case .third:
            for letterView in [c1, c2, c3, c4, c5] {
                letterView.shake()
            }
        case .fourth:
            for letterView in [d1, d2, d3, d4, d5] {
                letterView.shake()
            }
        case .fifth:
            for letterView in [e1, e2, e3, e4, e5] {
                letterView.shake()
            }
        case .sixth:
            for letterView in [f1, f2, f3, f4, f5] {
                letterView.shake()
            }
        }
    }
    
    // MARK: - WORD IS IN LIST
    func wordIsInList() -> Bool {
        let words: Words = GameModel.shared.load("words.json")
        guard words.list.contains(GameModel.shared.currentGuess.lowercased()) else {
            gridDelegate?.showNotInWordListView()
            shakeCurrentRow()
            return false
        }
        if let guessNumber = GameModel.shared.currentGame?.guessNumber, guessNumber == .first {
            GameModel.shared.setAnswerRandomly()
        }
        return true
    }
}
