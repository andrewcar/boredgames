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
    var q: KeyboardLetterView?
    var w: KeyboardLetterView?
    var e: KeyboardLetterView?
    var r: KeyboardLetterView?
    var t: KeyboardLetterView?
    var y: KeyboardLetterView?
    var u: KeyboardLetterView?
    var i: KeyboardLetterView?
    var o: KeyboardLetterView?
    var p: KeyboardLetterView?
    var a: KeyboardLetterView?
    var s: KeyboardLetterView?
    var d: KeyboardLetterView?
    var f: KeyboardLetterView?
    var g: KeyboardLetterView?
    var h: KeyboardLetterView?
    var j: KeyboardLetterView?
    var k: KeyboardLetterView?
    var l: KeyboardLetterView?
    var z: KeyboardLetterView?
    var x: KeyboardLetterView?
    var c: KeyboardLetterView?
    var v: KeyboardLetterView?
    var b: KeyboardLetterView?
    var n: KeyboardLetterView?
    var m: KeyboardLetterView?
    var showing: Bool = true
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func setKeyToGreen(for letter: String) {
        switch letter {
        case "a":
            a?.updateColors(for: .green)
        case "b":
            b?.updateColors(for: .green)
        case "c":
            c?.updateColors(for: .green)
        case "d":
            d?.updateColors(for: .green)
        case "e":
            e?.updateColors(for: .green)
        case "f":
            f?.updateColors(for: .green)
        case "g":
            g?.updateColors(for: .green)
        case "h":
            h?.updateColors(for: .green)
        case "i":
            i?.updateColors(for: .green)
        case "j":
            j?.updateColors(for: .green)
        case "k":
            k?.updateColors(for: .green)
        case "l":
            l?.updateColors(for: .green)
        case "m":
            m?.updateColors(for: .green)
        case "n":
            n?.updateColors(for: .green)
        case "o":
            o?.updateColors(for: .green)
        case "p":
            p?.updateColors(for: .green)
        case "q":
            q?.updateColors(for: .green)
        case "r":
            r?.updateColors(for: .green)
        case "s":
            s?.updateColors(for: .green)
        case "t":
            t?.updateColors(for: .green)
        case "u":
            u?.updateColors(for: .green)
        case "v":
            v?.updateColors(for: .green)
        case "w":
            w?.updateColors(for: .green)
        case "x":
            x?.updateColors(for: .green)
        case "y":
            y?.updateColors(for: .green)
        case "z":
            z?.updateColors(for: .green)
        default: ()
        }
    }
    
    func setKeyToYellow(for letter: String) {
        switch letter {
        case "a":
            guard let key = a, key.letterState != .green else { return }
            a?.updateColors(for: .yellow)
        case "b":
            guard let key = b, key.letterState != .green else { return }
            b?.updateColors(for: .yellow)
        case "c":
            guard let key = c, key.letterState != .green else { return }
            c?.updateColors(for: .yellow)
        case "d":
            guard let key = d, key.letterState != .green else { return }
            d?.updateColors(for: .yellow)
        case "e":
            guard let key = e, key.letterState != .green else { return }
            e?.updateColors(for: .yellow)
        case "f":
            guard let key = f, key.letterState != .green else { return }
            f?.updateColors(for: .yellow)
        case "g":
            guard let key = g, key.letterState != .green else { return }
            g?.updateColors(for: .yellow)
        case "h":
            guard let key = h, key.letterState != .green else { return }
            h?.updateColors(for: .yellow)
        case "i":
            guard let key = i, key.letterState != .green else { return }
            i?.updateColors(for: .yellow)
        case "j":
            guard let key = j, key.letterState != .green else { return }
            j?.updateColors(for: .yellow)
        case "k":
            guard let key = k, key.letterState != .green else { return }
            k?.updateColors(for: .yellow)
        case "l":
            guard let key = l, key.letterState != .green else { return }
            l?.updateColors(for: .yellow)
        case "m":
            guard let key = m, key.letterState != .green else { return }
            m?.updateColors(for: .yellow)
        case "n":
            guard let key = n, key.letterState != .green else { return }
            n?.updateColors(for: .yellow)
        case "o":
            guard let key = o, key.letterState != .green else { return }
            o?.updateColors(for: .yellow)
        case "p":
            guard let key = p, key.letterState != .green else { return }
            p?.updateColors(for: .yellow)
        case "q":
            guard let key = q, key.letterState != .green else { return }
            q?.updateColors(for: .yellow)
        case "r":
            guard let key = r, key.letterState != .green else { return }
            r?.updateColors(for: .yellow)
        case "s":
            guard let key = s, key.letterState != .green else { return }
            s?.updateColors(for: .yellow)
        case "t":
            guard let key = t, key.letterState != .green else { return }
            t?.updateColors(for: .yellow)
        case "u":
            guard let key = u, key.letterState != .green else { return }
            u?.updateColors(for: .yellow)
        case "v":
            guard let key = v, key.letterState != .green else { return }
            v?.updateColors(for: .yellow)
        case "w":
            guard let key = w, key.letterState != .green else { return }
            w?.updateColors(for: .yellow)
        case "x":
            guard let key = x, key.letterState != .green else { return }
            x?.updateColors(for: .yellow)
        case "y":
            guard let key = y, key.letterState != .green else { return }
            y?.updateColors(for: .yellow)
        case "z":
            guard let key = z, key.letterState != .green else { return }
            z?.updateColors(for: .yellow)
        default: ()
        }
    }
    
    func setKeyToGray(for letter: String) {
        switch letter {
        case "a":
            guard let key = a, key.letterState != .green, key.letterState != .yellow else { return }
            a?.updateColors(for: .gray)
        case "b":
            guard let key = b, key.letterState != .green, key.letterState != .yellow else { return }
            b?.updateColors(for: .gray)
        case "c":
            guard let key = c, key.letterState != .green, key.letterState != .yellow else { return }
            c?.updateColors(for: .gray)
        case "d":
            guard let key = d, key.letterState != .green, key.letterState != .yellow else { return }
            d?.updateColors(for: .gray)
        case "e":
            guard let key = e, key.letterState != .green, key.letterState != .yellow else { return }
            e?.updateColors(for: .gray)
        case "f":
            guard let key = f, key.letterState != .green, key.letterState != .yellow else { return }
            f?.updateColors(for: .gray)
        case "g":
            guard let key = g, key.letterState != .green, key.letterState != .yellow else { return }
            g?.updateColors(for: .gray)
        case "h":
            guard let key = h, key.letterState != .green, key.letterState != .yellow else { return }
            h?.updateColors(for: .gray)
        case "i":
            guard let key = i, key.letterState != .green, key.letterState != .yellow else { return }
            i?.updateColors(for: .gray)
        case "j":
            guard let key = j, key.letterState != .green, key.letterState != .yellow else { return }
            j?.updateColors(for: .gray)
        case "k":
            guard let key = k, key.letterState != .green, key.letterState != .yellow else { return }
            k?.updateColors(for: .gray)
        case "l":
            guard let key = l, key.letterState != .green, key.letterState != .yellow else { return }
            l?.updateColors(for: .gray)
        case "m":
            guard let key = m, key.letterState != .green, key.letterState != .yellow else { return }
            m?.updateColors(for: .gray)
        case "n":
            guard let key = n, key.letterState != .green, key.letterState != .yellow else { return }
            n?.updateColors(for: .gray)
        case "o":
            guard let key = o, key.letterState != .green, key.letterState != .yellow else { return }
            o?.updateColors(for: .gray)
        case "p":
            guard let key = p, key.letterState != .green, key.letterState != .yellow else { return }
            p?.updateColors(for: .gray)
        case "q":
            guard let key = q, key.letterState != .green, key.letterState != .yellow else { return }
            q?.updateColors(for: .gray)
        case "r":
            guard let key = r, key.letterState != .green, key.letterState != .yellow else { return }
            r?.updateColors(for: .gray)
        case "s":
            guard let key = s, key.letterState != .green, key.letterState != .yellow else { return }
            s?.updateColors(for: .gray)
        case "t":
            guard let key = t, key.letterState != .green, key.letterState != .yellow else { return }
            t?.updateColors(for: .gray)
        case "u":
            guard let key = u, key.letterState != .green, key.letterState != .yellow else { return }
            u?.updateColors(for: .gray)
        case "v":
            guard let key = v, key.letterState != .green, key.letterState != .yellow else { return }
            v?.updateColors(for: .gray)
        case "w":
            guard let key = w, key.letterState != .green, key.letterState != .yellow else { return }
            w?.updateColors(for: .gray)
        case "x":
            guard let key = x, key.letterState != .green, key.letterState != .yellow else { return }
            x?.updateColors(for: .gray)
        case "y":
            guard let key = y, key.letterState != .green, key.letterState != .yellow else { return }
            y?.updateColors(for: .gray)
        case "z":
            guard let key = z, key.letterState != .green, key.letterState != .yellow else { return }
            z?.updateColors(for: .gray)
        default: ()
        }
    }
    
    func resetKeyboard() {
        for letter in [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z] {
            letter?.updateColors(for: .blank)
        }
        isUserInteractionEnabled = true
    }
    
    
    // MARK: - Private Methods
    private func addSubviews() {
        let padding: CGFloat = 5
        let letterSize = CGSize(width: (frame.width / 10) - (padding * 1.5), height: 48)
        let enterWidth: CGFloat = letterSize.width * 1.5
        let keyboardWidth: CGFloat = (letterSize.width * 10) + (padding * 9)
        let keyboardOriginX: CGFloat = (frame.width / 2) - (keyboardWidth / 2)
        
        // first row
        q = KeyboardLetterView(
            "Q", frame: CGRect(x: keyboardOriginX, y: 0, width: letterSize.width, height: letterSize.height))
        q?.letterDelegate = self
        w = KeyboardLetterView(
            "W", frame: CGRect(x: keyboardOriginX + letterSize.width + padding, y: 0, width: letterSize.width, height: letterSize.height))
        w?.letterDelegate = self
        e = KeyboardLetterView(
            "E", frame: CGRect(x: keyboardOriginX + (letterSize.width * 2) + (padding * 2), y: 0, width: letterSize.width, height: letterSize.height))
        e?.letterDelegate = self
        r = KeyboardLetterView(
            "R", frame: CGRect(x: keyboardOriginX + (letterSize.width * 3) + (padding * 3), y: 0, width: letterSize.width, height: letterSize.height))
        r?.letterDelegate = self
        t = KeyboardLetterView(
            "T", frame: CGRect(x: keyboardOriginX + (letterSize.width * 4) + (padding * 4), y: 0, width: letterSize.width, height: letterSize.height))
        t?.letterDelegate = self
        y = KeyboardLetterView(
            "Y", frame: CGRect(x: keyboardOriginX + (letterSize.width * 5) + (padding * 5), y: 0, width: letterSize.width, height: letterSize.height))
        y?.letterDelegate = self
        u = KeyboardLetterView(
            "U", frame: CGRect(x: keyboardOriginX + (letterSize.width * 6) + (padding * 6), y: 0, width: letterSize.width, height: letterSize.height))
        u?.letterDelegate = self
        i = KeyboardLetterView(
            "I", frame: CGRect(x: keyboardOriginX + (letterSize.width * 7) + (padding * 7), y: 0, width: letterSize.width, height: letterSize.height))
        i?.letterDelegate = self
        o = KeyboardLetterView(
            "O", frame: CGRect(x: keyboardOriginX + (letterSize.width * 8) + (padding * 8), y: 0, width: letterSize.width, height: letterSize.height))
        o?.letterDelegate = self
        p = KeyboardLetterView(
            "P", frame: CGRect(x: keyboardOriginX + (letterSize.width * 9) + (padding * 9), y: 0, width: letterSize.width, height: letterSize.height))
        p?.letterDelegate = self
        
        // second row
        a = KeyboardLetterView(
            "A", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        a?.letterDelegate = self
        s = KeyboardLetterView(
            "S", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + letterSize.width + padding, y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        s?.letterDelegate = self
        d = KeyboardLetterView(
            "D", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 2) + (padding * 2), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        d?.letterDelegate = self
        f = KeyboardLetterView(
            "F", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 3) + (padding * 3), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        f?.letterDelegate = self
        g = KeyboardLetterView(
            "G", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 4) + (padding * 4), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        g?.letterDelegate = self
        h = KeyboardLetterView(
            "H", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 5) + (padding * 5), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        h?.letterDelegate = self
        j = KeyboardLetterView(
            "J", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 6) + (padding * 6), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        j?.letterDelegate = self
        k = KeyboardLetterView(
            "K", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 7) + (padding * 7), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        k?.letterDelegate = self
        l = KeyboardLetterView(
            "L", frame: CGRect(x: keyboardOriginX + (letterSize.width / 2) + (letterSize.width * 8) + (padding * 8), y: letterSize.height + padding, width: letterSize.width, height: letterSize.height))
        l?.letterDelegate = self
        
        // third row
        let enter = KeyboardLetterView(
            "ENTER", frame: CGRect(x: keyboardOriginX, y: (letterSize.height * 2) + (padding * 2), width: enterWidth, height: letterSize.height))
        enter.letterDelegate = self
        z = KeyboardLetterView(
            "Z", frame: CGRect(x: keyboardOriginX + enterWidth + padding, y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        z?.letterDelegate = self
        x = KeyboardLetterView(
            "X", frame: CGRect(x: keyboardOriginX + enterWidth + letterSize.width + (padding * 2), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        x?.letterDelegate = self
        c = KeyboardLetterView(
            "C", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 2) + (padding * 3), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        c?.letterDelegate = self
        v = KeyboardLetterView(
            "V", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 3) + (padding * 4), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        v?.letterDelegate = self
        b = KeyboardLetterView(
            "B", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 4) + (padding * 5), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        b?.letterDelegate = self
        n = KeyboardLetterView(
            "N", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 5) + (padding * 6), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        n?.letterDelegate = self
        m = KeyboardLetterView(
            "M", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 6) + (padding * 7), y: (letterSize.height * 2) + (padding * 2), width: letterSize.width, height: letterSize.height))
        m?.letterDelegate = self
        let backspace = KeyboardLetterView(
            "⌫", frame: CGRect(x: keyboardOriginX + enterWidth + (letterSize.width * 7) + (padding * 8), y: (letterSize.height * 2) + (padding * 2), width: enterWidth, height: letterSize.height))
        backspace.letterDelegate = self
        
        for letter in [q, w, e, r, t, y, u, i, o, p, a, s, d, f, g, h, j, k, l, enter, z, x, c, v, b, n, m, backspace] {
            if let letter = letter {
                addSubview(letter)
            }
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
