//
//  CardView.swift
//  Card
//
//  Created by zhangfanghui on 2017/5/26.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

@IBDesignable
class CardView : UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    
    @IBInspectable var shadowColor: UIColor = UIColor.red
    @IBInspectable var shadowOpacity : Float = 0.5
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        
    }
}
