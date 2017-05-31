//
//  App.swift
//  json_with_gloss
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

public struct App: Decodable {
    
    // 1
    public let name: String
    public let link: String
    
    public init?(json: JSON) {
        // 2
        guard let container: JSON = "im:name" <~~ json,
            let id: JSON = "id" <~~ json else {
                return nil
        }
        
        guard let name: String = "label" <~~ container,
            let link: String = "label" <~~ id else {
                return nil
        }
        
        self.name = name
        self.link = link
    }
}
