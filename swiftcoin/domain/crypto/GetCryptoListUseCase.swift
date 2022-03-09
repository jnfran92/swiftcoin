//
//  GetCryptoList.swift
//  swiftcoin
//
//  Created by usuario on 01-03-22.
//

import Foundation
import Alamofire
import Combine

struct GetCryptoListUseCase {
    
   let cryptoRemoteRepository: CryptoRemoteSource
    
    func invoke() -> AnyPublisher<[DomainCrypto], AppError> {
        
        let local = CryptoLocalSource()
        local.addCrypto()
        local.getCryptoList()
        
        
        return self.cryptoRemoteRepository
            .getLatestCryptoList()
    }
}
