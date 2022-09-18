//
//  ContentView.swift
//  Shorts
//
//  Created by jinho on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ShortsListView()
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
