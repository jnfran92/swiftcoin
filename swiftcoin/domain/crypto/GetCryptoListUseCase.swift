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
        return self.cryptoRemoteRepository
            .getLatestCryptoList()
            .map { cryptoApiRequest -> [DomainCrypto] in
                let domainCryptoList = cryptoApiRequest.data?.map { crypto in
                    DomainCrypto(
                        id: crypto.cryptoId ?? 0,
                        name: crypto.name ?? "",
                        symbol: crypto.symbol ?? "",
                        price: crypto.quote?.usd?.price ?? 0.0
                    )
                } ?? []
                return domainCryptoList
            }
            .eraseToAnyPublisher()
    }
}
