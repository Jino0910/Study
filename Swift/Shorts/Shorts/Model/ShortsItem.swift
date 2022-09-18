//
//  ShortsItem.swift
//  Shorts
//
//  Created by jinho on 2022/09/17.
//

import Foundation
import SwiftUI

struct ShortsItem: Identifiable, Equatable {
    
    let id = UUID()
    let writer: String
    let title: String
    let description: String
    let videoURL: String
}

struct Shorts {
    let items: [ShortsItem]
}
