//
//  CardView.swift
//  SingleXib
//
//  Created by zhangfanghui on 2017/5/27.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

protocol  CardViewDelegate : class{
    func NextWord()
    func PriviousWord()
    func playSound()
}

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    
    @IBInspectable var shadowColor: UIColor = UIColor.red
    @IBInspectable var shadowOpacity : Float = 0.5
    
    var contentView : UIView?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var preButton: CustomButton!
    @IBOutlet weak var nextButton: CustomButton!
    
    @IBOutlet weak var pininLabel: UILabel!
    @IBOutlet weak var bushouLabel: UILabel!
    @IBOutlet weak var bihuaLabel: UILabel!
    weak var delegate : CardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        contentView!.frame = bounds
        
        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        
    }
    
    @IBAction func PriviousButtonClick(_ sender: Any) {
        print("priviousButton click")
        self.delegate?.PriviousWord()
        
    }
    
    @IBAction func NextButtonClick(_ sender: Any) {
        print("Next Button Click")
        self.delegate?.NextWord()
    }

    @IBAction func soundButtonClicked(_ sender: Any) {
        self.delegate?.playSound()
    }
    func setDelegate(_ delegate:CardViewDelegate)
    {
        self.delegate = delegate
    }
    
    func hideButton(name: String)
    {
        if (name == "prev")
        {
            self.preButton.isHidden = true
        }
        if (name == "next")
        {
            self.nextButton.isHidden = true
        }
    }
    
    func showButton(name: String)
    {
        if (name == "prev")
        {
            self.preButton.isHidden = false
        }
        if (name == "next")
        {
            self.nextButton.isHidden = false
        }
    }
    
    func setImageViewWith(_ image: UIImage)
    {
        self.imageView.image = image
    }
    
    func setPinyinWith(_ text: String)
    {
        self.pininLabel.text = text
    }
    
    
    func setBushouWith(_ text: String)
    {
        self.bushouLabel.text = text
    }
    
    
    func setBihuaWith(_ text: String)
    {
        self.bihuaLabel.text = text
    }
}
