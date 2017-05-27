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
        let url = Bundle.main.url(forResource: "pin", withExtension: "mp3")
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
        let image = UIImage(named: "pin")
        self.cardView.setImageViewWith(image!)
        
    }
}

extension ViewController : CardViewDelegate
{
    func PriviousWord() {
        print("previous word show")
    }
    
    func NextWord() {
        print("next word show")
    }
    
    func playSound() {
        print("playsound")
        play()
        
    }
}
