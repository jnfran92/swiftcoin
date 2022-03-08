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
    
    let localRealm = try! Realm()
    
    init(){
        print("init Local Repo")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func addCrypto() {
        print("addCrypto")
        let item = LocalCrypto()
        item.name = "Bitcoin2"
        try! localRealm.write({
            localRealm.add(item)
        })
    }
    
    
    func getCryptoList(){
        print("getCryptoList")
        let items = localRealm.objects(LocalCrypto.self)
//        let data = items.
        print("getCryptoList items \(items)")
    }
}
