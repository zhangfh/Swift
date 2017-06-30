//
//  Game.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import Foundation

class Game {
    
    var register:Register!
    
    //questoes e suas alternativas
    var quest:String!
    var answer:String!
    var answer2:String!
    var answer3: String!
    //valor correto da questao
    var correct:String?
    
    //jogador
    var player:Players!
    
    //hanking
    var h:Hanking!
    
    init(player:Players){
        self.register = Register()
        
        //jogador
        self.player = player
        
        //hankde jogadores
        self.h = Hanking()
        
        //verificando existe algo no arquivo
        if(self.register!.count() == 0){
            self.fill()
        }
        
        //gerando aleatoriamente as perguntas.
        self.generateQuestions()
    }
    
    /**
     adicionando jogadores a lista de hanking
     **/
    
    func addPlayerForHanking(){
        h.add(self.player)
    }
    
    //validada a questao se esta correta, caso sim, ele atualiza as informacoes
    //do player e gera um novo game.
    func validation(_ correct:String) -> Bool{
        if self.correct == correct {
            self.generateQuestions()
            self.player.scorePlus()
            return true
        }
        
        return false
        
    }
    
    
    
    //gerando aleatoriamente as questoes para serem apresentadas.
    func generateQuestions(){
        let random = Int(arc4random_uniform(UInt32(self.register!.count())))
        
        self.quest = self.register.get(random).quest
        //alternativas
        self.answer = self.register.get(random).answer1
        self.answer2 = self.register.get(random).answer2
        self.answer3 = self.register.get(random).answer3
        
        //correct
        self.correct = self.register.get(random).correct
        
    }
    
    //carregando inicialmente a lista com quests
    func fill(){
        let q = Quests(q: "Qual o maior planeta do sistema solar?", a: "Júpiter")
        let q1 = Quests(q: "Quantos ossos tem o corpo humano?", a: "206")
        let q2 = Quests(q: "Qual o primeiro personagem de Walt Disney?", a: "Mickey Mouse.")
        let q3 = Quests(q: "Quem pintou o quadro Mona Lisa?", a: "Leonardo da Vinci")
        
        //alimentando inicialmente o sistema.
        self.register?.add(q)
        self.register?.add(q1)
        self.register?.add(q2)
        self.register?.add(q3)
    }
    
    /**
     --------------------------
     **/
    
    //verificando se ele perdeu
    func lose() -> Bool{
        if(self.player.life <= 0){
            return true
        }
        
        return false
    }
}
