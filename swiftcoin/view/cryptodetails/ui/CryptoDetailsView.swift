//
//  CryptoDetailsView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoDetailsView: View {
    
    var uiCrypto: UICrypto
    
    var body: some View {
        VStack(){
            DetailsRowView(title: "Name", icon: "person", content: self.uiCrypto.name)
            DetailsRowView(title: "Symbol", icon: "cube.fill", content: self.uiCrypto.symbol)
            DetailsRowView(title: "Slug", icon: "lightbulb", content: self.uiCrypto.name)
            DetailsRowView(title: "Price", icon: "dollarsign.square.fill", content: "\(self.uiCrypto.usdPrice.price)")
            Spacer()
        }.navigationTitle(uiCrypto.name)
    }
}

struct DetailsRowView: View {
    
    var title: String
    var icon: String
    var content: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.yellow)
            VStack(alignment: .leading){
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                Text(content)
            }
            Spacer()
        }.padding()
    }
}


struct CryptoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailsView(
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
