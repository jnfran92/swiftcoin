//
//  CryptoListView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoListView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Swiftcoin")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    Text("Crypto currencies matters!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }.padding()
            
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
                    Text("Bitcoin")
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(Color.blue)
                    HStack{
                        Text("Price: ")
                            .fontWeight(.medium)
                        Text("$10.00")
                    }
                }
                .padding()
                Spacer()
            }.padding()
            Divider()
            Spacer()
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
