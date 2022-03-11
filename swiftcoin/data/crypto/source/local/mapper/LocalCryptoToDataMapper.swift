//
//  LocalCryptoToDataMapper.swift
//  swiftcoin
//
//  Created by usuario on 11-03-22.
//

import Foundation
import RealmSwift

struct LocalCryptoToDataMapper{
    
    func transform(item: LocalCrypto) -> DataCrypto {
        let dataPrice = DataPrice(
            price: item.usdPrice?.price ?? 0.0,
            marketCap: item.usdPrice?.price ?? 0.0,
            volume24h: item.usdPrice?.price ?? 0.0,
            percentChange1h: item.usdPrice?.price ?? 0.0,
            percentChange24h: item.usdPrice?.price ?? 0.0,
            percentChange7d: item.usdPrice?.price ?? 0.0,
            lastUpdated: item.usdPrice?.lastUpdated ?? ""
        )
        let tags = Array(item.tags.map{$0})
        return DataCrypto(
            id: item.remoteId,
            name: item.name,
            symbol: item.symbol,
            slug: item.slug,
            usdPrice: dataPrice,
            tags: tags,
            cmcRank: item.cmcRank,
            circulatingSupply: item.circulatingSupply,
            totalSupply: item.totalSupply,
            maxSupply: item.maxSupply
        )
    }
    
    func transform(item: DataCrypto) -> LocalCrypto {
        let localCrypto = LocalCrypto()
        let localPrice = LocalPrice()
        let tags = List<String>()
        tags.append(objectsIn: item.tags)
        
        localPrice.price = item.usdPrice.price
        localPrice.marketCap = item.usdPrice.marketCap
        localPrice.volume24h = item.usdPrice.volume24h
        localPrice.percentChange1h = item.usdPrice.percentChange1h
        localPrice.percentChange24h = item.usdPrice.percentChange24h
        localPrice.percentChange7d = item.usdPrice.percentChange7d
        localPrice.lastUpdated = item.usdPrice.lastUpdated
        
        localCrypto.remoteId = item.id
        localCrypto.name = item.name
        localCrypto.symbol = item.symbol
        localCrypto.slug = item.slug
        localCrypto.usdPrice = localPrice
        localCrypto.tags = tags
        localCrypto.cmcRank = item.cmcRank
        localCrypto.circulatingSupply = item.circulatingSupply
        localCrypto.totalSupply = item.totalSupply
        localCrypto.maxSupply = item.maxSupply
        
        return localCrypto
    }
    
}
