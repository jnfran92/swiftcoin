//
//  CryptoLocalRepository.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation
import RealmSwift
import UIKit
import Combine


struct CryptoLocalSource {
    
    let realm: Realm
    
    func addCrypto(item: DataCrypto) -> AnyPublisher<Bool, AppError> {
        return Deferred{
            Future{promise in
                do{
                    let localCrypto = LocalCrypto()
                    localCrypto.name = item.name
                    try realm.write({
                        realm.add(localCrypto)
                    })
                    promise(.success(true))
                }catch{
                    promise(.failure(AppError.dataError("Error on write Realm local crypto")))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getCryptoList() -> AnyPublisher<[DataCrypto], AppError>{
        return Deferred{
            Future{promise in
                let items = Array(realm.objects(LocalCrypto.self).map{$0})
                    .map { item in
                    DataCrypto(
                        id: 0, name: item.name, symbol: item.symbol, slug: item.slug, usdPrice: DataPrice(price: item.usdPrice?.price ?? 0.0, marketCap: item.usdPrice?.price ?? 0.0, volume24h: item.usdPrice?.price ?? 0.0, percentChange1h: item.usdPrice?.price ?? 0.0, percentChange24h: item.usdPrice?.price ?? 0.0, percentChange7d: item.usdPrice?.price ?? 0.0, lastUpdated: item.usdPrice?.lastUpdated ?? ""), tags: [], cmcRank: item.cmcRank, circulatingSupply: item.circulatingSupply, totalSupply: item.totalSupply, maxSupply: item.maxSupply)
                }
                promise(.success(items))
            }
        }.eraseToAnyPublisher()
    }
}
