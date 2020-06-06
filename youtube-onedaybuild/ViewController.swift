//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 5/27/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        model.get_videos()
        
    }


}

