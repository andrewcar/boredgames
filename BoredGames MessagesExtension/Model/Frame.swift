//
//  Frame.swift
//  BoredGames MessagesExtension
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
    static let bigButtonSize = CGSize(width: 64, height: 64)
    static var sliderTopPadding: CGFloat {
        UIScreen.main.bounds.height / 3
    }
    static var gameButtonPadding: CGFloat {
        return (UIScreen.main.bounds.width - (buttonSize.width * 4)) / 5
    }

    // MARK: - LOGO
    struct Logo {
        static let targetTallSize = CGSize(width: 100, height: 54)
        static let targetTallSizeBigger = CGSize(width: 150, height: 81)
        static let smallSize = CGSize(width: 69, height: 69)
        static let upperPadding: CGFloat = UIScreen.main.bounds.width / 16
        static let ticTacToePadding: CGFloat = UIScreen.main.bounds.width / 20
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
        static func fiveLetterGuessSize(_ containerWidth: CGFloat, scaledPadding: CGFloat) -> CGSize {
            let oneFifthSansPadding: CGFloat = (containerWidth - (scaledPadding * 6)) / 5
            let gridHeight = containerWidth + oneFifthSansPadding + (scaledPadding * 5)
            return CGSize(width: containerWidth, height: gridHeight)
        }
        static func ticTacToeGridGirth(isLandscape: Bool) -> CGFloat {
            if isLandscape {
                return UIScreen.main.bounds.height * 0.7
            } else {
                return UIScreen.main.bounds.width * 0.7
            }
        }
        static func ticTacToeSquareGirth(isLandscape: Bool) -> CGFloat {
            (ticTacToeGridGirth(isLandscape: isLandscape) - (padding * 4)) / 3
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
            let remainingWidthSansPadding = remainingWidth - (padding * 18)
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
        static var horizontalBarSize: CGSize {
            let width = UIScreen.main.bounds.width - statPadding
            return CGSize(width: width, height: width * 0.25)
        }
        static var landscapeHorizontalBarSize: CGSize {
            let width = UIScreen.main.bounds.width * 0.5
            return CGSize(width: width, height: width * 0.3)
        }
        static var verticalBarSize: CGSize {
            let width = (UIScreen.main.bounds.width - (Logo.upperPadding * 3)) / 2.5
            return CGSize(width: width, height: width * 4.5)
        }
        static var landscapeVerticalBarSize: CGSize {
//            let width = (UIScreen.main.bounds.width - (Logo.upperPadding * 3)) / 2
//            let width = verticalBarSize
            return CGSize(width: verticalBarSize.width / 2, height: verticalBarSize.width / 2)
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
        
        static var horizontalNumberSize: CGSize {
            CGSize(width: horizontalBarSize.width / 4, height: horizontalBarSize.height / 2)
        }
        static var horizontalTitleSize: CGSize {
            CGSize(width: horizontalBarSize.width / 4, height: horizontalBarSize.height / 2)
        }
        static var landscapeHorizontalNumberSize: CGSize {
            CGSize(width: landscapeHorizontalBarSize.width / 4, height: landscapeHorizontalBarSize.height / 2)
        }
        static var landscapeHorizontalTitleSize: CGSize {
            CGSize(width: landscapeHorizontalBarSize.width / 4, height: landscapeHorizontalBarSize.height / 2)
        }
        
        static var verticalNumberSize: CGSize {
            CGSize(width: verticalBarSize.height / 4, height: verticalBarSize.width / 2)
        }
        static var verticalTitleSize: CGSize {
            CGSize(width: verticalBarSize.height / 4, height: verticalBarSize.width / 2)
        }
        static var landscapeVerticalNumberSize: CGSize {
            CGSize(width: landscapeVerticalBarSize.height / 4, height: landscapeVerticalBarSize.width / 2)
        }
        static var landscapeVerticalTitleSize: CGSize {
            CGSize(width: landscapeVerticalBarSize.height / 4, height: landscapeVerticalBarSize.width / 2)
        }
    }
}
