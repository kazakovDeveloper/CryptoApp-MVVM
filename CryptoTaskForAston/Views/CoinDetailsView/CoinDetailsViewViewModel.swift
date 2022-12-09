//
//  CoinDetailsViewControllerViewModel.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 23.11.2022.
//

import Foundation
import UIKit


class CoinDetailsViewViewModel {
    
    var cryptoCoin: CryptoCoin
    
    var coinName: String
    
    init(cryptoCoin: CryptoCoin) {
        self.cryptoCoin = cryptoCoin
        
        self.coinName = cryptoCoin.slug ?? "default"
    }
    
    
}

