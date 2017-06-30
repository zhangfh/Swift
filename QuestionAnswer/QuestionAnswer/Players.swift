//
//  Players.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

class Players: NSObject, NSCoding {
    
    var name:String!
    var score:Int!
    var difficult:String!
    var life:Int!
    
    init(name:String, difficult:String){
        self.name = name
        self.difficult  = difficult
        self.score = 0
        
        switch(self.difficult){
        case "Easy":
            self.life = 2
        case "Medium":
            self.life = 1
        case "Hard":
            self.life = 0
        default:
            self.life = 2
        }
    }
    
    func scorePlus(){
        self.score = self.score + 1
    }
    
    
    func lessLife(){
        self.life = self.life - 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.difficult = aDecoder.decodeObject(forKey: "difficult") as! String
        self.life = aDecoder.decodeObject(forKey: "life") as! Int
        self.score = aDecoder.decodeObject(forKey: "score") as! Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name , forKey: "name")
        aCoder.encode(self.difficult, forKey:  "difficult")
        aCoder.encode(self.score, forKey:  "score")
        aCoder.encode(self.life, forKey:  "life")
        
    }
}
