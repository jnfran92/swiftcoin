//
//  LocalQuote.swift
//  swiftcoin
//
//  Created by usuario on 08-03-22.
//

import Foundation
import RealmSwift

class LocalPrice: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var price: Double
    @Persisted var marketCap: Double
    @Persisted var volume24h: Double
    @Persisted var percentChange1h: Double
    @Persisted var percentChange24h: Double
    @Persisted var percentChange7d: Double
    @Persisted var lastUpdated: String
}
