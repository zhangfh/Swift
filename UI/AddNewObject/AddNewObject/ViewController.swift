//
//  ViewController.swift
//  AddNewObject
//
//  Created by zhangfanghui on 16/8/30.
//  Copyright © 2016年 zhangfanghui. All rights reserved.
//

import UIKit
//1. create TempratureRange class, inherit from NSObject
//2. drag a Object to Main.storyboard, set class as TempratureRange.
//3. Now I can set outlet from this object to Viewcontroller
//4. drag a uipickerview to storyboard
//5. because  TempratureRangeUIPicker implement UIPickerViewDataSource, now I can drag uipickerview's datasource to TempratureRange Object on storyboard.
//6. set uipickerview's delegate to viewcontroller.
class ViewController: UIViewController {

    @IBOutlet var temperatureRange: TemperatureRange!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

