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
            
            Image("bitcoin")
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.yellow, lineWidth: 10)
                }
                .shadow(radius: 7)
            
            HStack {
                VStack(alignment: .center) {
                    Text("Swiftcoin")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                    Text("Crypto currencies matters!")
                }
            }.padding()
            

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
