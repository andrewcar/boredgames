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
    var q = KeyboardLetterView("Q", frame: .zero)
    var w = KeyboardLetterView("W", frame: .zero)
    var e = KeyboardLetterView("E", frame: .zero)
    var r = KeyboardLetterView("R", frame: .zero)
    var t = KeyboardLetterView("T", frame: .zero)
    var y = KeyboardLetterView("Y", frame: .zero)
    var u = KeyboardLetterView("U", frame: .zero)
    var i = KeyboardLetterView("I", frame: .zero)
    var o = KeyboardLetterView("O", frame: .zero)
    var p = KeyboardLetterView("P", frame: .zero)
    var a = KeyboardLetterView("A", frame: .zero)
    var s = KeyboardLetterView("S", frame: .zero)
    var d = KeyboardLetterView("D", frame: .zero)
    var f = KeyboardLetterView("F", frame: .zero)
    var g = KeyboardLetterView("G", frame: .zero)
    var h = KeyboardLetterView("H", frame: .zero)
    var j = KeyboardLetterView("J", frame: .zero)
    var k = KeyboardLetterView("K", frame: .zero)
    var l = KeyboardLetterView("L", frame: .zero)
    var enter = KeyboardLetterView("ENTER", frame: .zero)
    var z = KeyboardLetterView("Z", frame: .zero)
    var x = KeyboardLetterView("X", frame: .zero)
    var c = KeyboardLetterView("C", frame: .zero)
    var v = KeyboardLetterView("V", frame: .zero)
    var b = KeyboardLetterView("B", frame: .zero)
    var n = KeyboardLetterView("N", frame: .zero)
    var m = KeyboardLetterView("M", frame: .zero)
    var backspace = KeyboardLetterView("⌫", frame: .zero)
    var showing: Bool = true
    var portraitConstraints: [NSLayoutConstraint] = []
    var landscapeConstraints: [NSLayoutConstraint] = []
    
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
    func updateSubviews(isLandscape: Bool) {
        if isLandscape {
            activateLandscapeConstraints()
        } else {
            activatePortraitConstraints()
        }
    }
    
    func setKeyToGreen(for letter: String) {
        switch letter {
        case "a":
            a.updateColors(for: .green)
        case "b":
            b.updateColors(for: .green)
        case "c":
            c.updateColors(for: .green)
        case "d":
            d.updateColors(for: .green)
        case "e":
            e.updateColors(for: .green)
        case "f":
            f.updateColors(for: .green)
        case "g":
            g.updateColors(for: .green)
        case "h":
            h.updateColors(for: .green)
        case "i":
            i.updateColors(for: .green)
        case "j":
            j.updateColors(for: .green)
        case "k":
            k.updateColors(for: .green)
        case "l":
            l.updateColors(for: .green)
        case "m":
            m.updateColors(for: .green)
        case "n":
            n.updateColors(for: .green)
        case "o":
            o.updateColors(for: .green)
        case "p":
            p.updateColors(for: .green)
        case "q":
            q.updateColors(for: .green)
        case "r":
            r.updateColors(for: .green)
        case "s":
            s.updateColors(for: .green)
        case "t":
            t.updateColors(for: .green)
        case "u":
            u.updateColors(for: .green)
        case "v":
            v.updateColors(for: .green)
        case "w":
            w.updateColors(for: .green)
        case "x":
            x.updateColors(for: .green)
        case "y":
            y.updateColors(for: .green)
        case "z":
            z.updateColors(for: .green)
        default: ()
        }
    }
    
    func setKeyToYellow(for letter: String) {
        switch letter {
        case "a":
            guard a.letterState != .green else { return }
            a.updateColors(for: .yellow)
        case "b":
            guard b.letterState != .green else { return }
            b.updateColors(for: .yellow)
        case "c":
            guard c.letterState != .green else { return }
            c.updateColors(for: .yellow)
        case "d":
            guard d.letterState != .green else { return }
            d.updateColors(for: .yellow)
        case "e":
            guard e.letterState != .green else { return }
            e.updateColors(for: .yellow)
        case "f":
            guard f.letterState != .green else { return }
            f.updateColors(for: .yellow)
        case "g":
            guard g.letterState != .green else { return }
            g.updateColors(for: .yellow)
        case "h":
            guard h.letterState != .green else { return }
            h.updateColors(for: .yellow)
        case "i":
            guard i.letterState != .green else { return }
            i.updateColors(for: .yellow)
        case "j":
            guard j.letterState != .green else { return }
            j.updateColors(for: .yellow)
        case "k":
            guard k.letterState != .green else { return }
            k.updateColors(for: .yellow)
        case "l":
            guard l.letterState != .green else { return }
            l.updateColors(for: .yellow)
        case "m":
            guard m.letterState != .green else { return }
            m.updateColors(for: .yellow)
        case "n":
            guard y.letterState != .green else { return }
            n.updateColors(for: .yellow)
        case "o":
            guard o.letterState != .green else { return }
            o.updateColors(for: .yellow)
        case "p":
            guard p.letterState != .green else { return }
            p.updateColors(for: .yellow)
        case "q":
            guard q.letterState != .green else { return }
            q.updateColors(for: .yellow)
        case "r":
            guard r.letterState != .green else { return }
            r.updateColors(for: .yellow)
        case "s":
            guard s.letterState != .green else { return }
            s.updateColors(for: .yellow)
        case "t":
            guard t.letterState != .green else { return }
            t.updateColors(for: .yellow)
        case "u":
            guard u.letterState != .green else { return }
            u.updateColors(for: .yellow)
        case "v":
            guard v.letterState != .green else { return }
            v.updateColors(for: .yellow)
        case "w":
            guard w.letterState != .green else { return }
            w.updateColors(for: .yellow)
        case "x":
            guard x.letterState != .green else { return }
            x.updateColors(for: .yellow)
        case "y":
            guard y.letterState != .green else { return }
            y.updateColors(for: .yellow)
        case "z":
            guard z.letterState != .green else { return }
            z.updateColors(for: .yellow)
        default: ()
        }
    }
    
    func setKeyToGray(for letter: String) {
        switch letter {
        case "a":
            guard a.letterState != .green, a.letterState != .yellow else { return }
            a.updateColors(for: .gray)
        case "b":
            guard b.letterState != .green, b.letterState != .yellow else { return }
            b.updateColors(for: .gray)
        case "c":
            guard c.letterState != .green, c.letterState != .yellow else { return }
            c.updateColors(for: .gray)
        case "d":
            guard d.letterState != .green, d.letterState != .yellow else { return }
            d.updateColors(for: .gray)
        case "e":
            guard e.letterState != .green, e.letterState != .yellow else { return }
            e.updateColors(for: .gray)
        case "f":
            guard f.letterState != .green, f.letterState != .yellow else { return }
            f.updateColors(for: .gray)
        case "g":
            guard g.letterState != .green, g.letterState != .yellow else { return }
            g.updateColors(for: .gray)
        case "h":
            guard h.letterState != .green, h.letterState != .yellow else { return }
            h.updateColors(for: .gray)
        case "i":
            guard i.letterState != .green, i.letterState != .yellow else { return }
            i.updateColors(for: .gray)
        case "j":
            guard j.letterState != .green, j.letterState != .yellow else { return }
            j.updateColors(for: .gray)
        case "k":
            guard k.letterState != .green, k.letterState != .yellow else { return }
            k.updateColors(for: .gray)
        case "l":
            guard l.letterState != .green, l.letterState != .yellow else { return }
            l.updateColors(for: .gray)
        case "m":
            guard m.letterState != .green, m.letterState != .yellow else { return }
            m.updateColors(for: .gray)
        case "n":
            guard n.letterState != .green, n.letterState != .yellow else { return }
            n.updateColors(for: .gray)
        case "o":
            guard o.letterState != .green, o.letterState != .yellow else { return }
            o.updateColors(for: .gray)
        case "p":
            guard p.letterState != .green, p.letterState != .yellow else { return }
            p.updateColors(for: .gray)
        case "q":
            guard q.letterState != .green, q.letterState != .yellow else { return }
            q.updateColors(for: .gray)
        case "r":
            guard r.letterState != .green, r.letterState != .yellow else { return }
            r.updateColors(for: .gray)
        case "s":
            guard s.letterState != .green, s.letterState != .yellow else { return }
            s.updateColors(for: .gray)
        case "t":
            guard t.letterState != .green, t.letterState != .yellow else { return }
            t.updateColors(for: .gray)
        case "u":
            guard u.letterState != .green, u.letterState != .yellow else { return }
            u.updateColors(for: .gray)
        case "v":
            guard v.letterState != .green, v.letterState != .yellow else { return }
            v.updateColors(for: .gray)
        case "w":
            guard w.letterState != .green, w.letterState != .yellow else { return }
            w.updateColors(for: .gray)
        case "x":
            guard x.letterState != .green, x.letterState != .yellow else { return }
            x.updateColors(for: .gray)
        case "y":
            guard y.letterState != .green, y.letterState != .yellow else { return }
            y.updateColors(for: .gray)
        case "z":
            guard z.letterState != .green, z.letterState != .yellow else { return }
            z.updateColors(for: .gray)
        default: ()
        }
    }
    
    func resetKeyboard() {
        for letter in [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z] {
            letter.updateColors(for: .blank)
        }
        isUserInteractionEnabled = true
    }
    
    
    // MARK: - Private Methods
    private func addSubviews() {
        let firstRow = [q, w, e, r, t, y, u, i, o, p]
        let secondRow = [a, s, d, f, g, h, j, k, l]
        let thirdRow = [enter, z, x, c, v, b, n, m, backspace]
        let allLetters = firstRow + secondRow + thirdRow
        
        for letterView in allLetters {
            letterView.translatesAutoresizingMaskIntoConstraints = false
            letterView.letterDelegate = self
            addSubview(letterView)
        }
        activatePortraitConstraints()
    }
    
    // MARK: - ACTIVATE PORTRAIT CONSTRAINTS
    func activatePortraitConstraints() {
        NSLayoutConstraint.deactivate(portraitConstraints)
        NSLayoutConstraint.deactivate(landscapeConstraints)
        let padding = Frame.Keyboard.portraitLetterPadding
        let letterSize = Frame.Keyboard.portraitLetterSize
        let enterWidth = letterSize.width * 1.5
        portraitConstraints = [
            
            // first row
            q.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            q.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            q.widthAnchor.constraint(equalToConstant: letterSize.width),
            q.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            w.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            w.leadingAnchor.constraint(equalTo: q.trailingAnchor, constant: padding),
            w.widthAnchor.constraint(equalToConstant: letterSize.width),
            w.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            e.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            e.leadingAnchor.constraint(equalTo: w.trailingAnchor, constant: padding),
            e.widthAnchor.constraint(equalToConstant: letterSize.width),
            e.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            r.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            r.leadingAnchor.constraint(equalTo: e.trailingAnchor, constant: padding),
            r.widthAnchor.constraint(equalToConstant: letterSize.width),
            r.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            t.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            t.leadingAnchor.constraint(equalTo: r.trailingAnchor, constant: padding),
            t.widthAnchor.constraint(equalToConstant: letterSize.width),
            t.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            y.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            y.leadingAnchor.constraint(equalTo: t.trailingAnchor, constant: padding),
            y.widthAnchor.constraint(equalToConstant: letterSize.width),
            y.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            u.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            u.leadingAnchor.constraint(equalTo: y.trailingAnchor, constant: padding),
            u.widthAnchor.constraint(equalToConstant: letterSize.width),
            u.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            i.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            i.leadingAnchor.constraint(equalTo: u.trailingAnchor, constant: padding),
            i.widthAnchor.constraint(equalToConstant: letterSize.width),
            i.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            o.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            o.leadingAnchor.constraint(equalTo: i.trailingAnchor, constant: padding),
            o.widthAnchor.constraint(equalToConstant: letterSize.width),
            o.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            p.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            p.leadingAnchor.constraint(equalTo: o.trailingAnchor, constant: padding),
            p.widthAnchor.constraint(equalToConstant: letterSize.width),
            p.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            // second row
            a.topAnchor.constraint(equalTo: q.bottomAnchor, constant: padding),
            a.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding + letterSize.width / 2),
            a.widthAnchor.constraint(equalToConstant: letterSize.width),
            a.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            s.topAnchor.constraint(equalTo: w.bottomAnchor, constant: padding),
            s.leadingAnchor.constraint(equalTo: a.trailingAnchor, constant: padding),
            s.widthAnchor.constraint(equalToConstant: letterSize.width),
            s.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            d.topAnchor.constraint(equalTo: e.bottomAnchor, constant: padding),
            d.leadingAnchor.constraint(equalTo: s.trailingAnchor, constant: padding),
            d.widthAnchor.constraint(equalToConstant: letterSize.width),
            d.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            f.topAnchor.constraint(equalTo: r.bottomAnchor, constant: padding),
            f.leadingAnchor.constraint(equalTo: d.trailingAnchor, constant: padding),
            f.widthAnchor.constraint(equalToConstant: letterSize.width),
            f.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            g.topAnchor.constraint(equalTo: t.bottomAnchor, constant: padding),
            g.leadingAnchor.constraint(equalTo: f.trailingAnchor, constant: padding),
            g.widthAnchor.constraint(equalToConstant: letterSize.width),
            g.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            h.topAnchor.constraint(equalTo: y.bottomAnchor, constant: padding),
            h.leadingAnchor.constraint(equalTo: g.trailingAnchor, constant: padding),
            h.widthAnchor.constraint(equalToConstant: letterSize.width),
            h.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            j.topAnchor.constraint(equalTo: u.bottomAnchor, constant: padding),
            j.leadingAnchor.constraint(equalTo: h.trailingAnchor, constant: padding),
            j.widthAnchor.constraint(equalToConstant: letterSize.width),
            j.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            k.topAnchor.constraint(equalTo: i.bottomAnchor, constant: padding),
            k.leadingAnchor.constraint(equalTo: j.trailingAnchor, constant: padding),
            k.widthAnchor.constraint(equalToConstant: letterSize.width),
            k.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            l.topAnchor.constraint(equalTo: o.bottomAnchor, constant: padding),
            l.leadingAnchor.constraint(equalTo: k.trailingAnchor, constant: padding),
            l.widthAnchor.constraint(equalToConstant: letterSize.width),
            l.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            // third row
            enter.topAnchor.constraint(equalTo: a.bottomAnchor, constant: padding),
            enter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Keyboard.landscapeEnterXOffset),
            enter.widthAnchor.constraint(equalToConstant: enterWidth),
            enter.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            z.topAnchor.constraint(equalTo: a.bottomAnchor, constant: padding),
            z.leadingAnchor.constraint(equalTo: enter.trailingAnchor, constant: padding),
            z.widthAnchor.constraint(equalToConstant: letterSize.width),
            z.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            x.topAnchor.constraint(equalTo: s.bottomAnchor, constant: padding),
            x.leadingAnchor.constraint(equalTo: z.trailingAnchor, constant: padding),
            x.widthAnchor.constraint(equalToConstant: letterSize.width),
            x.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            c.topAnchor.constraint(equalTo: d.bottomAnchor, constant: padding),
            c.leadingAnchor.constraint(equalTo: x.trailingAnchor, constant: padding),
            c.widthAnchor.constraint(equalToConstant: letterSize.width),
            c.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            v.topAnchor.constraint(equalTo: f.bottomAnchor, constant: padding),
            v.leadingAnchor.constraint(equalTo: c.trailingAnchor, constant: padding),
            v.widthAnchor.constraint(equalToConstant: letterSize.width),
            v.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            b.topAnchor.constraint(equalTo: g.bottomAnchor, constant: padding),
            b.leadingAnchor.constraint(equalTo: v.trailingAnchor, constant: padding),
            b.widthAnchor.constraint(equalToConstant: letterSize.width),
            b.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            n.topAnchor.constraint(equalTo: h.bottomAnchor, constant: padding),
            n.leadingAnchor.constraint(equalTo: b.trailingAnchor, constant: padding),
            n.widthAnchor.constraint(equalToConstant: letterSize.width),
            n.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            m.topAnchor.constraint(equalTo: j.bottomAnchor, constant: padding),
            m.leadingAnchor.constraint(equalTo: n.trailingAnchor, constant: padding),
            m.widthAnchor.constraint(equalToConstant: letterSize.width),
            m.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            backspace.topAnchor.constraint(equalTo: l.bottomAnchor, constant: padding),
            backspace.leadingAnchor.constraint(equalTo: m.trailingAnchor, constant: padding),
            backspace.widthAnchor.constraint(equalToConstant: enterWidth),
            backspace.heightAnchor.constraint(equalToConstant: letterSize.height)
        ]
        NSLayoutConstraint.activate(portraitConstraints)
    }
    
    // MARK: - ACTIVATE LANDSCAPE CONSTRAINTS
    func activateLandscapeConstraints() {
        NSLayoutConstraint.deactivate(portraitConstraints)
        NSLayoutConstraint.deactivate(landscapeConstraints)
        let padding = Frame.Keyboard.landscapeLetterPadding
        let letterSize = Frame.Keyboard.landscapeLetterSize
        let enterWidth = letterSize.width * 1.5
        landscapeConstraints = [
            
            // first row
            q.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            q.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            q.widthAnchor.constraint(equalToConstant: letterSize.width),
            q.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            w.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            w.leadingAnchor.constraint(equalTo: q.trailingAnchor, constant: padding),
            w.widthAnchor.constraint(equalToConstant: letterSize.width),
            w.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            e.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            e.leadingAnchor.constraint(equalTo: w.trailingAnchor, constant: padding),
            e.widthAnchor.constraint(equalToConstant: letterSize.width),
            e.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            r.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            r.leadingAnchor.constraint(equalTo: e.trailingAnchor, constant: padding),
            r.widthAnchor.constraint(equalToConstant: letterSize.width),
            r.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            t.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            t.leadingAnchor.constraint(equalTo: r.trailingAnchor, constant: padding),
            t.widthAnchor.constraint(equalToConstant: letterSize.width),
            t.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            y.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            y.leadingAnchor.constraint(equalTo: t.trailingAnchor, constant: padding),
            y.widthAnchor.constraint(equalToConstant: letterSize.width),
            y.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            u.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            u.leadingAnchor.constraint(equalTo: y.trailingAnchor, constant: padding),
            u.widthAnchor.constraint(equalToConstant: letterSize.width),
            u.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            i.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            i.leadingAnchor.constraint(equalTo: u.trailingAnchor, constant: padding),
            i.widthAnchor.constraint(equalToConstant: letterSize.width),
            i.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            o.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            o.leadingAnchor.constraint(equalTo: i.trailingAnchor, constant: padding),
            o.widthAnchor.constraint(equalToConstant: letterSize.width),
            o.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            p.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            p.leadingAnchor.constraint(equalTo: o.trailingAnchor, constant: padding),
            p.widthAnchor.constraint(equalToConstant: letterSize.width),
            p.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            // second row
            a.topAnchor.constraint(equalTo: q.bottomAnchor, constant: padding),
            a.leadingAnchor.constraint(equalTo: leadingAnchor, constant: letterSize.width / 2),
            a.widthAnchor.constraint(equalToConstant: letterSize.width),
            a.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            s.topAnchor.constraint(equalTo: w.bottomAnchor, constant: padding),
            s.leadingAnchor.constraint(equalTo: a.trailingAnchor, constant: padding),
            s.widthAnchor.constraint(equalToConstant: letterSize.width),
            s.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            d.topAnchor.constraint(equalTo: e.bottomAnchor, constant: padding),
            d.leadingAnchor.constraint(equalTo: s.trailingAnchor, constant: padding),
            d.widthAnchor.constraint(equalToConstant: letterSize.width),
            d.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            f.topAnchor.constraint(equalTo: r.bottomAnchor, constant: padding),
            f.leadingAnchor.constraint(equalTo: d.trailingAnchor, constant: padding),
            f.widthAnchor.constraint(equalToConstant: letterSize.width),
            f.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            g.topAnchor.constraint(equalTo: t.bottomAnchor, constant: padding),
            g.leadingAnchor.constraint(equalTo: f.trailingAnchor, constant: padding),
            g.widthAnchor.constraint(equalToConstant: letterSize.width),
            g.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            h.topAnchor.constraint(equalTo: y.bottomAnchor, constant: padding),
            h.leadingAnchor.constraint(equalTo: g.trailingAnchor, constant: padding),
            h.widthAnchor.constraint(equalToConstant: letterSize.width),
            h.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            j.topAnchor.constraint(equalTo: u.bottomAnchor, constant: padding),
            j.leadingAnchor.constraint(equalTo: h.trailingAnchor, constant: padding),
            j.widthAnchor.constraint(equalToConstant: letterSize.width),
            j.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            k.topAnchor.constraint(equalTo: i.bottomAnchor, constant: padding),
            k.leadingAnchor.constraint(equalTo: j.trailingAnchor, constant: padding),
            k.widthAnchor.constraint(equalToConstant: letterSize.width),
            k.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            l.topAnchor.constraint(equalTo: o.bottomAnchor, constant: padding),
            l.leadingAnchor.constraint(equalTo: k.trailingAnchor, constant: padding),
            l.widthAnchor.constraint(equalToConstant: letterSize.width),
            l.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            // third row
            enter.topAnchor.constraint(equalTo: a.bottomAnchor, constant: padding),
            enter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.Keyboard.landscapeEnterXOffset),
            enter.widthAnchor.constraint(equalToConstant: enterWidth),
            enter.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            z.topAnchor.constraint(equalTo: a.bottomAnchor, constant: padding),
            z.leadingAnchor.constraint(equalTo: enter.trailingAnchor, constant: padding),
            z.widthAnchor.constraint(equalToConstant: letterSize.width),
            z.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            x.topAnchor.constraint(equalTo: s.bottomAnchor, constant: padding),
            x.leadingAnchor.constraint(equalTo: z.trailingAnchor, constant: padding),
            x.widthAnchor.constraint(equalToConstant: letterSize.width),
            x.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            c.topAnchor.constraint(equalTo: d.bottomAnchor, constant: padding),
            c.leadingAnchor.constraint(equalTo: x.trailingAnchor, constant: padding),
            c.widthAnchor.constraint(equalToConstant: letterSize.width),
            c.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            v.topAnchor.constraint(equalTo: f.bottomAnchor, constant: padding),
            v.leadingAnchor.constraint(equalTo: c.trailingAnchor, constant: padding),
            v.widthAnchor.constraint(equalToConstant: letterSize.width),
            v.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            b.topAnchor.constraint(equalTo: g.bottomAnchor, constant: padding),
            b.leadingAnchor.constraint(equalTo: v.trailingAnchor, constant: padding),
            b.widthAnchor.constraint(equalToConstant: letterSize.width),
            b.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            n.topAnchor.constraint(equalTo: h.bottomAnchor, constant: padding),
            n.leadingAnchor.constraint(equalTo: b.trailingAnchor, constant: padding),
            n.widthAnchor.constraint(equalToConstant: letterSize.width),
            n.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            m.topAnchor.constraint(equalTo: j.bottomAnchor, constant: padding),
            m.leadingAnchor.constraint(equalTo: n.trailingAnchor, constant: padding),
            m.widthAnchor.constraint(equalToConstant: letterSize.width),
            m.heightAnchor.constraint(equalToConstant: letterSize.height),
            
            backspace.topAnchor.constraint(equalTo: l.bottomAnchor, constant: padding),
            backspace.leadingAnchor.constraint(equalTo: m.trailingAnchor, constant: padding),
            backspace.widthAnchor.constraint(equalToConstant: enterWidth),
            backspace.heightAnchor.constraint(equalToConstant: letterSize.height)
        ]
        NSLayoutConstraint.activate(landscapeConstraints)
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
