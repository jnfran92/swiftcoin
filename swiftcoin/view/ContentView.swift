//
//  ContentView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Swiftcoin")
                        .font(.title)
                    .foregroundColor(.blue)
                    Text("Crypto currencies matters!")
                }
                Spacer()
            }.padding()
            
            Image("bitcoin")
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.yellow, lineWidth: 10)
                }
                .shadow(radius: 7)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
