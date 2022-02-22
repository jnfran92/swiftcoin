//
//  CryptoListView.swift
//  swiftcoin
//
//  Created by usuario on 21-02-22.
//

import SwiftUI

struct CryptoListView: View {
    
    var dataViewVisibility = true
    var loadingViewVisibility = false
    var errorViewVisibility = false
    
    @ObservedObject var viewModel: CryptoListViewModel
    
    var body: some View {
//        VStack{
            
            switch viewModel.uiState {
            case .defaultView:
//                print(".defaultView")
                LoadingView(visibility: loadingViewVisibility)
            case .showErrorView:
//                print(".errorView")
                LoadingView(visibility: loadingViewVisibility)
            case .showDataView(let data):
//                print(".showDataView")
                LoadingView(visibility: loadingViewVisibility)
            case .showLoadingView:
//                print(".showLoadingView")
                LoadingView(visibility: loadingViewVisibility)
            }
            
//            if(dataViewVisibility){
//                NavigationView {
//                    List(cryptoList, id: \.id){ cryptoItem in
//                        NavigationLink{
//                            CryptoDetailsView()
//                        } label: {
//                            CryptoItemView(uiCrypto: cryptoItem)
//                        }
//                    }
//                    .navigationTitle("Swiftcoin")
//                }
//            }
            
            LoadingView(visibility: loadingViewVisibility)
//            ErrorView(visibility: errorViewVisibility)
//        }
    }
}


//func showDataView(cryptoList: [UICrypto]) -> NavigationView<Content: View>{
//    return NavigationView {
//        List(cryptoList, id: \.id){ cryptoItem in
//            NavigationLink{
//                CryptoDetailsView()
//            } label: {
//                CryptoItemView(uiCrypto: cryptoItem)
//            }
//        }
//        .navigationTitle("Swiftcoin")
//    }
//}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView(viewModel: CryptoListViewModel())
    }
}
