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
    
    func invoke() -> AnyPublisher<CryptoApiRequest, AppError> {
        let headers: HTTPHeaders = ["X-CMC_PRO_API_KEY": "bacdbc14-d7d9-4a0c-8ec5-77351a6be042"]
        let url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
        return AF.request(url, headers: headers)
            .validate()
            .publishDecodable(type: CryptoApiRequest.self)
            .tryMap{ dataResponse in
                if dataResponse.error != nil {
                    throw AppError.dataError(dataResponse.error?.errorDescription ?? "unknown error")
                } else {
                    return dataResponse.value!
                }
            }
            .mapError{ error in
                AppError.dataError("error")
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
