//
//  ErrorView.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import SwiftUI

struct ErrorView: View {
    
    var body: some View {
        VStack {
            Image("bitcoin")
                .resizable()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.yellow, lineWidth: 5)
                }
                .shadow(radius: 5)
                .frame(width: 130, height: 130)
            Text("Swiftcoin")
                .font(.title)
                .foregroundColor(Color.yellow)
            Text("Ha ocurrido un error, reintenta mas tarde...")
            Button("Reintentar") {
                
            }
            .padding()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
