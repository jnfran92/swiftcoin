//
//  UICrypto.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import Foundation

struct UICrypto: Hashable, Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let usdPrice: UICurrency
    let tags: [String]
    let cmcRank: Int
    let circulatingSupply: Double
    let totalSupply: Double
    let maxSupply: Double
}
