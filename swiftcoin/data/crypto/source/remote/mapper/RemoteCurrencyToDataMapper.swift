//
//  CurrencyToDomainMapper.swift
//  swiftcoin
//
//  Created by usuario on 04-03-22.
//

import Foundation

struct RemoteCurrencyToDataMapper {
    
    func transform(item: RemoteCurrency?) -> DataPrice{
        return DataPrice(
            price: item?.price ?? 0.0,
            marketCap: item?.marketCap ?? 0.0,
            volume24h: item?.volume24h ?? 0.0,
            percentChange1h: item?.percentChange1h ?? 0.0,
            percentChange24h: item?.percentChange24h ?? 0.0,
            percentChange7d: item?.percentChange7d ?? 0.0,
            lastUpdated: item?.lastUpdated ?? ""
        )
    }
}
