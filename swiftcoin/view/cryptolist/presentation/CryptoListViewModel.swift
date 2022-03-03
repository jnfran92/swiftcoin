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
    
    // mapper
    private let domainCryptoToUIMapper: DomainCryptoToUIMapper
    
    // disposables
    private var cancellableSet: Set<AnyCancellable> = []
    
    // uiState
    @Published var uiState: CryptoListUIState = .defaultView
    
    
    init(getCryptoListUsCase: GetCryptoListUseCase, domainCryptoToUIMapper: DomainCryptoToUIMapper) {
        print("CryptoListViewModel init")
        self.getCryptoListUsCase = getCryptoListUsCase
        self.domainCryptoToUIMapper = domainCryptoToUIMapper
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
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(_):
                    self.uiState = .showErrorView
                case .finished:
                    return
                }
            }, receiveValue: { domainCrypto in
                let out = domainCrypto.map{self.domainCryptoToUIMapper.transform(item: $0)}
                self.uiState = .showDataView(out)
            })
            .store(in: &cancellableSet)
    }
}
