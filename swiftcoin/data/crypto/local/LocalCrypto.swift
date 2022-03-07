//
//  CryptoLocal.swift
//  swiftcoin
//
//  Created by usuario on 07-03-22.
//

import Foundation
import RealmSwift


class LocalCrypto: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var symbol: String
    @Persisted var slug: String
    
    
    convenience init(name: String, symbol: String, slug: String) {
        self.init()
        self.name = name
        self.symbol = symbol
        self.slug = slug
    }
}
