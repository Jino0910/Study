//
//  PlayerViewCell.swift
//  Shorts
//
//  Created by jinho on 2022/09/18.
//

import UIKit
import AVFoundation

class PlayerViewCell: UICollectionViewCell {
    
    static let identifier = "PlayerViewCell"
    
    var writerLabel = UILabel()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    private let videoContainer = UIView()
    
    var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .black
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit PlayerViewCell")
    }
    
    private func addSubviews() {
        contentView.addSubview(videoContainer)
        
        videoContainer.clipsToBounds = true
        contentView.sendSubviewToBack(videoContainer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        videoContainer.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        writerLabel.text = ""
        titleLabel.text = ""
        descriptionLabel.text = ""
        player = nil
    }
    
    public func configure(with model: ShortsItem) {
        self.configureVideo(model)
        
        writerLabel.text = model.writer
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    private func configureVideo(_ model: ShortsItem) {
        guard let url = URL(string: model.videoURL) else { return }
        player = AVPlayer(url: url)
        
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 0
        player?.play()
    }
}
