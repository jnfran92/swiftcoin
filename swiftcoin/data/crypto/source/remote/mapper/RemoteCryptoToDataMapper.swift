//
//  CryptoToDomainMapper.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation

struct RemoteCryptoToDataMapper {
    
    let remoteCurrencyToDataMapper: RemoteCurrencyToDataMapper
    
    func transform(item: RemoteCrypto) -> DataCrypto{
        print("transform \(item)")
        return DataCrypto(
            id: item.cryptoId ?? 0,
            name: item.name ?? "",
            symbol: item.symbol ?? "",
            slug: item.slug ?? "",
            usdPrice: remoteCurrencyToDataMapper.transform(item: item.quote?.usd),
            tags: item.tags ?? [],
            cmcRank: item.cmcRank ?? 0,
            circulatingSupply: item.circulatingSupply ?? 0.0,
            totalSupply: item.totalSupply ?? 0.0,
            maxSupply: item.maxSupply ?? 0.0
        )
    }
}
