//
//  CryptoListView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoListView: View {
    
    
    var cryptoList = [
        UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 1, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 2, name: "LiteCoin", symbol: "LTC", price: "$300.00"),
        UICrypto(id: 3, name: "Bticoin Lite", symbol: "BTC", price: "$100.00"),
        UICrypto(id: 4, name: "Ethreum", symbol: "ETH", price: "$200.00"),
        UICrypto(id: 5, name: "LiteCoin", symbol: "LTC", price: "$300.00")
    ]
    
    
    var dataViewVisibility = false
    var loadingViewVisibility = false
    var errorViewVisibility = true
    
    var body: some View {
        VStack{
            if(dataViewVisibility){
                NavigationView {
                    List(cryptoList, id: \.id){ cryptoItem in
                        NavigationLink{
                            CryptoDetailsView()
                        } label: {
                            CryptoItemView(uiCrypto: cryptoItem)
                        }
                    }
                    .navigationTitle("Swiftcoin")
                }
            }
            
            LoadingView(visibility: loadingViewVisibility)
            ErrorView(visibility: errorViewVisibility)
        }
    }
}


struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
