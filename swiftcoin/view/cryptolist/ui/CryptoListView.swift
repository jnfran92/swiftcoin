//
//  CryptoListView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoListView: View {
    
    @ObservedObject var viewModel: CryptoListViewModel
    
    var body: some View {
        VStack{
            switch viewModel.uiState {
            case .defaultView:
                LoadingView()
            case .showLoadingView:
                LoadingView()
            case .showErrorView:
                ErrorView()
            case .showDataView(let data):
                DataView(uiCryptoList: data)
            }
        }
    }
    
    struct DataView: View{
        
        var uiCryptoList: [UICrypto]
        
        var body: some View {
            NavigationView {
                List(uiCryptoList, id: \.id){ item in
                    NavigationLink{
                        CryptoDetailsView(uiCrypto: item)
                    } label: {
                        CryptoItemView(uiCrypto: item)
                    }
                }
                .navigationTitle("Swiftcoin")
            }
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
        
    static var cryptoList = [
        UICrypto(
            id: 0,
            name: "name",
            symbol: "symbol",
            slug: "slug",
            usdPrice: UICurrency(
                price: 0.0,
                marketCap:  0.0,
                volume24h:  0.0,
                percentChange1h:  0.0,
                percentChange24h: 0.0,
                percentChange7d: 0.0,
                lastUpdated: "12/12/2020"
            ),
            tags: ["a","b","c"],
            cmcRank: 0,
            circulatingSupply: 0.0,
            totalSupply: 0.0,
            maxSupply: 0.0
        ),
        UICrypto(
            id: 0,
            name: "name",
            symbol: "symbol",
            slug: "slug",
            usdPrice: UICurrency(
                price: 0.0,
                marketCap:  0.0,
                volume24h:  0.0,
                percentChange1h:  0.0,
                percentChange24h: 0.0,
                percentChange7d: 0.0,
                lastUpdated: "12/12/2020"
            ),
            tags: ["a","b","c"],
            cmcRank: 0,
            circulatingSupply: 0.0,
            totalSupply: 0.0,
            maxSupply: 0.0
        )
    ]
    
    static var previews: some View {
//        CryptoListView(viewModel: CryptoListViewModel())
        CryptoListView.DataView(
            uiCryptoList: self.cryptoList
        )
    }
}
