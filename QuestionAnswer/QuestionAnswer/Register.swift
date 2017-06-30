//
//  Register.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation


class Register {
    
    var listQuests:Array<Quests>!
    var file:String!
    
    init(){
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        self.file = "\(path)/data_show"
        
        print(self.file)
        
        if let obj = NSKeyedUnarchiver.unarchiveObject(withFile: self.file){
            self.listQuests = obj as! Array<Quests>
        }else{
            self.listQuests = Array<Quests>()
        }
        
        /**
         organizando as outras respostas
         **/
        self.organizeAnswers()
    }
    
    //coloca as alternativas de forma aleatoria, onde as erradas sao certas de outras perguntas
    func organizeAnswers(){
        let count = self.listQuests.count
        
        if(count > 3){
            
            for i in 0..<count {
                
                //finalmemte entregando os valores aleatorios
                self.listQuests[i].answer1 = self.listQuests[Int(arc4random_uniform(UInt32(count)))].correct
                self.listQuests[i].answer2 = self.listQuests[i].correct
                self.listQuests[i].answer3 = self.listQuests[Int(arc4random_uniform(UInt32(count)))].correct
                
            }
        }
    }
    
    //retornando o objeto requisitado da lista
    func get(_ index:Int)-> Quests{
        return self.listQuests[index]
    }
    
    //adicionando novo elemento da lista
    func add(_ el:Quests){
        self.listQuests.append(el)
        self.organizeAnswers()
        
        //atualizando o arquivo com as alterações
        NSKeyedArchiver.archiveRootObject(self.listQuests, toFile: self.file)
    }
    
    //quantidade de elementos da LISTA
    func count()->Int{
        return self.listQuests.count
    }
    
    
    //removendo elemento do list
    func remove(_ index:Int){
        self.listQuests.remove(at: index)
        NSKeyedArchiver.archiveRootObject(self.listQuests, toFile: self.file)
    }
    
}
