//
//  ViewController.swift
//  JsonParser
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
            // TODO: Process data
            //Still in async thread.
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("json parse error")
                return
            }
            guard let feed = json?["feed"] as? [String: Any],
                    let apps = feed["entry"] as? [[String: Any]],
                    let firstApp = apps.first else {
                    return
            }
            do {
                let app = try App(json: firstApp)
                print(app)
            }catch let error {
                print(error)
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

