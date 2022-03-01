//
//  CryptoListViewModel.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import Foundation
import Alamofire

@MainActor
class CryptoListViewModel: ObservableObject {
    
    @Published var uiState: CryptoListUIState = .defaultView
    
    init() {
        print("CryptoListViewModel init")
        Task{
            try await loadData()
        }
    }
    
    deinit {
        print("deinit")
    }
    
    func loadData() async throws{
        print("loadData START")
        do{
            self.uiState = .showLoadingView
            let data = try await getDataFromCloud().data.enumerated().map{ (idx, it) -> UICrypto in
                UICrypto(id: idx, name: it.name, symbol: it.symbol, price: "0.0")
            }
            print("data 2 \(data)")
            self.uiState = .showDataView(data)
        }catch{
            self.uiState = .showErrorView
        }
    }
    
    enum ViewModelError: Error {
        case runtimeError(String)
    }
    
    
    let headers: HTTPHeaders = [
        "X-CMC_PRO_API_KEY": "bacdbc14-d7d9-4a0c-8ec5-77351a6be042"
    ]
    

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
    
    func cancel(){
        print("cancel")
    }
}
