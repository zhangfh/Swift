//
//  Singleton.swift
//  Singleton
//
//  Created by zhangfanghui on 16/8/30.
//  Copyright © 2016年 zhangfanghui. All rights reserved.
//

import Foundation

class Singleton {
    
    static let sharedInstance = Singleton()
    
    fileprivate init()
    {
        print("it cannot be called by external")
        
    }
}
