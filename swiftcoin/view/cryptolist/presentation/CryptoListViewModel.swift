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
            let data = try await getCryptosData()
            self.uiState = .showDataView(data)
        }catch{
            self.uiState = .showErrorView
        }
    }
    
    enum ViewModelError: Error {
        case runtimeError(String)
    }
    
    func getCryptosData() async throws -> [UICrypto]{
        print("getCryptosData()")
        let cryptoList = [
            UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
            UICrypto(id: 1, name: "Ethreum", symbol: "ETH", price: "$200.00"),
            UICrypto(id: 2, name: "LiteCoin", symbol: "LTC", price: "$300.00"),
            UICrypto(id: 3, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
            UICrypto(id: 4, name: "Ethreum", symbol: "ETH", price: "$200.00"),
            UICrypto(id: 5, name: "LiteCoin", symbol: "LTC", price: "$300.00")
        ]
        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        throw ViewModelError.runtimeError("error getting data")
        //        return cryptoList
    }
    
    func loadDataAsync() async {
        do {
            print("loadDataAsync()")
            let data = try await self.getDataFromCloud()
            print("Data:")
            print(data)
        }catch {
            print("Error \(error)")
        }
    }
    
    func getDataFromCloud() async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            AF.request("https://swapi.dev/api/films").responseData { response in
                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {
                    continuation.resume(throwing: err)
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
