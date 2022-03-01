//
//  Crypto.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation


struct CryptoRemote: Decodable{
    
    let cryptoId: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let quote: QuoteRemote?
    let tags: [String]?
    let cmcRank: Int?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    
    enum CodingKeys: String, CodingKey {
        case cryptoId = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
        case quote = "quote"
        case tags = "tags"
        case cmcRank = "cmc_rank"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
    }
    
}
