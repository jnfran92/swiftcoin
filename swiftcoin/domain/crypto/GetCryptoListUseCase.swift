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
    
   let cryptoRemoteRepository: CryptoRemoteRepository
    
    func invoke() -> AnyPublisher<[DomainCrypto], AppError> {
        
        let local = CryptoLocalRepository()
        local.addCrypto()
        local.getCryptoList()
        
        
        return self.cryptoRemoteRepository
            .getLatestCryptoList()
    }
}
