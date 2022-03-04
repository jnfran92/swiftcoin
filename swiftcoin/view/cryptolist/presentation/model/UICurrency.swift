//
//  UICurrency.swift
//  swiftcoin
//
//  Created by usuario on 04-03-22.
//

import Foundation

struct UICurrency: Hashable, Codable {
    let price: Double
    let marketCap: Double
    let volume24h: Double
    let percentChange1h: Double
    let percentChange24h: Double
    let percentChange7d: Double
    let lastUpdated: String
}
