//
//  Feed.swift
//  json_with_gloss
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

public struct Feed: Decodable {
    
    public let entries: [App]?
    
    public init?(json: JSON) {
        entries = "entry" <~~ json
    }
    
}
