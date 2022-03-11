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
        
            let domainCurrencyToUIMapper = DomainCurrencyToUIMapper()
            let domainCryptoToUIMapper = DomainCryptoToUIMapper(domainCurrencyToUIMapper: domainCurrencyToUIMapper)
            
            
            let remoteCurrencyToDataMapper = RemoteCurrencyToDataMapper()
            let remoteCryptoToDataMapper = RemoteCryptoToDataMapper(remoteCurrencyToDataMapper: remoteCurrencyToDataMapper)
            
            
            let cryptoRemoteSource = CryptoRemoteSource(remoteCryptoToDataMapper: remoteCryptoToDataMapper)
            
            let dataPriceToDomainMapper = DataPriceToDomainMapper()
            let dataCryptoToDomainMapper = DataCryptoToDomainMapper(dataPriceToDomainMapper: dataPriceToDomainMapper)
            
            let localCryptoToDataMapper = LocalCryptoToDataMapper()
            let cryptoLocalSource = CryptoLocalSource(localCryptoToDataMapper: localCryptoToDataMapper)
            
            let cryptoRepository = CryptoRepository(
                cryptoRemoteSource: cryptoRemoteSource, cryptoLocalSource: cryptoLocalSource,
                dataCryptoToDomainMapper: dataCryptoToDomainMapper)
            
            let getCryptoListUseCase = GetCryptoListUseCase(cryptoRepository: cryptoRepository)
            
            let cryptoViewModel = CryptoListViewModel(getCryptoListUsCase: getCryptoListUseCase, domainCryptoToUIMapper: domainCryptoToUIMapper)
            CryptoListView(viewModel: cryptoViewModel)
        }
    }
}
