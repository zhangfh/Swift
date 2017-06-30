//
//  Quests.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

class Quests: NSObject, NSCoding {

    var quest:String!

    var answer1:String!
    var answer2:String?
    var answer3:String?
 
    var correct:String!
    
    init(q:String, a:String){
        self.correct = a
        self.quest = q
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.quest = aDecoder.decodeObject(forKey: "quest") as! String
        self.correct = aDecoder.decodeObject(forKey: "correct") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.quest , forKey: "quest")
        aCoder.encode(self.correct, forKey:  "correct")
    }
    
}
