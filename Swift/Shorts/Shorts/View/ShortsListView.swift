//
//  ShortsListView.swift
//  Shorts
//
//  Created by jinho on 2022/09/17.
//

import SwiftUI

struct ShortsListView: View {
    
    @StateObject var shortsViewModel = ShortsViewModel()

    var body: some View {
        ZStack {
            PlayerListCollectionView(viewModel: shortsViewModel)
            HeaderView(viewModel: shortsViewModel)
        }
    }
}

struct ShortsListView_Previews: PreviewProvider {
    static var previews: some View {
        ShortsListView()
    }
}
