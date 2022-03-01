//
//  CryptoApiRequest.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct CryptoApiRequest: Decodable {
    let status: CryptoApiRequestStatus?
    let data: [CryptoRemote]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
