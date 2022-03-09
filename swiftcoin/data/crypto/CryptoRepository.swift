//
//  CryptoRepository.swift
//  swiftcoin
//
//  Created by usuario on 08-03-22.
//

import Foundation
import Combine

struct CryptoRepository{
    
    let cryptoRemoteSource: CryptoRemoteSource
    let dataCryptoToDomainMapper: DataCryptoToDomainMapper
    
    func getCryptoList() -> AnyPublisher<[DomainCrypto], AppError> {
        return self.cryptoRemoteSource.getLatestCryptoList()
            .map{ dataCryptoToDomainMapper.transform(items: $0) }
            .eraseToAnyPublisher()
    }
}
