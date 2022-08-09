//
//  Frame.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import UIKit

struct Frame {
    
    // MARK: - GENERAL
    static let padding: CGFloat = 5
    
    // MARK: - LOGO
    struct Logo {
        static let size = CGSize(width: 117, height: 30)
        static let bottomPadding: CGFloat = 10
        static let maxY: CGFloat = size.height + (padding * 2)
        
        static func originX(viewFrame: CGRect) -> CGFloat {
            (viewFrame.width / 2) - (size.width / 2)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(x: originX(viewFrame: viewFrame), y: padding, width: size.width, height: size.height)
        }
    }
    
    // MARK: - SEND BUTTON
    struct SendButton {
        static let size = CGSize(width: 50, height: 50)
        static func originX(viewFrame: CGRect) -> CGFloat {
            (viewFrame.width / 2) - (size.width / 2)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: originX(viewFrame: viewFrame),
                y: Frame.Grid.maxY(viewFrame) + Frame.Success.frame(viewFrame).height + (Frame.Grid.bottomPadding * 2),
                width: size.width,
                height: size.height)
        }
        static func hiddenFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: originX(viewFrame: viewFrame) + viewFrame.width,
                y: Frame.Grid.maxY(viewFrame) + Frame.Grid.bottomPadding,
                width: size.width,
                height: size.height)
        }
    }
    
    // MARK: - SUCCESS
    struct Success {
        static let size = CGSize(width: 116, height: 25)
        
        static func originX(viewFrame: CGRect) -> CGFloat {
            (viewFrame.width / 2) - (size.width / 2)
        }
        static func originY(viewFrame: CGRect) -> CGFloat {
            (viewFrame.height / 2) - (size.height / 2)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: originX(viewFrame: viewFrame),
                y: Grid.maxY(viewFrame) + (padding * 4),
                width: size.width,
                height: size.height)
        }
        static func hiddenFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: originX(viewFrame: viewFrame) - viewFrame.width,
                y: Grid.maxY(viewFrame) + (padding * 4),
                width: size.width,
                height: size.height)
        }
    }
    
    // MARK: - NOT IN WORD LIST
    struct NotInWordList {
        static let size = CGSize(width: 126, height: 45)
        
        static func originX(viewFrame: CGRect) -> CGFloat {
            (viewFrame.width / 2) - (size.width / 2)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(x: originX(viewFrame: viewFrame), y: padding * 8, width: size.width, height: size.height)
        }
    }
    
    // MARK: - GRID
    struct Grid {
        static let buttonSize = CGSize(width: 50, height: 50)
        static func buttonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: padding * 4,
                y: Grid.maxY(viewFrame) + 280,
                width: buttonSize.width,
                height: buttonSize.height)
        }
        static func hiddenButtonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: -viewFrame.width,
                y: Grid.maxY(viewFrame) + 280,
                width: buttonSize.width,
                height: buttonSize.height)
        }
        static func outerPadding(_ viewFrame: CGRect) -> CGFloat {
            viewFrame.width / 7
        }
        static let bottomPadding: CGFloat = 20
        static func letterSize(_ viewFrame: CGRect) -> CGSize {
            let width = (viewFrame.width - (padding * 4) - (outerPadding(viewFrame) * 2)) / 5
            return CGSize(width: width, height: width)
        }
        static func maxY(_ viewFrame: CGRect) -> CGFloat {
            Frame.Logo.bottomPadding + Frame.Logo.size.height + (padding * 6) + (letterSize(viewFrame).height * 6)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: 0,
                y: Frame.Logo.maxY,
                width: viewFrame.width,
                height: viewFrame.height)
        }
        static func originX(_ viewFrame: CGRect) -> CGFloat {
            (viewFrame.width / 2) - (letterSize(viewFrame).width / 2)
        }
        static func hiddenFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: -viewFrame.width,
                y: Frame.Logo.maxY,
                width: viewFrame.width,
                height: viewFrame.height)
        }
    }
    
    // MARK: - KEYBOARD
    struct Keyboard {
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: 0,
                y: Frame.Grid.maxY(viewFrame) + Frame.Grid.bottomPadding,
                width: viewFrame.width,
                height: Frame.Grid.frame(viewFrame).width)
        }
        static func hiddenFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: -viewFrame.width,
                y: frame(viewFrame).minY,
                width: viewFrame.width,
                height: Frame.Grid.frame(viewFrame).width)
        }
    }
    
    // MARK: - NEW GAME
    struct NewGame {
        static let buttonSize = CGSize(width: 50, height: 50)
        static func buttonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: (viewFrame.width / 2) - (buttonSize.width / 2),
                y: Grid.maxY(viewFrame) + 280,
                width: buttonSize.width,
                height: buttonSize.height)
        }
        static func hiddenButtonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: (viewFrame.width / 2) - (buttonSize.width / 2),
                y: Grid.maxY(viewFrame) + 280 + 200,
                width: buttonSize.width,
                height: buttonSize.height)
        }
    }
    
    struct Stats {
        static let buttonSize = CGSize(width: 50, height: 50)
        static func buttonFrame(_ viewFrame: CGRect) -> CGRect {
            let size = CGSize(width: buttonSize.width, height: buttonSize.height)
            return CGRect(
                x: viewFrame.width - buttonSize.width - (padding * 4),
                y: Grid.maxY(viewFrame) + 280,
                width: size.width,
                height: size.height)
        }
        static func hiddenButtonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: viewFrame.width - buttonSize.width - (padding * 4) + viewFrame.width,
                y: Grid.maxY(viewFrame) + 280,
                width: buttonSize.width,
                height: buttonSize.height)
        }
        static func frame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: 0,
                y: Frame.Logo.maxY,
                width: viewFrame.width,
                height: viewFrame.height)
        }
        static func hiddenFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: viewFrame.width,
                y: Frame.Logo.maxY,
                width: viewFrame.width,
                height: viewFrame.height)
        }
        static func statPadding(_ viewFrame: CGRect) -> CGFloat {
            viewFrame.width * 0.1277
        }
        static func barSize(_ viewFrame: CGRect) -> CGSize {
            let width = viewFrame.width - statPadding(viewFrame)
            return CGSize(width: width, height: width * 0.25)
        }
        static func barFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: (viewFrame.width / 2) - (barSize(viewFrame).width / 2),
                y: Frame.Logo.maxY + Frame.Logo.bottomPadding,
                width: barSize(viewFrame).width,
                height: barSize(viewFrame).height)
        }
        static func resetButtonFrame(_ viewFrame: CGRect) -> CGRect {
            CGRect(
                x: (viewFrame.width / 2) - 50,
                y: barFrame(viewFrame).maxY + statPadding(viewFrame),
                width: 100,
                height: 100)
        }
    }
}
