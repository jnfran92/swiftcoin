//
//  DomainCrypto.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation

struct DomainCrypto: Hashable, Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let usdPrice: DomainPrice
    let tags: [String]
    let cmcRank: Int
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double
}
