//
//  ColorPickerView.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 8/17/22.
//

import UIKit

protocol ColorPickerDelegate {
    func didTapColor(playerColor: PlayerColor)
}

class ColorPickerView: UIView {
    
    // MARK: - Properties
    var colorPickerDelegate: ColorPickerDelegate!
    private var titleLabel = UILabel()
    private var redColorView = ColorView()
    private var orangeColorView = ColorView()
    private var yellowColorView = ColorView()
    private var greenColorView = ColorView()
    private var blueColorView = ColorView()
    private var purpleColorView = ColorView()
    private var colorConstraints: [NSLayoutConstraint] = []
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Choose a color"
        titleLabel.textAlignment = .center
        titleLabel.font = .customFont(named: .publicSansBold, size: 16, fallbackWeight: .bold)
        addSubview(titleLabel)
        
        redColorView = ColorView(frame: .zero, playerColor: .red)
        redColorView.colorViewDelegate = self
        addSubview(redColorView)
        
        orangeColorView = ColorView(frame: .zero, playerColor: .orange)
        orangeColorView.colorViewDelegate = self
        addSubview(orangeColorView)
        
        yellowColorView = ColorView(frame: .zero, playerColor: .yellow)
        yellowColorView.colorViewDelegate = self
        addSubview(yellowColorView)
        
        greenColorView = ColorView(frame: .zero, playerColor: .green)
        greenColorView.colorViewDelegate = self
        addSubview(greenColorView)

        blueColorView = ColorView(frame: .zero, playerColor: .blue)
        blueColorView.colorViewDelegate = self
        addSubview(blueColorView)

        purpleColorView = ColorView(frame: .zero, playerColor: .purple)
        purpleColorView.colorViewDelegate = self
        addSubview(purpleColorView)

        activateColorConstraints()
    }
    
    // MARK: - COLOR CONSTRAINTS
    private func activateColorConstraints() {
        NSLayoutConstraint.deactivate(colorConstraints)
        colorConstraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Frame.Colors.colorSize.height),
            
            yellowColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            yellowColorView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -(Frame.Colors.colorViewHeight / 2)),
            yellowColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            yellowColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),

            orangeColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            orangeColorView.trailingAnchor.constraint(equalTo: yellowColorView.leadingAnchor),
            orangeColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            orangeColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),

            redColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            redColorView.trailingAnchor.constraint(equalTo: orangeColorView.leadingAnchor),
            redColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            redColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),

            greenColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            greenColorView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Frame.Colors.colorViewHeight / 2),
            greenColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            greenColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            
            blueColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            blueColorView.leadingAnchor.constraint(equalTo: greenColorView.trailingAnchor),
            blueColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            blueColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            
            purpleColorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            purpleColorView.leadingAnchor.constraint(equalTo: blueColorView.trailingAnchor),
            purpleColorView.widthAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight),
            purpleColorView.heightAnchor.constraint(equalToConstant: Frame.Colors.colorViewHeight)
        ]
        NSLayoutConstraint.activate(colorConstraints)
    }
}

extension ColorPickerView: ColorViewDelegate {
    func didTapColor(playerColor: PlayerColor) {
        colorPickerDelegate.didTapColor(playerColor: playerColor)
    }
}
