//
//  CryptoApiRequestStatus.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation

struct CryptoApiRequestStatus: Decodable {
    let errorCode:Int
    
    enum CodingKeys: String, CodingKey {
      case errorCode = "error_code"
    }
}
