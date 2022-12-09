//
//  CoinDetailsViewController.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 23.11.2022.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    
    var viewModel: CoinDetailsViewViewModel
    

    private lazy var coinImage: UIImageView = {
        let coinImage = UIImageView()

        return coinImage
    }()
    
    private lazy var coinLabel: UILabel = {
        let coinLabel = UILabel()
        coinLabel.translatesAutoresizingMaskIntoConstraints = false 
        
        return coinLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(coinLabel)
        updateViewConstraints()
        configView()
    }
    
    func configView() {
        self.title = "Coin Details"
        coinLabel.text = viewModel.coinName
        
    }
    
    init(viewModel: CoinDetailsViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        NSLayoutConstraint.activate([
            coinLabel.heightAnchor.constraint(equalToConstant: 100),
            coinLabel.widthAnchor.constraint(equalToConstant: 150),
            coinLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    

}
