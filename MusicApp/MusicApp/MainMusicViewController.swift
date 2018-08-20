//
//  MainMusicViewController.swift
//  MusicApp
//
//  Created by Sahithi Kalvakota on 7/6/18.
//  Copyright © 2018 Sahithi Kalvakota. All rights reserved.
//

import UIKit

class MainMusicViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{

    let buttonColor = UIColor(red: 8/255, green: 8/255, blue: 10/255, alpha: 1.0)
    
    //hardcoded song data
    let song1 = Song(songName: "Hello", artistName: "Adele", albumName: "Adele", image: #imageLiteral(resourceName: "Hello"))
    let song2 = Song(songName: "Empty Cups", artistName: "Charlie Puth", albumName: "Voice Notes", image: #imageLiteral(resourceName: "voicenotes"))
    let song3 = Song(songName: "Somebody Told Me That You Got Another", artistName: "Charlie Puth", albumName: "Voice Notes", image: #imageLiteral(resourceName: "voicenotes"))
    let song4 = Song(songName: "New Year's Day", artistName: "Taylor Swift", albumName: "Reputation", image: #imageLiteral(resourceName: "reputation"))
    let song5 = Song(songName: "One Call Away", artistName: "Charlie Puth", albumName: "Nine Track Mind", image: #imageLiteral(resourceName: "onecallaway"))
    let song6 = Song(songName: "This is Why We Can't Have Nice Things", artistName: "Taylor Swift", albumName: "Reputation", image: #imageLiteral(resourceName: "reputation"))
    let song7 = Song(songName: "Red", artistName: "Taylor Swift", albumName: "red", image: #imageLiteral(resourceName: "red"))
     let song8 = Song(songName: "Slow It down", artistName: "Charlie Puth", albumName: "Voice Notes", image: #imageLiteral(resourceName: "voicenotes"))
    let song9 = Song(songName: "All Too Well", artistName: "Taylor Swift", albumName: "Red", image: #imageLiteral(resourceName: "red"))

    //playlist of songs
    var songList : [Song] = []
    
    var selectedSong = Song(songName: "New Year's Day", artistName: "Taylor Swift", albumName: "Reputation", image: #imageLiteral(resourceName: "reputation"))  //hardcoded currently selected song
    var selectedSongImage : UIImageView! //blurred imageView for selected song
    var smallSelectedSongImage : UIImageView! //clear mini imageView for selected song
    
    var tableView : UITableView!
    
    var rightButton : UIBarButtonItem!  //right bar button: "edit" for hosts (allows playlist editing) and "+" for attendees (adds songs to playlist)
    
    var partyKeyLabel : UILabel!    //specifies party entrance code
    
    var shapeLayer : CAShapeLayer!  //shapeLayer for music progress bar
    
    var currentSongLabel : UILabel!
    var currentArtistLabel : UILabel!
    
    var currentInfoButton : UIButton!   //info button for currently playing song
    
    var isHost : Bool!  //true if user is host, false otherwise
    var partyKey : String!  //string with party entrance code
    
    //initializes Main Music View Controller with whether user is host (isHost) and party entrance code (partyKey)
    init(isHost : Bool, partyKey : String){
        self.isHost = isHost
        self.partyKey = partyKey
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add hardcoded songs to playlist
        songList.append(song1)
        songList.append(song2)
        songList.append(song3)
        songList.append(song4)
        songList.append(song5)
        songList.append(song6)
        songList.append(song7)
        songList.append(song8)
        songList.append(song9)
        
        //set up tableview for playlist
        tableView = UITableView()
        tableView.bounces = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: "songCell")
        tableView.register(ExpandedSongTableViewCell.self, forCellReuseIdentifier: "expandedCell")
        tableView.backgroundColor = .clear
        tableView.allowsMultipleSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //set up right navigation bar button: "Edit" if user is host or "+" if user is event attendee
        if isHost {
            rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editDoneButtonPressed))
            navigationItem.rightBarButtonItem = rightButton
        }
        else {
            rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self , action: #selector(addButtonPressed))
            navigationItem.rightBarButtonItem = rightButton
        }
        
        //set up party key label
        partyKeyLabel = UILabel()
        if let key = partyKey {
            partyKeyLabel.text = "Party Key : \(key)"
        }
        partyKeyLabel.textColor = .white
        partyKeyLabel.font = .systemFont(ofSize: 16)
        partyKeyLabel.alpha = 0.5
        partyKeyLabel.translatesAutoresizingMaskIntoConstraints = false

        //set up clear mini image of current song
        smallSelectedSongImage = UIImageView(image: selectedSong.image)
        smallSelectedSongImage.layer.masksToBounds = true
        smallSelectedSongImage.layer.cornerRadius = 115
        smallSelectedSongImage.translatesAutoresizingMaskIntoConstraints = false
        
        //set up blurred, large selected song image of current song
        selectedSongImage = UIImageView(image: blurImage(image: selectedSong.image))
        selectedSongImage.alpha = 0.50
        selectedSongImage.translatesAutoresizingMaskIntoConstraints = false
        
        //create and setup current song's progress bar
        shapeLayer = CAShapeLayer()
        let center = CGPoint(x: view.frame.width/2, y: (6*view.frame.width)/14)
        
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: view.frame.width / 3 , startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        
        //set up current song's name label
        currentSongLabel = UILabel()
        currentSongLabel.textColor = .white
        currentSongLabel.text = selectedSong.songName
        currentSongLabel.font = .systemFont(ofSize: 35)
        currentSongLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //set up current song's artist label
        currentArtistLabel = UILabel()
        currentArtistLabel.textColor = .white
        currentArtistLabel.text = selectedSong.artistName
        currentArtistLabel.font = .systemFont(ofSize: 22)
        currentArtistLabel.alpha = 0.5
        currentArtistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //set up current song's info button
        currentInfoButton = UIButton(type: .infoLight)
        currentInfoButton.tintColor = .white
        currentInfoButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(currentSongLabel)
        view.addSubview(tableView)
        view.addSubview(selectedSongImage)
        view.addSubview(smallSelectedSongImage)
        view.addSubview(currentArtistLabel)
        view.layer.addSublayer(shapeLayer)
        view.addSubview(currentInfoButton)
        
        view.bringSubview(toFront: currentArtistLabel)
        view.bringSubview(toFront: currentSongLabel)
        setupConstraints()
        songProgressStarts()

    }
    
    //starts current songs progress bar and ends when song has ended
    @objc private func songProgressStarts() {
        print("Attempting to animate stroke")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 10
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "pathAnimation")
    }
    
    //blurs background image of selected song
    func blurImage(image:UIImage) -> UIImage? {
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: image)
        let originalOrientation = image.imageOrientation
        let originalScale = image.scale
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(10.0, forKey: kCIInputRadiusKey)
        let outputImage = filter?.outputImage
        
        var cgImage:CGImage?
        
        if let asd = outputImage
        {
            cgImage = context.createCGImage(asd, from: (inputImage?.extent)!)
        }
        
        if let cgImageA = cgImage
        {
            return UIImage(cgImage: cgImageA, scale: originalScale, orientation: originalOrientation)
        }
        
        return nil
    }
    
    //set layout of view controller
    func setupConstraints(){
        
        //selected song image layout
        NSLayoutConstraint.activate([
            selectedSongImage.topAnchor.constraint(equalTo: view.topAnchor),
            selectedSongImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            selectedSongImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            selectedSongImage.heightAnchor.constraint(equalToConstant: view.frame.width)])
        
        //current song name label layout
        NSLayoutConstraint.activate([
            currentSongLabel.centerXAnchor.constraint(equalTo: selectedSongImage.centerXAnchor),
            currentSongLabel.topAnchor.constraint(equalTo: smallSelectedSongImage.bottomAnchor, constant: 16),
            currentSongLabel.widthAnchor.constraint(equalToConstant: currentSongLabel.intrinsicContentSize.width)])
        
        //current song artist name layout
        NSLayoutConstraint.activate([
            currentArtistLabel.centerXAnchor.constraint(equalTo: selectedSongImage.centerXAnchor),
            currentArtistLabel.topAnchor.constraint(equalTo: currentSongLabel.bottomAnchor),
            currentArtistLabel.widthAnchor.constraint(equalToConstant: currentArtistLabel.intrinsicContentSize.width)])
        
        //small selected song image layout
        NSLayoutConstraint.activate([
            smallSelectedSongImage.centerXAnchor.constraint(equalTo: selectedSongImage.centerXAnchor),
            smallSelectedSongImage.centerYAnchor.constraint(equalTo: selectedSongImage.centerYAnchor, constant: -view.frame.width/14),
            smallSelectedSongImage.heightAnchor.constraint(equalToConstant: view.frame.width/1.65),
            smallSelectedSongImage.widthAnchor.constraint(equalToConstant: view.frame.width/1.65)])
        
        //tableview layout
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: selectedSongImage.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        //current song info button layout
        NSLayoutConstraint.activate([
            currentInfoButton.bottomAnchor.constraint(equalTo: selectedSongImage.bottomAnchor, constant: -12),
            currentInfoButton.trailingAnchor.constraint(equalTo: selectedSongImage.trailingAnchor, constant: -12)])
        

    }
    
    //when host presses "edit" button, editing mode starts, allowing him/her to move and delete elements in the playlist
    @objc func editDoneButtonPressed(sender: UIBarButtonItem){
        tableView.setEditing(!tableView.isEditing, animated: true)
        sender.title = (tableView.isEditing) ? "Done" : "Edit"
    }
    
    //when an event attendee presses the "+" button, he/she goes to a search controller screen to search for and add a song
    @objc func addButtonPressed(sender: UIBarButtonItem){
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = songList[sourceIndexPath.row]
        songList.remove(at: sourceIndexPath.row)
        songList.insert(temp, at: destinationIndexPath.row)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        if tableView.isEditing {
            return UITableViewCellEditingStyle.delete
        }
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            songList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if songList[indexPath.row].isExpanded  {
            return 150
        }
        return 60
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let selectedSong = songList[indexPath.row]
        
        if selectedSong.isExpanded {
            let cell = tableView.dequeueReusableCell(withIdentifier: "expandedCell") as! ExpandedSongTableViewCell
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            cell.songNameLabel.text = selectedSong.songName
            cell.artistNameLabel.text = selectedSong.artistName
            cell.albumImage.image = selectedSong.image
            cell.scoreLabel.text = String(selectedSong.score)
            
            
            if songList[indexPath.row].score < 0 {
                cell.scoreLabel.textColor = .red
            }
            else {
                cell.scoreLabel.textColor = .white
            }
            
            if selectedSong.voteCounter == -1 {
                cell.upButton.isEnabled = true
                cell.upButton.alpha = 1.0
                cell.downButton.isEnabled = false
                cell.downButton.alpha = 0.5
            }
            else if selectedSong.voteCounter == 1 {
                cell.downButton.isEnabled = true
                cell.downButton.alpha = 1.0
                cell.upButton.isEnabled = false
                cell.upButton.alpha = 0.5
            }
            else {
                cell.downButton.isEnabled = true
                cell.downButton.alpha = 1.0
                cell.upButton.isEnabled = true
                cell.upButton.alpha = 1.0
            }
            
            cell.backgroundColor = .clear
            
            cell.downButton.tag = indexPath.row
            cell.downButton.addTarget(self, action: #selector(downButtonPressed), for: .touchUpInside)
            
            cell.upButton.tag = indexPath.row
            cell.upButton.addTarget(self, action: #selector(upButtonPressed), for: .touchUpInside)
            
            
            cell.setNeedsUpdateConstraints()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! SongTableViewCell
            cell.songNameLabel.text = selectedSong.songName
            cell.artistNameLabel.text = selectedSong.artistName
            cell.albumImage.image = selectedSong.image
            cell.scoreLabel.text = String(selectedSong.score)
            
            
            if songList[indexPath.row].score < 0 {
                cell.scoreLabel.textColor = .red
            }
            else {
                cell.scoreLabel.textColor = .white
            }
            
            if selectedSong.voteCounter == -1 {
                cell.upButton.isEnabled = true
                cell.upButton.alpha = 1.0
                cell.downButton.isEnabled = false
                cell.downButton.alpha = 0.5
            }
            else if selectedSong.voteCounter == 1 {
                cell.downButton.isEnabled = true
                cell.downButton.alpha = 1.0
                cell.upButton.isEnabled = false
                cell.upButton.alpha = 0.5
            }
            else {
                cell.downButton.isEnabled = true
                cell.downButton.alpha = 1.0
                cell.upButton.isEnabled = true
                cell.upButton.alpha = 1.0
            }
            

            cell.backgroundColor = .clear
            
            cell.downButton.tag = indexPath.row
            cell.downButton.addTarget(self, action: #selector(downButtonPressed), for: .touchUpInside)
            
            cell.upButton.tag = indexPath.row
            cell.upButton.addTarget(self, action: #selector(upButtonPressed), for: .touchUpInside)
            
            
            cell.setNeedsUpdateConstraints()
            return cell
        }
        
    }
    

    @objc func downButtonPressed(sender: UIButton) {
        songList[sender.tag].score = songList[sender.tag].score - 1
        songList[sender.tag].voteCounter = songList[sender.tag].voteCounter - 1
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    @objc func upButtonPressed(sender: UIButton) {
        songList[sender.tag].score = songList[sender.tag].score + 1
        songList[sender.tag].voteCounter = songList[sender.tag].voteCounter + 1
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        songList[indexPath.row].isExpanded = !songList[indexPath.row].isExpanded
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        songList[indexPath.row].isExpanded = !songList[indexPath.row].isExpanded

        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()

    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
