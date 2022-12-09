//
//  CustomCell.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import UIKit

class CryptoCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    //MARK: - UI
    let coinImage = CustomImageView()
    
    let symbolLabel = CustomLabel(size: 20, weight: .regular)
    let nameLabel = CustomLabel(size: 24, weight: .regular)
    let priceLabel = CustomLabel(size: 22, weight: .semibold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(coinImage)
        updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        symbolLabel.text = nil
        nameLabel.text = nil
        priceLabel.text = nil
        coinImage.image = nil
    }
    //MARK: - METHODS
    
    //MARK: - CONSTRAINTS
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            coinImage.heightAnchor.constraint(equalToConstant: 80),
            coinImage.widthAnchor.constraint(equalToConstant: 80),
            coinImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            coinImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: coinImage.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: coinImage.rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: symbolLabel.topAnchor)
        ])
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            symbolLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
        
    }
}
