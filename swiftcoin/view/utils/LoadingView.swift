//
//  LoadingView.swift
//  swiftcoin
//
//  Created by usuario on 22-02-22.
//

import SwiftUI

struct LoadingView: View {
    
    var visibility: Bool
    
    var body: some View {
        if(visibility){
            VStack {
                ProgressView()
                Text("Loading...")
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(visibility: true)
    }
}
