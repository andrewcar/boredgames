//
//  TicTacToeView.swift
//  BoredGames MessagesExtension
//
//  Created by Andrew Carvajal on 8/20/22.
//

import UIKit

class TicTacToeView: UIView {
    
    // MARK: - Properties
    private var threeRowGridView = ThreeRowGridView(frame: .zero)
    private var threeRowGridConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addThreeRowGridView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UPDATE CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        activateThreeRowGridConstraints()
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveEaseIn) {
            self.layoutIfNeeded()
        } completion: { _ in
        }
    }
    
    // MARK: - THREE ROW GRID
    private func addThreeRowGridView() {
        addSubview(threeRowGridView)
        activateThreeRowGridConstraints()
    }
    
    // MARK: - THREE ROW GRID CONSTRAINTS
    private func activateThreeRowGridConstraints() {
        var gridWidth: CGFloat
        if UIDevice.current.userInterfaceIdiom == .pad {
            gridWidth = frame.width * 0.5
        } else {
            gridWidth = frame.width * 0.7
        }
        let scaledPadding = (Frame.padding / 3) * 2
        let size = Frame.Grid.size(gridWidth, scaledPadding: scaledPadding)
        
        NSLayoutConstraint.deactivate(threeRowGridConstraints)
        threeRowGridConstraints = [
            threeRowGridView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.Grid.upperPadding),
            threeRowGridView.widthAnchor.constraint(equalToConstant: size.width),
            threeRowGridView.heightAnchor.constraint(equalToConstant: size.height)
        ]
        let offset = GameModel.shared.appState == .ticTacToe && GameModel.shared.ticTacToeState == .grid ? 0 : UIScreen.main.bounds.width
        let centerXConstraint = threeRowGridView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offset)
        threeRowGridConstraints.append(centerXConstraint)
        NSLayoutConstraint.activate(threeRowGridConstraints)
    }
}
