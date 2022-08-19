//
//  Frame.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

struct Frame {
    
    // MARK: - GENERAL
    static let smallPadding: CGFloat = 3
    static let bigPadding: CGFloat = 8
    static let padding: CGFloat = 5
    static let buttonSize = CGSize(width: 44, height: 44)

    // MARK: - LOGO
    struct Logo {
        static let size = CGSize(width: 120, height: 33)
        static let upperPadding: CGFloat = UIScreen.main.bounds.width / 16
        static let bottomPadding: CGFloat = 10
    }
    
    // MARK: - SUCCESS
    struct Success {
        static let size = CGSize(width: 116, height: 25)
    }
    
    // MARK: - NOT IN WORD LIST
    struct NotInWordList {
        static let size = CGSize(width: 140, height: 47)
    }
    
    // MARK: - GRID
    struct Grid {
        static let dotGirth: CGFloat = 11
        static func size(_ containerWidth: CGFloat, scaledPadding: CGFloat) -> CGSize {
            let oneFifthSansPadding: CGFloat = (containerWidth / 5) - (scaledPadding * 6)
            let gridHeight = containerWidth + oneFifthSansPadding + (scaledPadding * 5)
            return CGSize(width: containerWidth, height: gridHeight)
        }
        static func letterSize(_ viewFrame: CGRect) -> CGSize {
            let width = (viewFrame.width - (padding * 4) - (outerPadding * 2)) / 5
            return CGSize(width: width, height: width)
        }
        static var upperPadding: CGFloat {
            UIScreen.main.bounds.width / 20
        }
        static var outerPadding: CGFloat {
            UIScreen.main.bounds.width / 7
        }
        static let bottomPadding: CGFloat = 20
        static func maxY(_ viewFrame: CGRect) -> CGFloat {
            Frame.Logo.bottomPadding + Frame.Logo.size.height + (padding * 6) + (letterSize(viewFrame).height * 6)
        }
    }
    
    // MARK: - KEYBOARD
    struct Keyboard {
        static var portraitLetterSize: CGSize {
            var widthSansPadding: CGFloat
            if UIDevice.current.userInterfaceIdiom == .pad {
                widthSansPadding = (UIScreen.main.bounds.width * 0.7) - (padding * 11)
            } else {
                widthSansPadding = UIScreen.main.bounds.width - (padding * 11)
            }
            let letterWidth = widthSansPadding / 10
            let letterHeight = letterWidth * 1.25
            return CGSize(width: letterWidth, height: letterHeight)
        }
        
        static var landscapeLetterSize: CGSize {
            let estimatedGridWidth = UIScreen.main.bounds.width / 2.3
            let remainingWidth = UIScreen.main.bounds.width - estimatedGridWidth
            let remainingWidthSansPadding = remainingWidth - (padding * 17)
            let letterWidth = remainingWidthSansPadding / 10
            let letterHeight = letterWidth * 1.25
            return CGSize(width: letterWidth, height: letterHeight)
        }
        static let portraitEnterXOffset: CGFloat = padding * 1.5
        static let landscapeEnterXOffset: CGFloat = padding * 1.5
    }
    
    struct Stats {
        static var statPadding: CGFloat {
            UIScreen.main.bounds.width * 0.1277
        }
        static var barSize: CGSize {
            let width = UIScreen.main.bounds.width - statPadding
            return CGSize(width: width, height: width * 0.25)
        }
        static var landscapeBarSize: CGSize {
            let width = UIScreen.main.bounds.width * 0.5
            return CGSize(width: width, height: width * 0.3)
        }
        static var titleHeight: CGFloat {
            UIScreen.main.bounds.height * 0.2
        }
        static var padding: CGFloat {
            UIScreen.main.bounds.height * 0.1
        }
        static var statBarWidthPadding: CGFloat {
            UIScreen.main.bounds.width / 1000
        }
        static var numberSize: CGSize {
            CGSize(width: barSize.width / 4, height: barSize.height / 2)
        }
        static var titleSize: CGSize {
            CGSize(width: barSize.width / 4, height: barSize.height / 2)
        }
        static var landscapeNumberSize: CGSize {
            CGSize(width: landscapeBarSize.width / 4, height: landscapeBarSize.height / 2)
        }
        static var landscapeTitleSize: CGSize {
            CGSize(width: landscapeBarSize.width / 4, height: landscapeBarSize.height / 2)
        }
    }
}
