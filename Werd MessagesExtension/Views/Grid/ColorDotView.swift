//
//  ColorDotView.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 8/18/22.
//

import UIKit

class ColorDotView: UIView {
            
    // MARK: - Initializers
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerCurve = .continuous
        layer.cornerRadius = Frame.Grid.dotGirth / 2
        backgroundColor = color
        isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
