//
//  CustomImageView.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 07.12.2022.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
}
