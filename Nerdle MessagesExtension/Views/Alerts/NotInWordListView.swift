//
//  NotInWordListView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/29/22.
//

import UIKit

class NotInWordListView: UIView {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods
    private func setup() {
        addSubviews()
        layer.cornerCurve = .continuous
        layer.cornerRadius = 4
        backgroundColor = .nerdleBorderDarkModeGray
        isHidden = true
    }
    
    private func addSubviews() {
        let padding = (frame.height / 3) / 2
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: padding, width: frame.width, height: frame.height / 3))
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "Try again"
        addSubview(titleLabel)
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.maxY, width: frame.width, height: frame.height / 3))
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textColor = .white
        subtitleLabel.text = "Not in word list"
        addSubview(subtitleLabel)
    }
}
