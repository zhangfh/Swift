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
    
    var currentindex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardView.setDelegate(self)
        self.wordSetup()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play()
    {
    
       
        let url = Bundle.main.url(forResource: chinseseCharacterArray[currentindex].1, withExtension: "mp3")
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
}

extension ViewController : CardViewDelegate
{
    func PriviousWord() {
       
        if (currentindex == 0){
                return
        }
        print("previous word show")
        currentindex -= 1
        wordSetup()
    }
    
    func NextWord() {
        
        if ( currentindex == (chinseseCharacterArray.count - 1))
        {
            return
        }
        print("next word show")
        currentindex += 1
        wordSetup()
    }
    
    func playSound() {
        print("playsound")
        play()
        
    }
}
