//
//  DomainCryptoToUiMapper.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation


struct DomainCryptoToUIMapper {
    
    let domainCurrencyToUIMapper: DomainCurrencyToUIMapper
    
    func transform(item: DomainCrypto) -> UICrypto{
        return UICrypto(
            id: item.id,
            name: item.name,
            symbol: item.symbol,
            slug: item.slug,
            usdPrice: domainCurrencyToUIMapper.transform(item: item.usdPrice),
            tags: item.tags,
            cmcRank: item.cmcRank,
            circulatingSupply: item.circulatingSupply,
            totalSupply: item.totalSupply,
            maxSupply: item.maxSupply
        )
    }
}
