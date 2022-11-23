//
//  CryptoTableViewCellViewModel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import Foundation

class CryptoTableViewCellViewModel: NSObject {
    
    private var networkManager: NetworkManager!
    private(set) var empData: [CryptoCoin]! {
        didSet {
            self.bindCryptoCoinViewModelToController()
        }
    }
    
    var bindCryptoCoinViewModelToController: (() -> ()) = {}
    
    
    override init() {
        super.init()
        self.networkManager = NetworkManager.shared
        callFuncToGetEmpData()
        
    }
    
    func callFuncToGetEmpData() {
        
        self.networkManager.getAllCryptoData { (empData) in
            switch empData {
            case .success(let cryptoData):
                self.empData = cryptoData
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
        
        
        
        
//        self.networkManager.getAllCryptoData { [weak self] result in
//            switch result {
//            case .success(let models):
//                self?.viewModels = models.compactMap({ CryptoTableViewCellViewModel(name: $0.name,
//                                                                                    symbol: $0.symbol,
//                                                                                    price: String($0.currentPrice),
//                                                                                    image: $0.image)
//                })
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print("Error \(error)")
//            }
//        }
//
//
//        self.networkManager.getAllCryptoData { result in
//            print(result)
//        }
    }
}


