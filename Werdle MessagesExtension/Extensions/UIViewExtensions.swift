//
//  UIViewExtensions.swift
//  Werdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/8/22.
//

import UIKit

extension UIView {
    
    @objc func blurBackground(style: UIBlurEffect.Style, fallbackColor: UIColor) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            self.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.insertSubview(blurEffectView, at: 0)
        } else {
            self.backgroundColor = fallbackColor
        }
    }
}
