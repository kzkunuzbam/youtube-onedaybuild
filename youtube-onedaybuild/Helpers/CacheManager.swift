//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 6/17/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import Foundation
class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data:Data?) {
        cache[url] = data
    }
    static func getVideoCache(_ url:String) -> Data? {
        return cache[url]
    }
    
}
