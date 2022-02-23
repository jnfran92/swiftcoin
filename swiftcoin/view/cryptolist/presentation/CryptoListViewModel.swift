//
//  CryptoListViewModel.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    
    var cryptoList = [
        UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 1, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 2, name: "LiteCoin", symbol: "LTC", price: "$300.00"),
        UICrypto(id: 3, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 4, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 5, name: "LiteCoin", symbol: "LTC", price: "$300.00")
    ]
    
    enum CryptoListUIState {
        case defaultView
        case showLoadingView
        case showErrorView
        case showDataView([UICrypto])
    }
    
    @Published var uiState: CryptoListUIState = .defaultView
    
    init() {
        print("CryptoListViewModel init")
        loadData()
    }
    
    func loadData(){
        print("loadData START")
        self.uiState = .defaultView
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("loadData DONE")
            self.uiState = .showDataView(self.cryptoList)
        }
    }
}
