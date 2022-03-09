//
//  CryptoApiRequest.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct RemoteApiRequest: Decodable {
    let status: RemoteApiRequestStatus?
    let data: [RemoteCrypto]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
