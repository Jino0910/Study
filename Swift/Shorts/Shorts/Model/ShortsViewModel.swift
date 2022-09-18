//
//  ShortsViewModel.swift
//  Shorts
//
//  Created by jinho on 2022/09/18.
//

import Foundation
import Combine

class ShortsViewModel: ObservableObject {
    
    @Published var items: [ShortsItem] = [
        ShortsItem(writer: "", title: "title1", description: "", videoURL: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
        ShortsItem(writer: "", title: "title2", description: "", videoURL: "http://playertest.longtailvideo.com/adaptive/wowzaid3/playlist.m3u8"),
        ShortsItem(writer: "", title: "title5", description: "", videoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"),
        ShortsItem(writer: "", title: "title4", description: "", videoURL: "http://nasatv-lh.akamaihd.net/i/NASA_101@319270/index_1000_av-p.m3u8?sd=10&rebase=on"),
    ]
    
    @Published var newItems: Int = 0
    
    func addItems() {
        
        
        let newItems =
        [
            
            ShortsItem(writer: "", title: "title6", description: "", videoURL: "http://walterebert.com/playground/video/hls/sintel-trailer.m3u8"),
            ShortsItem(writer: "", title: "title7", description: "", videoURL: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"),
            ShortsItem(writer: "", title: "title8", description: "", videoURL: "https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"),
            ]
       

        self.items += newItems
        self.newItems = newItems.count
    }
}
