//
//  ViewController.swift
//  LaunchScreenAnimation
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.launchAnimation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func launchAnimation() {
        
        let viewContorller = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreen")
        
        let launchView = viewContorller.view
        
        let mainWindow = UIApplication.shared.keyWindow
        launchView?.frame = (mainWindow?.frame)!
        mainWindow?.addSubview(launchView!)
        
   
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .beginFromCurrentState, animations: {
            
            launchView?.alpha = 0.0
            launchView?.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0, 2.0, 1.0)
        }, completion: {
            finished in
            launchView?.removeFromSuperview()
            
        })
 
        
    }

}

