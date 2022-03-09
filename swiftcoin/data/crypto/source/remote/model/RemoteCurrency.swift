//
//  CurrencyRemote.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct RemoteCurrency : Decodable{
    let price: Double?
    let marketCap: Double?
    let volume24h: Double?
    let percentChange1h: Double?
    let percentChange24h: Double?
    let percentChange7d: Double?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case price = "price"
        case marketCap = "market_cap"
        case volume24h = "volume_24h"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
}
