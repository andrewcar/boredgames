//
//  DebugView.swift
//  Nerdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/12/22.
//

import UIKit

class DebugView: UIView {
    
    // MARK: - Properties
    private var customAnswerTextField = UITextField()
    private var customAnswerPortraitConstraints: [NSLayoutConstraint] = []
    private var customAnswerLandscapeConstraints: [NSLayoutConstraint] = []
    var showing: Bool = false
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEWS
    private func addSubviews() {
        addCustomAnswerTextField()
        addTapGestureRecognizer()
    }
    
    // MARK: - CUSTOM ANSWER
    private func addCustomAnswerTextField() {
        customAnswerTextField = UITextField(frame: .zero)
        customAnswerTextField.translatesAutoresizingMaskIntoConstraints = false
        customAnswerTextField.delegate = self
        customAnswerTextField.textAlignment = .center
        customAnswerTextField.autocapitalizationType = .allCharacters
        customAnswerTextField.font = UIFont(name: "RobotoSlab-Black", size: 31)
        customAnswerTextField.placeholder = "CUSTOM ANSWER"
        addSubview(customAnswerTextField)
        activateCustomAnswerConstraints()
    }
    
    // MARK: - CUSTOM ANSWER CONSTRAINTS
    private func activateCustomAnswerConstraints() {
        deactivateCustomAnswerConstraints()
        customAnswerPortraitConstraints = [
            customAnswerTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Grid.outerPadding),
            customAnswerTextField.heightAnchor.constraint(equalToConstant: Frame.Grid.outerPadding),
            customAnswerTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding * 2),
            customAnswerTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2))
        ]
        NSLayoutConstraint.activate(customAnswerPortraitConstraints)
    }
    
    // MARK: - DEACTIVATE CUSTOM ANSWER CONSTRAINTS
    private func deactivateCustomAnswerConstraints() {
        NSLayoutConstraint.deactivate(customAnswerPortraitConstraints)
        NSLayoutConstraint.deactivate(customAnswerLandscapeConstraints)
    }
    
    // MARK: - ADD TAP GESTURE
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTap(sender: UITapGestureRecognizer) {
        customAnswerTextField.resignFirstResponder()
    }
}

extension DebugView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        GameModel.shared.customAnswer = text
        customAnswerTextField.resignFirstResponder()
        return true
    }
}
