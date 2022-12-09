//
//  RegistrationViewController.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 21.11.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: - UI ELEMENTS
    private lazy var userNameTextField: UITextField = {
        let userNameTextField = CustomTextField(placeHolder: "Enter your user name")
        userNameTextField.addTarget(self,
                                    action: #selector(activatingConfirmButton),
                                    for: .editingChanged)
        return userNameTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = CustomTextField(placeHolder: "Enter your password",
                                                secureEnter: true)
        passwordTextField.addTarget(self,
                                    action: #selector(activatingConfirmButton),
                                    for: .editingChanged)
        
        return passwordTextField
    }()
    
    private lazy var confirmButton: UIButton = {
        let confirmButton = CustomButton(title: "Confirm registration",
                     backGroundColor: .blue,
                     action: #selector(confirmButtonTapped))
        confirmButton.isEnabled = false
        confirmButton.alpha = 0.6
        return confirmButton
    }()
    
    private lazy var cancelButton: UIButton = {
        CustomButton(title: "Cancel",
                     backGroundColor: .blue,
                     action: #selector(cancelButtonTapped))
    }()
    
    //MARK: - STACK VIEWS
    private lazy var TextFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16.0
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16.0
        stackView.addArrangedSubview(confirmButton)
        stackView.addArrangedSubview(cancelButton)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupSubviews(at: view, subviews: TextFieldsStackView, buttonsStackView)
        updateViewConstraints()
    }
    //MARK: - METHODS
    private func setupSubviews(at: UIView, subviews: UIView...) {
        subviews.forEach { subview in
            at.addSubview(subview)
        }
    }
    //MARK: - OBJC METHODS
    @objc private func confirmButtonTapped() {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text else { return }
        
        let login = Account(userName: userName, userPassword: password)
        StorageManager.shared.save(user: login)

        dismiss(animated: true)
    }
    
    @objc private func activatingConfirmButton() {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text else { return }
        
        if !password.isEmpty && !userName.isEmpty {
            confirmButton.alpha = 1
            confirmButton.isEnabled = true
        }
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    //MARK: - UPDATE CONSTRAINTS
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        NSLayoutConstraint.activate([
            TextFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TextFieldsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            TextFieldsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            TextFieldsStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            buttonsStackView.centerXAnchor.constraint(equalTo: TextFieldsStackView.centerXAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: TextFieldsStackView.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: TextFieldsStackView.trailingAnchor, constant: -20),
            buttonsStackView.topAnchor.constraint(equalTo: TextFieldsStackView.bottomAnchor, constant: 20)
        ])
        
    }

}
