//
//  CryptoRepository.swift
//  swiftcoin
//
//  Created by usuario on 03-03-22.
//

import Foundation
import Alamofire
import Combine

struct CryptoRemoteRepository {
    
    let cryptoToDomainMapper: CryptoToDomainMapper
    
    let headers: HTTPHeaders = ["X-CMC_PRO_API_KEY": "bacdbc14-d7d9-4a0c-8ec5-77351a6be042"]
    let url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    
    func getLatestCryptoList() -> AnyPublisher<[DomainCrypto], AppError> {
        return AF.request(url, headers: headers)
            .validate()
            .publishDecodable(type: CryptoApiRequest.self)
            .tryMap{ dataResponse -> CryptoApiRequest in
                if dataResponse.error != nil {
                    throw AppError.dataError(dataResponse.error?.errorDescription ?? "unknown error")
                } else {
                    return dataResponse.value!
                }
            }
            .mapError{ error in
                AppError.dataError("error")
            }
            .eraseToAnyPublisher()
            .map { cryptoApiRequest -> [DomainCrypto] in
                return cryptoApiRequest.data?.map {self.cryptoToDomainMapper.transform(crypto: $0)} ?? []
            }
            .eraseToAnyPublisher()
    }
}
