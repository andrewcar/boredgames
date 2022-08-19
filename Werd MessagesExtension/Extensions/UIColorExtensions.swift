//
//  UIColorExtensions.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 7/24/22.
//

import UIKit

extension UIColor {
    static let notInWordListBackground = UIColor(named: "notInWordListBackground")
    static let notInWordListText = UIColor(named: "notInWordListText")

    static let gridLetterBackgroundBlank = UIColor(named: "gridLetterBackgroundBlank")
    static let gridLetterBackgroundGray = UIColor(named: "gridLetterBackgroundGray")
    static let gridLetterBackgroundYellow = UIColor(named: "gridLetterBackgroundYellow")
    static let gridLetterBackgroundGreen = UIColor(named: "gridLetterBackgroundGreen")
    static let gridLetterBorder = UIColor(named: "gridLetterBorder")
    static let gridLetterActiveBorder = UIColor(named: "gridLetterActiveBorder")

    static let keyboardLetterBackgroundBlank = UIColor(named: "keyboardLetterBackgroundBlank")
    static let keyboardLetterBackgroundGray = UIColor(named: "keyboardLetterBackgroundGray")
    static let keyboardLetterBackgroundYellow = UIColor(named: "keyboardLetterBackgroundYellow")
    static let keyboardLetterBackgroundGreen = UIColor(named: "keyboardLetterBackgroundGreen")
    static let keyboardLetter = UIColor(named: "keyboardLetter")
    
    static let successBackgroundGreen = UIColor(named: "successBackgroundGreen")
    static let successBackgroundRed = UIColor(named: "successBackgroundRed")

    static let messagesBlue = UIColor(named: "messagesBlue")

    static let systemIconButton = UIColor(named: "systemIconButton")
    
    static let statBubbleBackground = UIColor(named: "statBubbleBackground")
    static let statBubbleValueText = UIColor(named: "statBubbleValueText")
    static let statBubbleTitleText = UIColor(named: "statBubbleTitleText")
    
    static let werdRed = UIColor(named: "werdRed")!
    static let werdOrange = UIColor(named: "werdOrange")!
    static let werdYellow = UIColor(named: "werdYellow")!
    static let werdGreen = UIColor(named: "werdGreen")!
    static let werdBlue = UIColor(named: "werdBlue")!
    static let werdPurple = UIColor(named: "werdPurple")!
    
    static func color(for playerColor: PlayerColor?) -> UIColor {
        switch playerColor {
        case .red:
            return .werdRed
        case .orange:
            return .werdOrange
        case .yellow:
            return .werdYellow
        case .green:
            return .werdGreen
        case .blue:
            return .werdBlue
        case .purple:
            return .werdPurple
        default:
            return .clear
        }
    }
}
