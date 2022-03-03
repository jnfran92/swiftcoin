//
//  swiftcoinApp.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

@main
struct swiftcoinApp: App {
    var body: some Scene {
        WindowGroup {
            let cryptoRemoteRepository = CryptoRemoteRepository()
            let getCryptoListUseCase = GetCryptoListUseCase(cryptoRemoteRepository: cryptoRemoteRepository)
            let cryptoViewModel = CryptoListViewModel(getCryptoListUsCase: getCryptoListUseCase)
            CryptoListView(viewModel: cryptoViewModel)
        }
    }
}
