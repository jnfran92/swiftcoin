//
//  CryptoItemView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI
import AFNetworking

struct CryptoItemView: View {
    
    var uiCrypto: UICrypto
    
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                
                Circle()
                    .foregroundColor(Color.yellow)
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
                        Text("\(uiCrypto.usdPrice.price)")
                            .foregroundColor(.primary)
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
            uiCrypto: UICrypto(
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
        )
    }
}
