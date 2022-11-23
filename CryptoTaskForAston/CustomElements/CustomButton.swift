//
//  CustomButton.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 21.11.2022.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect ) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        self.setTitleColor(.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(title: String, backGroundColor: UIColor, action: Selector) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backGroundColor
        self.addTarget(nil, action: action, for: .touchUpInside)
    }

}
