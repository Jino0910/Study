//
//  HeaderView.swift
//  Shorts
//
//  Created by jinho on 2022/09/18.
//

import SwiftUI

struct HeaderView: View {
    
    var viewModel: ShortsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("plus")
                    viewModel.addItems()
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(20)
                }
                Spacer()
                Button(action: {
                    print("close")
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(20)
                }
            }
            .padding(.top, 30)
            Spacer()
        }
    }
}
