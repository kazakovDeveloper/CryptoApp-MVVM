//
//  ViewModel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 23.11.2022.
//

import Foundation

class CoinCellViewModel: TableViewCellViewModel {
    
    private var coin: CryptoCoin?
    
    var name: String {
        return coin?.slug ?? "No data"
    }
    
    var symbol: String {
        return coin?.symbol ?? "No data"
    }
    
    var price: String {
        return String(describing: coin?.marketData?.priceUSD)
    }
    
    var id: String {
        return coin?.id ?? "No data"
    }
    
    var imageURL: URL? {
        return makeImageURL(coin?.id ?? "")
    }
    
    init(coin: CryptoCoin) {
        self.coin = coin
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "https://asset-images.messari.io/images/\(imageCode)/64.png?v=2)")
    }
    
}

