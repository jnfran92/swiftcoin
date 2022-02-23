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
        UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 1, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 2, name: "LiteCoin", symbol: "LTC", price: "$300.00"),
        UICrypto(id: 3, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 4, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 5, name: "LiteCoin", symbol: "LTC", price: "$300.00")
    ]
    
    static var previews: some View {
//        CryptoListView(viewModel: CryptoListViewModel())
        CryptoListView.DataView(
            uiCryptoList: self.cryptoList
        )
    }
}
