//
//  UIFontExtensions.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/18/22.
//

import UIKit

enum FontName: String {
    case robotoSlabBlack = "RobotoSlab-Black"
    case publicSansBold = "PublicSans-Bold"
}

extension UIFont {
    static func customFont(named fontName: FontName, size: CGFloat, fallbackWeight: UIFont.Weight) -> UIFont {
        UIFont(name: fontName.rawValue, size: size) ??
            .systemFont(ofSize: size, weight: fallbackWeight)
    }
}
