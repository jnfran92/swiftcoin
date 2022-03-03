//
//  DomainCrypto.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation

struct DomainCrypto: Hashable, Codable {
    let id: Int
    var name: String
    var symbol: String
    var price: Double
}
