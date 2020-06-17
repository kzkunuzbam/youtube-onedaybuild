//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 5/27/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func VideoFetched (_ videos:[Video])
}

class Model{
    
    
    var delegate: ModelDelegate?
    func get_videos() {
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Greate a URLSession object
        let session = URLSession.shared
        
        
        //Get the data task from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
        //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            do {
            //Parsion the data into video objects
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(Response.self, from: data!)
            
                
            if response.items != nil {
                DispatchQueue.main.async {
                // Call the "videoFetched" method of the delegate
                    self.delegate?.VideoFetched(response.items!)
                }
                }
            //dump(response)
                
            }
            catch (let error){
                print("This is error \(error) .")
            }
        }
        
        //Kick of the task
        dataTask.resume()
    }
    
}
