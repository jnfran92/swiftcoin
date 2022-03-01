//
//  CryptoListViewModel.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

@MainActor
class CryptoListViewModel: ObservableObject {
    
    @Published var uiState: CryptoListUIState = .defaultView
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        print("CryptoListViewModel init")
        loadData3()
        //        Task{
        //            try await loadData()
        //        }
    }
    
    deinit {
        print("deinit")
    }
    
    func loadData() async throws{
        print("loadData START")
        do{
            self.uiState = .showLoadingView
            let data = try await getDataFromCloud().data!.enumerated().map{ (idx, it) -> UICrypto in
                UICrypto(id: it.cryptoId ?? 0, name: it.name ?? "", symbol: it.symbol ?? "", price: "\(it.quote?.usd?.price ?? 0.0)")
            }
            print("data 2 \(data)")
            self.uiState = .showDataView(data)
        }catch{
            self.uiState = .showErrorView
        }
    }
    
    
    func loadData2(){
        print("loadData2")
        self.uiState = .showLoadingView
        getDataFromCloud2().sink { dataResponse in
            if dataResponse.error != nil {
                self.uiState = .showErrorView
            } else {
                let data = dataResponse.value!.data!.enumerated().map{ (idx, it) -> UICrypto in
                    UICrypto(id: it.cryptoId ?? 0, name: it.name ?? "", symbol: it.symbol ?? "", price: "\(it.quote?.usd?.price ?? 0.0)")
                }
                self.uiState = .showDataView(data)
            }
        }.store(in: &cancellableSet)
    }
    
    func loadData3(){
        print("loadData3")
        self.uiState = .showLoadingView
        getDataFromCloud3()
            .sink(receiveCompletion: { data in
                print(data)
            }, receiveValue: { data in
                print(data)
            })
            .store(in: &cancellableSet)
    }
    
    
    enum ViewModelError: Error {
        case runtimeError(String)
    }
    
    
    let headers: HTTPHeaders = [
        "X-CMC_PRO_API_KEY": "bacdbc14-d7d9-4a0c-8ec5-77351a6be042"
    ]
    let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")!
    
    
    func getDataFromCloud() async throws -> CryptoApiRequest {
        try await withUnsafeThrowingContinuation { continuation in
            AF.request("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest", headers: headers).responseDecodable(of: CryptoApiRequest.self) { (response) in
                if let data = response.value {
                    print("returning data \(data)")
                    continuation.resume(returning: data)
                    return
                }
                if let error = response.error {
                    print("returning error \(error)")
                    continuation.resume(throwing: error)
                    return
                }
                fatalError("should not get here")
            }
        }
    }
    
    
    func getDataFromCloud2() -> AnyPublisher<DataResponse<CryptoApiRequest, CryptoListViewModel.ViewModelError>, Never> {
        return AF.request(url, headers: headers)
            .validate()
            .publishDecodable(type: CryptoApiRequest.self)
            .map{ response in
                response.mapError { error in
                    return ViewModelError.runtimeError("error: \(error)")
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getDataFromCloud3() -> AnyPublisher<CryptoApiRequest, CryptoListViewModel.ViewModelError> {
        return AF.request(url, headers: headers)
            .validate()
            .publishDecodable(type: CryptoApiRequest.self)
            .tryMap{ dataResponse in
                if dataResponse.error != nil {
                    throw ViewModelError.runtimeError("error:")
                } else {
                    return dataResponse.value!
                }
            }
            .mapError{ error in
                ViewModelError.runtimeError("error: \(error)")
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func cancel(){
        print("cancel")
    }
}
