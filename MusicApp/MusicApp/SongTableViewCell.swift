//
//  SongTableViewCell.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/6/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    var songNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumImage : UIImageView!
    var scoreLabel : UILabel!

    var downButton : UIButton!
    var upButton : UIButton!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        

            
        songNameLabel = UILabel()
        songNameLabel.textColor = .white
        songNameLabel.font = .systemFont(ofSize: 18)
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artistNameLabel = UILabel()
        artistNameLabel.textColor = .white
        artistNameLabel.font = .systemFont(ofSize: 16)
        artistNameLabel.alpha = 0.7
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumImage = UIImageView()
        albumImage.layer.masksToBounds = true
        albumImage.layer.cornerRadius = 25
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
        
        
        contentView.addSubview(songNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(albumImage)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(downButton)
        contentView.addSubview(upButton)
        
    
    }
    
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            albumImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            albumImage.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            albumImage.widthAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height * 0.75)),
            albumImage.heightAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height * 0.75))
            ])
        
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 8),
            songNameLabel.topAnchor.constraint(equalTo: albumImage.topAnchor),
            songNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
            ])
        
        
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
            ])
        
        
        NSLayoutConstraint.activate([
            downButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -57),
            downButton.bottomAnchor.constraint(equalTo: albumImage.bottomAnchor),
            downButton.heightAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height) / 3)
            
            ])
        
        NSLayoutConstraint.activate([
            upButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -57),
            upButton.topAnchor.constraint(equalTo: albumImage.topAnchor),
            upButton.heightAnchor.constraint(equalToConstant: CGFloat(contentView.frame.height) / 3)
            ])
        
        NSLayoutConstraint.activate([
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        
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


