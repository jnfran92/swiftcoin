//
//  DataCryptoToDomainMapper.swift
//  swiftcoin
//
//  Created by usuario on 09-03-22.
//

import Foundation

struct DataCryptoToDomainMapper{
    
    let dataPriceToDomainMapper: DataPriceToDomainMapper
    
    func transform(item: DataCrypto) -> DomainCrypto{
        return DomainCrypto(
            id: item.id,
            name: item.name,
            symbol: item.symbol,
            slug: item.slug,
            usdPrice: dataPriceToDomainMapper.transform(item: item.usdPrice),
            tags: item.tags,
            cmcRank: item.cmcRank,
            circulatingSupply: item.circulatingSupply,
            totalSupply: item.totalSupply,
            maxSupply: item.maxSupply
        )
    }
    
    func transform(items: [DataCrypto]) -> [DomainCrypto] {
        return items.map { self.transform(item: $0)}
    }
}
