//
//  DebugView.swift
//  Werd MessagesExtension
//
//  Created by Andrew Carvajal on 8/12/22.
//

import UIKit

class DebugView: UIView {
    
    // MARK: - Properties
    var showing: Bool = false

    private var customAnswerTextField = UITextField()
    private var customAnswerConstraints: [NSLayoutConstraint] = []
    
    private var resetAvailabilityLabel = UILabel()
    private var resetAvailabilityLabelConstraints: [NSLayoutConstraint] = []
    private var resetAvailabilitySwitch = UISwitch()
    private var resetAvailabilitySwitchConstraints: [NSLayoutConstraint] = []
    
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
        addResetAvailabilitySwitch()
        addResetAvailabilityLabel()
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
        NSLayoutConstraint.deactivate(customAnswerConstraints)
        customAnswerConstraints = [
            customAnswerTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Frame.Grid.outerPadding),
            customAnswerTextField.heightAnchor.constraint(equalToConstant: Frame.Grid.outerPadding),
            customAnswerTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Frame.padding * 2),
            customAnswerTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(Frame.padding * 2))
        ]
        NSLayoutConstraint.activate(customAnswerConstraints)
    }
    
    // MARK: - RESET AVAILABILITY SWITCH
    private func addResetAvailabilitySwitch() {
        resetAvailabilitySwitch = UISwitch(frame: .zero)
        resetAvailabilitySwitch.translatesAutoresizingMaskIntoConstraints = false
        let action = UIAction(handler: { _ in
            GameModel.shared.resetAvailable.toggle()
        })
        resetAvailabilitySwitch.addAction(action, for: .touchUpInside)
        addSubview(resetAvailabilitySwitch)
        activateResetAvailabilitySwitchConstraints()
    }
    
    // MARK: - RESET AVAILABILITY SWITCH CONSTRAINTS
    private func activateResetAvailabilitySwitchConstraints() {
        NSLayoutConstraint.deactivate(resetAvailabilitySwitchConstraints)
        resetAvailabilitySwitchConstraints = [
            resetAvailabilitySwitch.topAnchor.constraint(equalTo: customAnswerTextField.bottomAnchor, constant: Frame.padding),
            resetAvailabilitySwitch.trailingAnchor.constraint(equalTo: customAnswerTextField.trailingAnchor, constant: -Frame.Grid.outerPadding),
            resetAvailabilitySwitch.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            resetAvailabilitySwitch.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        ]
        NSLayoutConstraint.activate(resetAvailabilitySwitchConstraints)
    }
    
    // MARK: - RESET AVAILABILITY LABEL
    private func addResetAvailabilityLabel() {
        resetAvailabilityLabel = UILabel(frame: .zero)
        resetAvailabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        resetAvailabilityLabel.font = .systemFont(ofSize: 16, weight: .bold)
        resetAvailabilityLabel.textColor = .keyboardLetterBackgroundBlank
        resetAvailabilityLabel.textAlignment = .left
        resetAvailabilityLabel.text = "Reset button"
        addSubview(resetAvailabilityLabel)
        activateResetAvailabilityLabelConstraints()
    }
    
    // MARK: - RESET AVAILABILITY LABEL CONSTRAINTS
    private func activateResetAvailabilityLabelConstraints() {
        NSLayoutConstraint.deactivate(resetAvailabilityLabelConstraints)
        resetAvailabilityLabelConstraints = [
            resetAvailabilityLabel.topAnchor.constraint(equalTo: resetAvailabilitySwitch.topAnchor),
            resetAvailabilityLabel.leadingAnchor.constraint(equalTo: customAnswerTextField.leadingAnchor, constant: Frame.Grid.outerPadding),
            resetAvailabilityLabel.trailingAnchor.constraint(equalTo: resetAvailabilitySwitch.leadingAnchor, constant: -Frame.padding),
            resetAvailabilityLabel.bottomAnchor.constraint(equalTo: resetAvailabilitySwitch.bottomAnchor)
        ]
        NSLayoutConstraint.activate(resetAvailabilityLabelConstraints)
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
        customAnswerTextField.text = ""
        customAnswerTextField.placeholder = text
        customAnswerTextField.resignFirstResponder()
        return true
    }
}
