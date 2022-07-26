//
//  KeyboardView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/25/22.
//

import UIKit

protocol KeyboardDelegate {
    func didTapLetter(_ letter: String)
    func didTapEnter()
    func didTapBackspace()
}

class KeyboardView: UIView {
    
    // MARK: - Properties
    var keyboardDelegate: KeyboardDelegate!
        
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func addSubviews() {
        let padding: CGFloat = 5
        let letterSize = CGSize(width: (frame.width / 10) - (padding * 1.5), height: 48)
        let enterWidth: CGFloat = letterSize.width * 1.5
        let keyboardWidth: CGFloat = (letterSize.width * 10) + (padding * 9)
        let keyboardOriginX: CGFloat = (frame.width / 2) - (keyboardWidth / 2)
        
        // first row
        let q = KeyboardLetterView(
            "Q", frame: CGRect(x: keyboardOriginX, y: 0, width: letterSize.width, height: letterSize.height))
        q.letterDelegate = self
        let w = KeyboardLetterView(
            "W", frame: CGRect(x: keyboardOriginX + letterSize.width + padding, y: 0, width: letterSize.width, height: letterSize.height))
        w.letterDelegate = self
        let e = KeyboardLetterView(
            "E", frame: CGRect(x: keyboardOriginX + (letterSize.width * 2) + (padding * 2), y: 0, width: letterSize.width, height: letterSize.height))
        e.letterDelegate = self
        let r = KeyboardLetterView(
            "R", frame: CGRect(x: keyboardOriginX + (letterSize.width * 3) + (padding * 3), y: 0, width: letterSize.width, height: letterSize.height))
        r.letterDelegate = self
        let t = KeyboardLetterView(
            "T", frame: CGRect(x: keyboardOriginX + (letterSize.width * 4) + (padding * 4), y: 0, width: letterSize.width, height: letterSize.height))
        t.letterDelegate = self
        let y = KeyboardLetterView(
            "Y", frame: CGRect(x: keyboardOriginX + (letterSize.width * 5) + (padding * 5), y: 0, width: letterSize.width, height: letterSize.height))
        y.letterDelegate = self
        let u = KeyboardLetterView(
            "U", frame: CGRect(x: keyboardOriginX + (letterSize.width * 6) + (padding * 6), y: 0, width: letterSize.width, height: letterSize.height))
        u.letterDelegate = self
        let i = KeyboardLetterView(
            "I", frame: CGRect(x: keyboardOriginX + (letterSize.width * 7) + (padding * 7), y: 0, width: letterSize.width, height: letterSize.height))
        i.letterDelegate = self
        let o = KeyboardLetterView(
            "O", frame: CGRect(x: keyboardOriginX + (letterSize.width * 8) + (padding * 8), y: 0, width: letterSize.width, height: letterSize.height))
        o.letterDelegate = self
        let p = KeyboardLetterView(
            "P", frame: CGRect(x: keyboardOriginX + (letterSize.width * 9) + (padding * 9), y: 0, width: letterSize.width, height: letterSize.height))
        p.letterDelegate = self
        
        // second row
        let a = KeyboardLetterView(
            "A", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        a.letterDelegate = self
        let s = KeyboardLetterView(
            "S", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + letterSize.width + padding, y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        s.letterDelegate = self
        let d = KeyboardLetterView(
            "D", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 2) + (padding * 2), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        d.letterDelegate = self
        let f = KeyboardLetterView(
            "F", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 3) + (padding * 3), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        f.letterDelegate = self
        let g = KeyboardLetterView(
            "G", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 4) + (padding * 4), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        g.letterDelegate = self
        let h = KeyboardLetterView(
            "H", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 5) + (padding * 5), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        h.letterDelegate = self
        let j = KeyboardLetterView(
            "J", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 6) + (padding * 6), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        j.letterDelegate = self
        let k = KeyboardLetterView(
            "K", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 7) + (padding * 7), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        k.letterDelegate = self
        let l = KeyboardLetterView(
            "L", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 8) + (padding * 8), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        l.letterDelegate = self
        
        // third row
        let enter = KeyboardLetterView(
            "ENTER", frame: CGRect(x: keyboardOriginX, y: (letterSize.height * 2) + (padding * 2), width: enterWidth, height: letterSize.height))
        enter.letterDelegate = self
        let z = KeyboardLetterView(
            "Z", frame: CGRect(x: keyboardOriginX + enterWidth + padding, y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        z.letterDelegate = self
        let x = KeyboardLetterView(
            "X", frame: CGRect(x: keyboardOriginX + enterWidth + letterSize.width + (padding * 2), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        x.letterDelegate = self
        let c = KeyboardLetterView(
            "C", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 2) + (padding * 3), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        c.letterDelegate = self
        let v = KeyboardLetterView(
            "V", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 3) + (padding * 4), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        v.letterDelegate = self
        let b = KeyboardLetterView(
            "B", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 4) + (padding * 5), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        b.letterDelegate = self
        let n = KeyboardLetterView(
            "N", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 5) + (padding * 6), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        n.letterDelegate = self
        let m = KeyboardLetterView(
            "M", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 6) + (padding * 7), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        m.letterDelegate = self
        let backspace = KeyboardLetterView(
            "⌫", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 7) + (padding * 8), y: (letterSize.height * 2) + (padding * 2), width: enterWidth, height: letterSize.height))
        backspace.letterDelegate = self
        
        for letter in [q, w, e, r, t, y, u, i, o, p, a, s, d, f, g, h, j, k, l, enter, z, x, c, v, b, n, m, backspace] {
            addSubview(letter)
        }
    }
}

extension KeyboardView: LetterDelegate {
    func didTapLetter(_ letter: String) {
        keyboardDelegate.didTapLetter(letter)
    }
    
    func didTapEnter() {
        keyboardDelegate.didTapEnter()
    }
    
    func didTapBackspace() {
        keyboardDelegate.didTapBackspace()
    }
}
