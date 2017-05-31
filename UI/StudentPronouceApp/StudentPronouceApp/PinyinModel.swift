//
//  PinyinModel.swift
//  StudentPronouceApp
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

enum SerializationError : Error {
    case missing(String)
}

public struct PinyinModel {
    
    // MARK: - Properties
    public let firstName: String
    public let image: String
    public let audio: String
    public let pronunciation : String
    public let characters : String
    public let strokes : String
    public let explain1 : String
    public let explain2 : String
    public let word1 : String
    public let word2 : String
    
    public init(json:[String:Any]) throws
    {
        

        guard let firstName = json["firstName"] as? String
             else {
                throw SerializationError.missing("firstName")
        }
        guard let image = json["image"] as? String else {
                throw SerializationError.missing("image")
        }
        
        guard let audio = json["audio"] as? String
            else {
                throw SerializationError.missing("audio")
        }
        guard let pronunciation = json["pronunciation"] as? String else {
            throw SerializationError.missing("pronunciation")
        }
        
        guard let characters = json["characters"] as? String
            else {
                throw SerializationError.missing("characters")
        }
        guard let strokes = json["strokes"] as? String else {
            throw SerializationError.missing("strokes")
        }
        guard let explain1 = json["explain1"] as? String
            else {
                throw SerializationError.missing("explain1")
        }
        guard let explain2 = json["explain2"] as? String else {
            throw SerializationError.missing("explain1")
        }
        guard let word1 = json["word1"] as? String
            else {
                throw SerializationError.missing("explain1")
        }
        guard let word2 = json["word2"] as? String else {
            throw SerializationError.missing("word2")
        }
        self.firstName = firstName
        self.image = image
        self.audio = audio
        self.pronunciation = pronunciation
        self.characters = characters
        self.strokes = strokes
        self.explain1 = explain1
        self.explain2 = explain2
        self.word1 = word1
        self.word2 = word2
    }
}
