//
//  ViewController.swift
//  rtpsdemo
//
//  Created by zhangfanghui on 2017/5/10.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit
import IJKMediaFramework

class ViewController: UIViewController {

  
    @IBOutlet weak var mediaControl: MediaControlView!
    @IBOutlet weak var mediaControlParent: UIView!
    var player : IJKFFMoviePlayerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let options = IJKFFOptions.byDefault()
        let url = URL(string: "rtmp://live.hkstv.hk.lxdns.com/live/hks")
       // let url = URL(string: "rtmp://ultrasound.lonshinetech.cn/mu3/fcdab3?username=new@163.com&token=7ee5fac7")
        let player = IJKFFMoviePlayerController(contentURL: url, with: options)!
        let autoresize = UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue
        player.view.autoresizingMask = UIViewAutoresizing(rawValue: autoresize)
        
        player.view.frame = self.view.bounds
        player.scalingMode = IJKMPMovieScalingMode.aspectFit
        player.shouldAutoplay = true
        self.view.autoresizesSubviews = true
        self.view.addSubview(player.view)
        self.player = player
        
        
        
        self.player.prepareToPlay()
        self.view.bringSubview(toFront: mediaControlParent)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.player.shutdown()  
    }


}

