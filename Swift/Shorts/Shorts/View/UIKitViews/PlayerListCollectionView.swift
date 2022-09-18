//
//  PlayerListCollectionView.swift
//  Shorts
//
//  Created by jinho on 2022/09/18.
//

import Foundation
import SwiftUI
import Combine

struct PlayerListCollectionView: UIViewRepresentable {
    
    var viewModel: ShortsViewModel
    
    func makeUIView(context: Context) -> UICollectionView {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = context.coordinator
        collectionView.isPagingEnabled = true
        collectionView.scrollsToTop = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(PlayerViewCell.self, forCellWithReuseIdentifier: "PlayerViewCell")
        
        context.coordinator.setCollectionView(collectionView)

        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
     
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        private let parent: PlayerListCollectionView
        private var collectionView: UICollectionView?
        var bag = Set<AnyCancellable>()
        
        init(_ parent: PlayerListCollectionView) {
            self.parent = parent
            super.init()
            
//            parent.viewModel.$newItems
//                .filter{ $0 > 0 }
//                .sink { [weak self]newItems in
//                    let indexPaths = (parent.viewModel.items.count-newItems..<parent.viewModel.items.count).map{ IndexPath(row: $0, section: 0) }
//                    print(indexPaths)
//                    self?.collectionView?.insertItems(at: indexPaths)
//                }
//                .store(in: &bag)
            
            parent.viewModel.$items
                .removeDuplicates()
                .sink { [weak self]items in
                    print("PlayerListCollectionView items event = \(items.count)")
                    self?.collectionView?.reloadData()
                }
                .store(in: &bag)
        }
        
        func setCollectionView(_ collectionView: UICollectionView) {
            self.collectionView = collectionView
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.viewModel.items.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerViewCell", for: indexPath) as! PlayerViewCell
            cell.configure(with: parent.viewModel.items[indexPath.row])
            return cell
        }
    }
}
