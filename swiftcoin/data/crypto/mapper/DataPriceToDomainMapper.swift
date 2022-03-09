//
//  DataPriceToDomainMapper.swift
//  swiftcoin
//
//  Created by usuario on 09-03-22.
//

import Foundation

struct DataPriceToDomainMapper{
    
    func transform(item: DataPrice) -> DomainPrice{
        return DomainPrice(
            price: item.price,
            marketCap: item.marketCap,
            volume24h: item.volume24h,
            percentChange1h: item.percentChange1h,
            percentChange24h: item.percentChange24h,
            percentChange7d: item.percentChange7d,
            lastUpdated: item.lastUpdated
        )
    }
}
