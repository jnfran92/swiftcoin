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
    let cryptoLocalSource: CryptoLocalSource
    let dataCryptoToDomainMapper: DataCryptoToDomainMapper
    
    func getCryptoList() -> AnyPublisher<[DomainCrypto], AppError> {
        return cryptoRemoteSource.getLatestCryptoList()
            .flatMap { dataCryptos in
                Publishers.MergeMany(
                    dataCryptos.map { dataCrypto in
                        cryptoLocalSource.addCrypto(item: dataCrypto)
                    }
                ).collect()
                    .eraseToAnyPublisher()
            }.map{ _ -> [DataCrypto] in [] }
            .append(cryptoLocalSource.getCryptoList())
            .map(dataCryptoToDomainMapper.transform)
            .eraseToAnyPublisher()
    }
}
