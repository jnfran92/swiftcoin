//
//  LoadingView.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
            VStack {
                ProgressView()
                    .padding()
                Text("Loading...")
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
