//
//  QuoteRemote.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct RemoteQuote: Decodable{
    let usd: RemoteCurrency?
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
