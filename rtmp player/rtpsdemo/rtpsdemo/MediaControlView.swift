//
//  MediaControlView.swift
//  rtpsdemo
//
//  Created by zhangfanghui on 2017/5/11.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit


 @IBDesignable

 class MediaControlView: UIView {

    var contentView: UIView?
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    override init(frame: CGRect)
    {
        super.init(frame:frame)
        print("init frame")
        
        xibSetup()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init aDecoder")
        xibSetup()
    
    }

    func loadViewFromNIb() -> UIView!
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MediaControlView", bundle: bundle)
        let view = nib.instantiate(withOwner: self,options:nil)[0] as! UIView
        return view
        
    }
    
    func xibSetup()
    {
        contentView = loadViewFromNIb()
        contentView?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(contentView!)
        
        playButton.isHidden = true
        
        
    }
    
    @IBAction func pauseAction(_ sender: Any){
        pauseButton.isHidden = true
        playButton.isHidden = false
        
    }
    @IBAction func playAction(_ sender: Any) {
        pauseButton.isHidden = false
        playButton.isHidden = true
        
        
    }
}
