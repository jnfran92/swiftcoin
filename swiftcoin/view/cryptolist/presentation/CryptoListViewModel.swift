//
//  CryptoListViewModel.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import Foundation
import Alamofire

class CryptoListViewModel: ObservableObject {
    
    @Published var uiState: CryptoListUIState = .defaultView
    
    init() {
        print("CryptoListViewModel init")
        loadData()
    }
    
    func loadData(){
        print("loadData START")
        self.uiState = .defaultView
        Task{
            print("load request")
            let request = AF.request("https://swapi.dev/api/films")
            request.responseJSON { (data) in
                  print( "DATA JSON ALAMOFIRE: \(data)")
                }
            print("request quequed")
            try await self.uiState = .showDataView(getCryptosData())
            print("request quequed 2 ")
        }
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
        
//        let request = AF.request("https://swapi.dev/api/films")
//        request.responseJSON { (data) in
//              print( "DATA JSON ALAMOFIRE: \(data)")
//            }
        
        
        return cryptoList
    }
    
}
