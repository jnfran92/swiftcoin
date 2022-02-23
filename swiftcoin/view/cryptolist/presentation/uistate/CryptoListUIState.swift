//
//  CryptoListUIState.swift
//  swiftcoin
//
//  Created by usuario on 23-02-22.
//

import Foundation

enum CryptoListUIState {
    case defaultView
    case showLoadingView
    case showErrorView
    case showDataView([UICrypto])
}
