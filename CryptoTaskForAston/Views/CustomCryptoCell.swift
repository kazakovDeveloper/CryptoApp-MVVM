//
//  CustomCell.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import UIKit

class CustomCryptoCell: UITableViewCell {
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    private var dataSource: CryptoTableViewDataSource<CustomCryptoCell,CryptoCoin>!
    
    static let identifier = "CustomCell"
    
    private lazy var coinImage: UIImageView = {
        let coinImage = UIImageView()
        
        coinImage.contentMode = .scaleToFill
        coinImage.translatesAutoresizingMaskIntoConstraints = false
        coinImage.clipsToBounds = true
        
        return coinImage
    }()
    
    private lazy var symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        
        symbolLabel.font = .systemFont(ofSize: 20, weight: .regular)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.text = "hello"
        
        return symbolLabel
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.font = .systemFont(ofSize: 24, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    private var priceLabel: UILabel = {
       let priceLabel = UILabel()
        
       priceLabel.font = .systemFont(ofSize: 22, weight: .semibold)
       priceLabel.translatesAutoresizingMaskIntoConstraints = false
       priceLabel.textAlignment = .right
    
       return priceLabel
    }()

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
    
//    func configure(with viewModel: CryptoTableViewCellViewModel) {
//        self.nameLabel.text = viewModel.name
//        self.priceLabel.text = "\(viewModel.price) $"
//        self.symbolLabel.text = viewModel.symbol
//
//        NetworkManager.shared.saveImage(from: viewModel.image) { [weak self] result in
//            switch result {
//            case .success(let image):
//                if viewModel.image == viewModel.image {
//                    self?.coinImage.image = image
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//    }
    
    
    
    
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
