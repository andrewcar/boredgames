//
//  ThreeRowGridView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

class ThreeRowGridView: UIView {
    
    // MARK: - Properties
    private var a1 = ThreeRowGridLetterView(frame: .zero)
    private var a2 = ThreeRowGridLetterView(frame: .zero)
    private var a3 = ThreeRowGridLetterView(frame: .zero)
    private var b1 = ThreeRowGridLetterView(frame: .zero)
    private var b2 = ThreeRowGridLetterView(frame: .zero)
    private var b3 = ThreeRowGridLetterView(frame: .zero)
    private var c1 = ThreeRowGridLetterView(frame: .zero)
    private var c2 = ThreeRowGridLetterView(frame: .zero)
    private var c3 = ThreeRowGridLetterView(frame: .zero)
    private var gridConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        for letterView in [a1, a2, a3, b1, b2, b3, c1, c2, c3] {
            letterView.letterViewDelegate = self
            addSubview(letterView)
        }
        activateGridConstraints()
    }
    
    // MARK: - GRID CONSTRAINTS
    private func activateGridConstraints() {
        let size = CGSize(width: frame.width / 3, height: frame.height / 3)
        NSLayoutConstraint.deactivate(gridConstraints)
        gridConstraints = [
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
            c3.heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(gridConstraints)
    }
}

extension ThreeRowGridView: ThreeRowGridLetterViewDelegate {
    func didTapButton(sender: UIButton) {
        print("ThreeRowGridView -> didTapButton")
    }
}
