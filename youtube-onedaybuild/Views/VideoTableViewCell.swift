//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 6/17/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

  
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell (_ v:Video) {
        
        // Ensure that we have video
        
        
        
        self.video = v
        
        guard self.video != nil else {
            
            return
        }
        // Set the title
        self.titleLabel.text = video?.title
        
        //Set the date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        
        guard self.video?.thumbnail != "" else {
            return
        }
        // Check cache before download data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        //Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        // Get the shared URL Session object
        let session = URLSession.shared
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            
            if error == nil && data != nil {
                //save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                //Set the imageView
                DispatchQueue.main.async {self.thumbnailImageView.image = image}
        }
            
        }
        //Start datatask
        dataTask.resume()
        
    }
    
}
