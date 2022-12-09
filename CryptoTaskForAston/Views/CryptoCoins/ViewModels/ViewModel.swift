//
//  CoinTableViewCellViewModel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 24.11.2022.
//

import Foundation
import UIKit

class ViewModel: TableViewViewModelType {
    
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let coin = coins[indexPath.row]
        return TableViewCellViewModel(coin: coin)
    }
    
    var numberOfRows: Int {
        return coins.count
    }
    
    var isLoading: Observable<Bool> = Observable(false)
    var coins = [CryptoCoin]()
    var cellDataSource: Observable<[CoinCellViewModel]?> = Observable(nil)
    

    func getData() {
        if isLoading.value {
            return
        }
        isLoading.value = true
        
        NetworkManager.shared.getAllCoinsData { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                
                data.forEach { (key: String, value: CryptoCoin) in
                    guard let slug = value.slug,
                          let symbol = value.symbol,
                          let marketData = value.marketData,
                          let id = value.id else { return }
                    
                    if let index = self?.coins.firstIndex(where: {$0.slug == slug}) {
                        self?.coins[index].marketData.map({ $0.priceUSD = marketData.priceUSD! })
                        
                    } else {
                        self?.coins.append(CryptoCoin(id: id, symbol: symbol, slug: slug, marketData: marketData))
                    }
                    
                }
                
            case .failure(let error):
                print("Error: - \(error)")
            }
        }
    }

}
