//
//  swiftcoinApp.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

@main
struct swiftcoinApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoListView(viewModel: CryptoListViewModel())
//            CryptoListView()
        }
    }
}
