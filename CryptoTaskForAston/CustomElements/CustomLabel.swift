//
//  CustomLabel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 07.12.2022.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(size: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.font = .systemFont(ofSize: size, weight: weight)
        
    }
    
    
}
