//
//  ViewController.swift
//  ContextMenuInCollectionView
//
//  Created by jinho on 2021/12/06.
//

import UIKit

class ViewController: UIViewController {
    
    let imageNames = Array(1...6).map{ "image\($0)" }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    var favorites: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else { fatalError() }
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2 - 4, height: view.frame.size.width/2 - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(
            identifier: nil, previewProvider: nil
        ) { [weak self]_ in
            
            let open = UIAction(
                title: "Open",
                image: UIImage(systemName: "link"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off)
            { _ in
                print("Tapped open")
            }
            
            let favorite = UIAction(
                title: self?.favorites.contains(indexPath.row) == true ? "Remove Favorite" : "Favorite",
                image: UIImage(systemName: "star"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off)
            { [weak self]_ in
                if self?.favorites.contains(indexPath.row) == true {
                    self?.favorites.removeAll(where: { $0 == indexPath.row })
                } else {
                    self?.favorites.append(indexPath.row)
                }
                print("Tapped favorite")
            }
            
            let search = UIAction(
                title: "Search",
                image: UIImage(systemName: "magnifyingglass"),
                identifier: nil,
                discoverabilityTitle: nil,
                state: .off)
            { _ in
                print("Tapped search")
            }
            
            return UIMenu(
                title: "Actions",
                image: nil,
                identifier: nil,
                options: UIMenu.Options.displayInline,
                children: [open, favorite, search])
        }
        
        return config
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
