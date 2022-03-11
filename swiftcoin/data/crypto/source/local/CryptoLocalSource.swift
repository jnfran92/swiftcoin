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
    let localCryptoToDataMapper: LocalCryptoToDataMapper
    
    func addCrypto(item: DataCrypto) -> AnyPublisher<Bool, AppError> {
        return Deferred{
            Future{promise in
                do{
                    let localCrypto = localCryptoToDataMapper.transform(item: item)
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
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return Deferred{
            Future{promise in
                let items = Array(realm.objects(LocalCrypto.self).map{$0})
                    .map (localCryptoToDataMapper.transform)
                promise(.success(items))
            }
        }.eraseToAnyPublisher()
    }
}
