//
//  ViewController.swift
//  Singleton
//
//  Created by zhangfanghui on 16/8/30.
//  Copyright © 2016年 zhangfanghui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let singletonA = Singleton.sharedInstance
        let singletonB = Singleton.sharedInstance
        
        //singletonA has same pointer with singletonB
        print("SingletonA is \(singletonA) SingletonB is \(singletonB)")
        

        //singletonC has differnt pointer with singletonA, init constructor must be forbitten.
        //so let init() become private.
        //let singletonC = Singleton()
        //print("singletonC \(singletonC)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

