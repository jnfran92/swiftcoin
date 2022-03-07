//
//  CryptoLocalRepository.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation
import RealmSwift


struct CryptoLocalRepository {
    
    let localRealm = try! Realm()
    
    
    func addCrypto() {
        print("addCrypto")
        let item = LocalCrypto(
        name: "Bit", symbol: "BT", slug: "BT IS Best"
        )
        try! localRealm.write({
            localRealm.add(item)
        })
    }
    
    
    func getCryptoList(){
        print("getCryptoList")
        let items = localRealm.objects(LocalCrypto.self)
        print("getCryptoList items \(items)")
    }
    

}
