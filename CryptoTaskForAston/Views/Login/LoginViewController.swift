//
//  LoginViewController.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel = LoginViewModel()
    
    //MARK: - UI ELEMENTS
    private lazy var loginTextField: UITextField = {
        CustomTextField(placeHolder: "Login")
    }()
    
    private lazy var passwordTextField: UITextField = {
        CustomTextField(placeHolder: "Password", secureEnter: true)
    }()
    
    private lazy var loginButton: UIButton = {
        CustomButton(title: "log in", backGroundColor: .blue,
                     action: #selector(loginButtonTapped))
    }()
    
    private lazy var registerButton: UIButton = {
        CustomButton(title: "Register", backGroundColor: .orange,
                     action: #selector(registrationButtonTapped))
    }()
    
    private lazy var deleteAccount: UIButton = {
        CustomButton(title: "Delete account",
                     backGroundColor: .systemPurple,
                     action: #selector(deleteButtonTapped))
    }()
    
    
    //MARK: - Stack Views
    private lazy var TextFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 16.0
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 16.0
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(deleteAccount)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews(at: view, subviews: TextFieldsStackView, buttonStackView)
        view.backgroundColor = .systemBackground
        updateViewConstraints()
    }
    
    private func setupSubviews(at: UIView, subviews: UIView...) {
        subviews.forEach { subview in
            at.addSubview(subview)
        }
    }
    
    //MARK: - OBJC METHODS
    @objc func loginButtonTapped() {
        guard let currentName = StorageManager.shared.fetchAccount() else { return }
        if loginTextField.text == currentName.userName && passwordTextField.text == currentName.userPassword {
            self.view.window!.rootViewController = UINavigationController(rootViewController: CryptoTableViewController())
        } else {
            print("Your login isn't correct")
        }
        
    }
    
    @objc func registrationButtonTapped() {
        let registrationVC = RegistrationViewController()
        present(registrationVC, animated: true)
    }
    
    @objc func deleteButtonTapped() {
        StorageManager.shared.deleteAccount()
    }
    
    //MARK: - UPDATE CONSTRAINTS
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        NSLayoutConstraint.activate([
            TextFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            TextFieldsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            TextFieldsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            TextFieldsStackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor, constant: -50),
            
            buttonStackView.centerXAnchor.constraint(equalTo: TextFieldsStackView.centerXAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: TextFieldsStackView.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: TextFieldsStackView.trailingAnchor, constant: -20),
            buttonStackView.topAnchor.constraint(equalTo: TextFieldsStackView.bottomAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.keyboardLayoutGuide.topAnchor, constant: -20)
        ])
    }
    
}
