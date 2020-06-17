//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Murat Kunuzbayev on 6/3/20.
//  Copyright © 2020 Murat Kunuzbayev. All rights reserved.
//

import Foundation
struct Response: Decodable {
    var items:[Video]?
    enum CodingKeys:String, CodingKey {
        case items
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
