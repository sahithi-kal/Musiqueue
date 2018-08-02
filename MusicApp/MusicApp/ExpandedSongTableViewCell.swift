//
//  ExpandedSongTableViewCell.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/8/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit
import AVFoundation

class ExpandedSongTableViewCell: UITableViewCell {
    
    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumImage : UIImageView!
    var scoreLabel : UILabel!
    
    var downButton : UIButton!
    var upButton : UIButton!
    var songInfoButton : UIButton!
    
    
    var audioSlider : UISlider!
    
    
//    var playButton : UIButton!
    
//    var previewPlayer : AVAudioPlayer!
//    let url = Bundle.main.url(forResource: "example", withExtension: "mp3")!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        
//        do {
//            previewPlayer = try AVAudioPlayer(contentsOf: url)
//            previewPlayer?.play()
//        } catch {
//
//        }
        
        
        
        
        songNameLabel = UILabel()
        songNameLabel.textColor = .white
        songNameLabel.font = .systemFont(ofSize: 18)
        songNameLabel.lineBreakMode = .byTruncatingTail
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artistNameLabel = UILabel()
        artistNameLabel.textColor = .white
        artistNameLabel.font = .systemFont(ofSize: 18)
        artistNameLabel.alpha = 0.7
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumImage = UIImageView()
        albumImage.layer.masksToBounds = true
        albumImage.layer.cornerRadius = 5
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        
        scoreLabel = UILabel()
        scoreLabel.textColor = .white
        scoreLabel.font = .systemFont(ofSize: 25)
        scoreLabel.textAlignment = .center
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        downButton = UIButton(type: .system)
        downButton.setTitle("\u{2228}", for: .normal)
        downButton.setTitleColor(.white, for: .normal)
        downButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 22)
        downButton.translatesAutoresizingMaskIntoConstraints = false
        
        upButton = UIButton(type: .system)
        upButton.setTitle("\u{2227}", for: .normal)
        upButton.setTitleColor(.white, for: .normal)
        upButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 22)
        upButton.translatesAutoresizingMaskIntoConstraints = false
        
        songInfoButton = UIButton(type: .infoLight)
        songInfoButton.tintColor = .white
        songInfoButton.translatesAutoresizingMaskIntoConstraints = false
        
//        playButton = UIButton(type: .system)
//        playButton.setTitle("\u{25B6}", for: .normal)
//        playButton.setTitleColor(.white, for: .normal)
//        playButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 22)
//        playButton.translatesAutoresizingMaskIntoConstraints = false
        
//        audioSlider = UISlider()
//        audioSlider.isContinuous = true
//        audioSlider.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(songNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(albumImage)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(downButton)
        contentView.addSubview(upButton)
        contentView.addSubview(songInfoButton)
//        contentView.addSubview(audioSlider)
        
        
    }
    
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            albumImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            albumImage.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            albumImage.widthAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height) * 0.80),
            albumImage.heightAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height) * 0.80)
            ])
        
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 8),
            songNameLabel.topAnchor.constraint(equalTo: albumImage.topAnchor),
            songNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            ])
        
        
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
            ])
        
        
        NSLayoutConstraint.activate([
            songInfoButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            songInfoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)])
        
        NSLayoutConstraint.activate([
            upButton.centerXAnchor.constraint(equalTo: songInfoButton.centerXAnchor),
            upButton.topAnchor.constraint(equalTo: songNameLabel.topAnchor, constant: -8),
            upButton.heightAnchor.constraint(equalToConstant: upButton.intrinsicContentSize.height)
            ])
    
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: upButton.centerXAnchor),
            scoreLabel.topAnchor.constraint(equalTo:upButton.bottomAnchor),
            scoreLabel.widthAnchor.constraint(equalToConstant: scoreLabel.intrinsicContentSize.width)
            ])
        
        
        NSLayoutConstraint.activate([
            downButton.centerXAnchor.constraint(equalTo: songInfoButton.centerXAnchor),
            downButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            downButton.heightAnchor.constraint(equalToConstant: downButton.intrinsicContentSize.height)
            ])
        
        


//
//        NSLayoutConstraint.activate([
//            playButton.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
//            playButton.cen])
//
//        NSLayoutConstraint.activate([
//            audioSlider.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
//            audioSlider.trailingAnchor.constraint(equalTo: songNameLabel.trailingAnchor),
//            audioSlider.centerYAnchor.constraint(equalTo: downButton.centerYAnchor),
//            audioSlider.topAnchor.constraint(equalTo: )
//            ])
        
        
        super.updateConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        if selected {
//            songNameLabel.textColor = .black
//        }
//        else {
//            songNameLabel.textColor = .white
//        }
        
        // Configure the view for the selected state
    }
    
}


