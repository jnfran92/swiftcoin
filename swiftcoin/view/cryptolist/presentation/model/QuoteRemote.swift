//
//  QuoteRemote.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct QuoteRemote: Decodable{
    let usd: CurrencyRemote?
    
    enum CodingKeys: String, CodingKey {
      case usd = "USD"
    }
}
