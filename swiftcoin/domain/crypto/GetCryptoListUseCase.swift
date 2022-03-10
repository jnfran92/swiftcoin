//
//  GetCryptoList.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation
import Alamofire
import Combine
import RealmSwift

struct GetCryptoListUseCase {
    
    let cryptoRepository: CryptoRepository
//    let realm = try! Realm()
    
    
    func invoke() -> AnyPublisher<[DomainCrypto], AppError> {
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        let local = CryptoLocalSource(realm: realm)
//        local.addCrypto()
//        local.getCryptoList()
        return self.cryptoRepository
            .getCryptoList()
    }
}
