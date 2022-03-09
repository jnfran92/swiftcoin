//
//  CurrencyToDomainMapper.swift
//  swiftcoin
//
//  Created by usuario on 04-03-22.
//

import Foundation

struct CurrencyToDomainMapper {
    
    func transform(item: RemoteCurrency?) -> DomainCurrency{
        if let itemNotNull = item{
            return DomainCurrency(
                price: itemNotNull.price ?? 0.0,
                marketCap: itemNotNull.marketCap ?? 0.0,
                volume24h: itemNotNull.volume24h ?? 0.0,
                percentChange1h: itemNotNull.percentChange1h ?? 0.0,
                percentChange24h: itemNotNull.percentChange24h ?? 0.0,
                percentChange7d: itemNotNull.percentChange7d ?? 0.0,
                lastUpdated: itemNotNull.lastUpdated ?? ""
            )
        }else{
            return DomainCurrency(
                price: 0.0,
                marketCap: 0.0,
                volume24h: 0.0,
                percentChange1h: 0.0,
                percentChange24h: 0.0,
                percentChange7d: 0.0,
                lastUpdated: ""
            )
        }
    }
}
