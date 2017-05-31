//
//  ViewController.swift
//  json_with_gloss
//
//  Created by zhangfanghui on 2017/5/31.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
            // 1
            var json: Any
            do {
                json = try JSONSerialization.jsonObject(with: data)
            } catch {
                print(error)
                return
            }
            
            guard let dictionary = json as? [String: Any] else {
               return
            }
            
            // 2
            guard let topApps = TopApps(json: dictionary) else {
                print("Error initializing object")
                return
            }
            // 3
            guard let firstItem = topApps.feed?.entries?.first else {
                print("No such item")
               
                return
            }
             print(firstItem)
        }
        
        DataManager.getTopAppsDataFromItunesWithSuccess { (data) -> Void in
        
            // 1
            var json: Any
            do {
                json = try JSONSerialization.jsonObject(with: data)
            } catch {
                print(error)
                return
            }
            
            guard let dictionary = json as? [String: Any] else {
                return
            }
            
            // 2
            guard let topApps = TopApps(json: dictionary) else {
                print("Error initializing object")
                return
            }
            // 3
            guard let firstItem = topApps.feed?.entries?.first else {
                print("No such item")
                
                return
            }
            print(firstItem)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

