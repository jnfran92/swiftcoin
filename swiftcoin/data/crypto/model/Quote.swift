//
//  QuoteRemote.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct Quote: Decodable{
    let usd: Currency?
    
    enum CodingKeys: String, CodingKey {
      case usd = "USD"
    }
}
