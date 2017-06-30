//
//  Hanking.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

class Hanking {
    var list:Array<Players>!
    var file:String!
    
    init(){
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        self.file = "\(path)/data_show_user"
        
        if let obj = NSKeyedUnarchiver.unarchiveObject(withFile: self.file){
            self.list = obj as! Array<Players>
        }else{
            self.list = Array<Players>()
        }
        
    }
    
    
    //retornando o objeto requisitado da lista
    func get(_ index:Int)-> Players{
        return self.list[index]
    }
    
    //adicionando novo elemento da lista
    func add(_ el:Players){
        self.list.append(el)
        //atualizando o arquivo com as alterações
        NSKeyedArchiver.archiveRootObject(self.list, toFile: self.file)
    }
    
    //organizer
    func organize(){
        self.list.sort(by: { $0.score > $1.score })
    }
    
    //quantidade de elementos da LISTA
    func count()->Int{
        return self.list.count
    }
    
    
    //removendo elemento do list
    func remove(_ index:Int){
        self.list.remove(at: index)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: self.file)
    }
}
