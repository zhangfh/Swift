//
//  TempratureRange.swift
//  AddNewObject
//
//  Created by zhangfanghui on 16/8/30.
//  Copyright © 2016年 zhangfanghui. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...100).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
