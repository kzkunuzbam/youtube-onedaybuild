//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 5/27/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //Set it self as Datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
   //Set model delegate
        model.delegate = self
       
        model.get_videos()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Confirm that video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get a reference of the video that wes tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
   //MARK: - Video delegate method
     
    func VideoFetched(_ videos: [Video]) {
        //Set the returned videos to our video property
        self.videos = videos
        
        //refresh the table view
        tableView.reloadData()
    }
    // MARK: - Table view methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
    // Configure the cell with data
   
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
    // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

