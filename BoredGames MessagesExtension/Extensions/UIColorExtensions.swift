//
//  UIColorExtensions.swift
//  BoredGames MessagesExtension
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
    
    static let boredRed = UIColor(named: "boredRed")!
    static let boredOrange = UIColor(named: "boredOrange")!
    static let boredYellow = UIColor(named: "boredYellow")!
    static let boredGreen = UIColor(named: "boredGreen")!
    static let boredBlue = UIColor(named: "boredBlue")!
    static let boredPurple = UIColor(named: "boredPurple")!
    
    static func color(for playerColor: PlayerColor?) -> UIColor {
        switch playerColor {
        case .red:
            return .boredRed
        case .orange:
            return .boredOrange
        case .yellow:
            return .boredYellow
        case .green:
            return .boredGreen
        case .blue:
            return .boredBlue
        case .purple:
            return .boredPurple
        default:
            return .clear
        }
    }
}
