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
        HStack(alignment: .center) {
            Image("bitcoin")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.yellow, lineWidth: 4)
                }

            VStack(alignment: .leading) {
                Text(uiCrypto.name)
                    .font(.title2)
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
                HStack{
                    Text("Price: ")
                        .fontWeight(.medium)
                    Text(uiCrypto.price)
                }
            }
            .padding()
            Spacer()
        }.padding()
        Divider()
    }
}

struct CryptoItemView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoItemView(
            uiCrypto: UICrypto(id: 0, name: "Bticoin Lite", symbol: "BTC", price: "$100.00")
        )
    }
}
