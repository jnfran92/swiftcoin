//
//  CryptoItemView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoItemView: View {
    
    var uiCrypto: UICrypto
    
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                
                Circle()
                    .foregroundColor(Color.yellow)
                //                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay {
                        Text(uiCrypto.symbol.uppercased())
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                
                VStack(alignment: .leading) {
                    Text(uiCrypto.name)
                        .font(.title2)
                        .foregroundColor(Color.blue)
                    HStack{
                        Text("Price: ")
                            .foregroundColor(.secondary)
                        Text(uiCrypto.price)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                Spacer()
            }.padding(5.0)
        }
    }
}

struct CryptoItemView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItemView(
            uiCrypto: UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00")
        )
    }
}
