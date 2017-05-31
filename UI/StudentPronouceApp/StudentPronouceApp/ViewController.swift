//
//  ViewController.swift
//  StudentPronouceApp
//
//  Created by zhangfanghui on 2017/5/27.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cardView: CardView!
    var player : AVAudioPlayer?
    
    //model (imagename,audioname,pinyin,bushou,bihua)
    var chinseseCharacterArray = [("pin","pin","pin","扌","9"),("chun","chun","chun","日","9")]
    var pinyinArray  = [PinyinModel]()
    var currentindex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardView.setDelegate(self)
        
        //get json
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            //Still in async thread.
        
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("json parse error")
                return
            }
            guard let alveolars = json?["alveolars"] as? [[String: Any]] else {
                    return
            }
            
            for element in alveolars
            {
                do {
                    let newpinyin = try PinyinModel(json: element)
                    self.pinyinArray.append(newpinyin)
                }catch let error {
                    print(error)
                }
                
            }
            print("get pinyin json array")
            DispatchQueue.main.async {
                self.SetupFromJsonData()
            }
            
        }
        
        //self.wordSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play()
    {
    
       
        //let url = Bundle.main.url(forResource: chinseseCharacterArray[currentindex].1, withExtension: "mp3")
        let url = Bundle.main.url(forResource: pinyinArray[currentindex].audio, withExtension: "mp3")
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else {return}
            player.play()
            
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    func wordSetup()
    {
        let image = UIImage(named: chinseseCharacterArray[currentindex].0)
        self.cardView.setImageViewWith(image!)
        self.cardView.setPinyinWith(chinseseCharacterArray[currentindex].3)
        self.cardView.setBushouWith(chinseseCharacterArray[currentindex].4)
        self.cardView.setBihuaWith(chinseseCharacterArray[currentindex].1)
        
    }
    
    func SetupFromJsonData()
    {
        let image = UIImage(named: pinyinArray[currentindex].image)
        self.cardView.setImageViewWith(image!)
        self.cardView.setPinyinWith(pinyinArray[currentindex].pronunciation)
        self.cardView.setBushouWith(pinyinArray[currentindex].characters)
        self.cardView.setBihuaWith(pinyinArray[currentindex].strokes)
        
    }
    
}

extension ViewController : CardViewDelegate
{
    func PriviousWord() {
       
        if (currentindex == 0){
                return
        }
        print("previous word show")
        currentindex -= 1
        //wordSetup()
        SetupFromJsonData()
    }
    
    func NextWord() {
        
        //if ( currentindex == (chinseseCharacterArray.count - 1))
        if ( currentindex == (pinyinArray.count - 1))
        {
            return
        }
        print("next word show")
        currentindex += 1
        //wordSetup()
        SetupFromJsonData()
    }
    
    func playSound() {
        print("playsound")
        play()
        
    }
}
