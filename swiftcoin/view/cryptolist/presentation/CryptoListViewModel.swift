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
            let data2 = try await getDataFromCloud().all.map { (it) -> UICrypto in
                UICrypto(id: it.id, name: it.title, symbol: it.openingCrawl, price: it.releaseDate)
            }
            print("data 2 \(data2)")
            self.uiState = .showDataView(data2)
        }catch{
            self.uiState = .showErrorView
        }
    }
    
    enum ViewModelError: Error {
        case runtimeError(String)
    }
    

    func getDataFromCloud() async throws -> Films {
        try await withUnsafeThrowingContinuation { continuation in
            AF.request("https://swapi.dev/api/films").responseDecodable(of: Films.self) { (response) in
                if let data = response.value {
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
