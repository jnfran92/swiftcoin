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
    
    func addCrypto(item: DataCrypto) -> AnyPublisher<DataCrypto, AppError> {
        let subject = PassthroughSubject<DataCrypto, AppError>()
        
        let item = LocalCrypto()
        item.name = "Bitcoin2"
        try! realm.write({
            realm.add(item)
        })
    }
    
    func writeCryptoToDB(item: LocalCrypto) -> Future<Bool, AppError>{
        Future{  promise in
            try! realm.write({
                realm.add(item)
            })
            promise(true)
        }
    }
    
    
    func getCryptoList(){
        print("getCryptoList")
        let items = realm.objects(LocalCrypto.self)
//        let data = items.
        print("getCryptoList items \(items)")
    }
}
