//
//  TopApps.swift
//  json_with_gloss
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

public struct TopApps: Decodable {
    
    // 1
    public let feed: Feed?
    
    // 2
    public init?(json: JSON) {
        feed = "feed" <~~ json
    }
    
}
