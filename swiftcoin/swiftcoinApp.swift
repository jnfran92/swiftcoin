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
            let currencyToDomainMapper = CurrencyToDomainMapper()
            let domainCurrencyToUIMapper = DomainCurrencyToUIMapper()
            let domainCryptoToUIMapper = DomainCryptoToUIMapper(domainCurrencyToUIMapper: domainCurrencyToUIMapper)
            let cryptoToDomainMapper = CryptoToDomainMapper(currencyToDomainMapper: currencyToDomainMapper)
            let cryptoRemoteRepository = CryptoRemoteRepository(cryptoToDomainMapper: cryptoToDomainMapper)
            let getCryptoListUseCase = GetCryptoListUseCase(cryptoRemoteRepository: cryptoRemoteRepository)
            let cryptoViewModel = CryptoListViewModel(getCryptoListUsCase: getCryptoListUseCase, domainCryptoToUIMapper: domainCryptoToUIMapper)
            CryptoListView(viewModel: cryptoViewModel)
        }
    }
}
