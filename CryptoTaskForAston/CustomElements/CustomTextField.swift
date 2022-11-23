//
//  CustomTextField.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 22.11.2022.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .center
        self.backgroundColor = .white
        self.textColor = .black
        self.layer.cornerRadius = 25
        self.font = .systemFont(ofSize: 17, weight: .semibold)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .roundedRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeHolder: String) {
        self.init(frame: .zero)
        self.placeholder = placeHolder
        
    }
    
    convenience init(placeHolder: String, secureEnter: Bool) {
        self.init(frame: .zero)
        self.placeholder = placeHolder
        self.isSecureTextEntry = secureEnter
        
    }
    
    
//    private func createTextField(placeHolder: String) -> UITextField {
//        let textField = UITextField()
//        textField.placeholder = placeHolder
//        textField.textAlignment = .center
//        textField.backgroundColor = .white
//        textField.layer.cornerRadius = 15
//        textField.font = .systemFont(ofSize: 17, weight: .semibold)
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.borderStyle = .roundedRect
//        
//        return textField
//    }
}
