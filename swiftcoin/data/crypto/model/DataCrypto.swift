//
//  Crypto.swift
//  swiftcoin
//
//  Created by usuario on 09-03-22.
//

import Foundation


struct DataCrypto {
    var id: Int
    var name: String
    var symbol: String
    var slug: String
    var usdPrice: DataPrice
    var tags: [String]
    var cmcRank: Int
    var circulatingSupply: Double
    var totalSupply: Double
    var maxSupply: Double
}
