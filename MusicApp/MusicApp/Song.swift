//
//  Song.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/6/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class Song{
    
    var songName : String
    var artistName: String
    var albumName : String
    var score : Int
    var image : UIImage
    var voteCounter : Int
    var isExpanded : Bool
    
    init(songName: String, artistName: String, albumName: String, image: UIImage) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.score = 0
        self.image = image
        self.voteCounter = 0
        self.isExpanded = false
        
    }
    
}
