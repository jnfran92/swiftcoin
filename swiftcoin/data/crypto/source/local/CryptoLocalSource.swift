//
//  CryptoLocalRepository.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation
import RealmSwift
import UIKit


struct CryptoLocalSource {
    
    let realm: Realm
    
    func addCrypto() {
        print("addCrypto")
        let item = LocalCrypto()
        item.name = "Bitcoin2"
        try! realm.write({
            realm.add(item)
        })
    }
    
    
    func getCryptoList(){
        print("getCryptoList")
        let items = realm.objects(LocalCrypto.self)
//        let data = items.
        print("getCryptoList items \(items)")
    }
}
