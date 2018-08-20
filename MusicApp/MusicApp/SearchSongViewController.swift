//
//  SearchViewController.swift
//
//
//  Created by Sahithi Kalvakota on 4/17/18.
//

import UIKit
import AVFoundation

class SearchSongViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    var searchController : UISearchController!
    var timer: Timer?
    
    let songSearchCellIdentifier = "SongCell"
    
    //list of songs in searchList
    var songs: [Song] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        title = "Search for Songs"
        
        //set up search controller
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Song Title"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: songSearchCellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: songSearchCellIdentifier)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = "Songs: \(song.artistName)"
        cell.detailTextLabel?.alpha = 0.5
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let song = songs[indexPath.row]
//        if let preview = song.link{
//            UIApplication.shared.open(preview)
//        }
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    

    
}
