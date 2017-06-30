//
//  QuestViewController.swift
//  QuestionAnswer
//
//  Created by zhangfanghui on 2017/6/29.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {


    
    
    @IBOutlet weak var swOne: UISwitch!
    @IBOutlet weak var swTwo: UISwitch!
    @IBOutlet weak var swThree: UISwitch!
    @IBOutlet weak var tOne: UITextView!
    @IBOutlet weak var tTwo: UITextView!
    @IBOutlet weak var tThree: UITextView!
    @IBOutlet weak var tGeral: UITextView!
    @IBOutlet weak var lbCountQuest: UILabel!
    var player:Players!
    var game:Game!
    var correct:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.swOne.isOn = false
        self.swThree.isOn = false
        self.swTwo.isOn = false
        
        
        self.game = Game(player: self.player)
        
        self.tGeral.text = self.game?.quest
        self.tOne.text = self.game?.answer

        self.tTwo.text = self.game?.answer2
        self.tThree.text = self.game?.answer3

        self.searchBuscape()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBuscape() {
        
        guard let url = URL(string:  "http://314.bl.ee/api.php?q=\(self.game.register.count())") else {
            return
        }
        /*
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil
                else { return }
            DispatchQueue.main.async { () -> Void in
                var error: NSError?
                
                let json = JSON(data: data, options: .allowFragments, error: &error)
                
                //apresenta o erro caso haja no server
                if let error = error {
                    print(error.localizedDescription)
                }
                
                //print(json)
                
                //joga as informacoes que vinheram do servidor e coloca no register
                for(var i = 0; i < json["data"].count; i += 1){
                    self.game.register.add(Quests(q: String(json["data"][i]["quest"]), a: String(json["data"][i]["answer"])))
                    print(String(json["data"][i]["quest"]))
                }
                
                
            }
        }).resume()
        */
    }
    
    @IBAction func btnThree(_ sender: Any) {
        swOne.isOn = false
        swTwo.isOn = false
        correct = tThree.text
    }
    @IBAction func btnTwo(_ sender: Any) {
        swOne.isOn = false
        swThree.isOn = false
        correct = tTwo.text
    }

    
    
    //atualizando com o banco de dados de servidor
    @IBAction func btnOne(_ sender: Any) {
        swTwo.isOn = false
        swThree.isOn = false
        
        correct = tOne.text
    }

    @IBAction func btDone(_ sender: Any) {
        
        if self.game!.validation(self.correct!) {
        
            self.lbCountQuest.text = String(Int(self.lbCountQuest.text!)! + 1)
            
            //mudando a perguntas e alternativas
            self.tGeral.text = self.game?.quest
            self.tOne.text = self.game?.answer
            self.tTwo.text = self.game?.answer2
            self.tThree.text = self.game?.answer3
            
            //zerando as opcoes
            swOne.isOn = false
            swTwo.isOn = false
            swThree.isOn = false
            
       
            
            
        }else{
            if self.game!.lose() {
                self.game.addPlayerForHanking()
                self.navigationController?.popViewController(animated: true)
            }else{
                self.game?.player.lessLife()
                
                
                let alert = UIAlertController(title: "Eitxa", message: "Voce errou, voce tem \(self.game.player.life) chances", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
