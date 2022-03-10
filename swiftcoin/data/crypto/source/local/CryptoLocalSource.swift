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
    
//    let realm: Realm
    let realm = try! Realm()
    
    func addCrypto(item: DataCrypto) -> AnyPublisher<Bool, AppError> {
        print("addCrypto")
        return Deferred{
            Future{promise in
                do{
                    let localCrypto = LocalCrypto()
                    localCrypto.name = item.name
                    localCrypto.symbol = item.symbol
                    
                    let localPrice = LocalPrice()
                    localPrice.price = item.usdPrice.price
                    
                    localCrypto.usdPrice = localPrice
                    print("save crypto: \(localCrypto) ")
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
        print("getCryptoList")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return Deferred{
            Future{promise in
                print("Future and promise getCrypto")
                let items = Array(realm.objects(LocalCrypto.self).map{$0})
                    .map { item in
                        DataCrypto(
                            id: Int.random(in: 1..<1000), name: item.name, symbol: item.symbol, slug: item.slug, usdPrice: DataPrice(price: item.usdPrice?.price ?? 0.0, marketCap: item.usdPrice?.price ?? 0.0, volume24h: item.usdPrice?.price ?? 0.0, percentChange1h: item.usdPrice?.price ?? 0.0, percentChange24h: item.usdPrice?.price ?? 0.0, percentChange7d: item.usdPrice?.price ?? 0.0, lastUpdated: item.usdPrice?.lastUpdated ?? ""), tags: [], cmcRank: item.cmcRank, circulatingSupply: item.circulatingSupply, totalSupply: item.totalSupply, maxSupply: item.maxSupply)
                    }
                promise(.success(items))
            }
        }.eraseToAnyPublisher()
    }
}
