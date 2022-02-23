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
            DetailsRowView(title: "Price", icon: "dollarsign.square.fill", content: self.uiCrypto.price)
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
            uiCrypto: UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00")
        )
    }
}
