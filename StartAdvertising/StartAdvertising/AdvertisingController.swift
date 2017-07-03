//
//  AdvertisingController.swift
//  StartAdvertising
//
//  Created by zhangfanghui on 2017/7/3.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

class AdvertisingController: UIViewController {

    var countTimer = Timer()
    
    static let showtime = 3
    var count = 0
    
    var adv_image : UIImage?
    
    @IBOutlet var advertisingView: AdvertiseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.advertisingView.advImageView.image =  self.adv_image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pushToAd(_ sender: Any) {
        print("pushtoad")
        self.dismiss()
        
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushtoad"), object: nil, userInfo: nil)
        //switch to adv
     
        
    }

    func updateTimer()
    {
        count = count - 1
        
        self.advertisingView.skipButton.setTitle("跳过\(count)", for: .normal)
        

        if (count == 0) {
            
            self.dismiss()
            self.switchToMainController()
        }
        
    }
    
    func dismiss()
    {
        self.countTimer.invalidate()
    }
    
    func switchToMainController(){
        //switch to viewcontroller
        let maincontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainController")
        self.present(maincontroller, animated: true)
        {
            
        }
        
    }
    // 定时器倒计时
    func startTimer()
    {
        count = AdvertisingController.showtime
        countTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(AdvertisingController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    func setimagePath(_ imagePath:String)
    {
        self.adv_image = UIImage(contentsOfFile: imagePath)
     
        //here advertisingView is nil
        
        self.startTimer()

    }
    
    
    
}
