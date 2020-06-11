//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 5/27/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import Foundation
struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUGg988WhG6MICDcgBbHM4zA"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}
