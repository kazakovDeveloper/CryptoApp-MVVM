//
//  Models.swift
//  CryptoTaskForAston
//
//  Created by Kazakov Danil on 16.11.2022.
//

import Foundation

struct CryptoCoin: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: URL
    let currentPrice: Float
    let hight24H: Float
    let low24H: Float
    let priceChange24H: Float
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case currentPrice = "current_price"
        case hight24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
    }
    
}


