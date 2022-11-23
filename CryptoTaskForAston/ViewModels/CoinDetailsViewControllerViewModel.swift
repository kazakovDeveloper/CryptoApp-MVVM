//
//  CoinDetailsViewControllerViewModel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 23.11.2022.
//

import Foundation
import UIKit


class CoinDetailsViewControllerViewModel {
    
    var networkManager = NetworkManager.shared
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    private var Photo = [URL]()
    
    private var currentPhoto = UIImage()
    
    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    private init() {
        NetworkManager.shared.getAllCryptoData { [weak self] result in
            switch result {
                
            case .success(let coins):
                self?.viewModels = coins.compactMap({
                    CryptoTableViewCellViewModel(name: $0.name ,
                                                 symbol: $0.symbol,
                                                 price: String($0.currentPrice),
                                                 image: $0.image)
                })
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
            
  
        
    }
    
}

}
