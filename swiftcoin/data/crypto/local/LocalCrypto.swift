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
//    @Persisted let cryptoId: Int?
    @Persisted var name: String
    @Persisted var symbol: String
    @Persisted var slug: String
//    @Persisted let quote: Quote?
    @Persisted var tags: List<String>
    @Persisted var cmcRank: Int
    @Persisted var circulatingSupply: Double
    @Persisted var totalSupply: Double
    @Persisted var maxSupply: Double
}
