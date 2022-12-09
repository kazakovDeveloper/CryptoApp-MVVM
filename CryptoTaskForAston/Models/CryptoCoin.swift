//
//  Models.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import Foundation

class CryptoCoin: Decodable {
    
   let id: String?
   let symbol: String?
   let slug: String?
   dynamic var marketData: MarketData?
    
    class MarketData: Decodable {
        
        var priceUSD: Double?
        
        enum CodingKeys: String, CodingKey {
            case priceUSD = "price_usd"
        }
        
        init(priceUSD: Double?) {
            self.priceUSD = priceUSD
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case symbol, slug, id
        case marketData = "market_data"
    }

    init(id: String?, symbol: String?, slug: String?, marketData: MarketData?) {
        self.id = id
        self.symbol = symbol
        self.slug = slug
        self.marketData = marketData
    }
    
}
