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
        
    // use cases
    private let getCryptoListUsCase: GetCryptoListUseCase
    
    // uiState
    @Published var uiState: CryptoListUIState = .defaultView
    
    // disposables
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    init(getCryptoListUsCase: GetCryptoListUseCase) {
        print("CryptoListViewModel init")
        self.getCryptoListUsCase = getCryptoListUsCase
        loadData()
    }
    
    deinit {
        print("deinit")
    }
    
   
    func loadData(){
        print("loadData")
        self.uiState = .showLoadingView
        self.getCryptoListUsCase
            .invoke()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(_):
                    self.uiState = .showErrorView
                case .finished:
                    return
                }
            }, receiveValue: { request in
                let out = request.data!.enumerated().map{ (idx, it) -> UICrypto in
                    UICrypto(id: it.cryptoId ?? 0, name: it.name ?? "", symbol: it.symbol ?? "", price: "\(it.quote?.usd?.price ?? 0.0)")
                }
                self.uiState = .showDataView(out)
            })
            .store(in: &cancellableSet)
    }
}
