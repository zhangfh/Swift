//
//  AppDelegate.swift
//  StartAdvertising
//
//  Created by zhangfanghui on 2017/7/3.
//  Copyright © 2017年 zhangfanghui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let  adImageName = "adImageName"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
        
       
        let filePath = self.getFilePath(withImageName: UserDefaults.standard.value(forKey: adImageName) as? String)

        
        let isExist = self.isFileExist(withFilePath: filePath)
        if (isExist)
        {
                let advertisingController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvertisingController") as! AdvertisingController
        
                advertisingController.setimagePath(filePath!)
                self.window?.rootViewController =  advertisingController
            
                self.window?.makeKeyAndVisible()
        }
        getAdvertisingImage()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    /**
     *  根据图片名拼接文件路径
     */
    func getFilePath(withImageName : String? ) -> String?
    {
        if ((withImageName) != nil) {
    
            let paths =  NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
           
            let filePath = paths[0] + "/" + withImageName!
            return filePath
        }
    
        return nil
    }
    
    /**
     *  判断文件是否存在
     */
    func isFileExist( withFilePath : String?) ->Bool
    {
        if (withFilePath != nil){
            return FileManager.default.fileExists(atPath: withFilePath!)
        }
        return false

    }
    
    /**
     *  初始化广告页面
     */
    func getAdvertisingImage()
    {
    
        // TODO 请求广告接口
    
        // 这里原本采用美团的广告接口，现在了一些固定的图片url代替
        let imageArray = ["http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg",
                          "http://pic.paopaoche.net/up/2012-2/20122220201612322865.png",
                          "http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg",
                          "http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"]
        
        let rand = Int(arc4random())
        let imageUrl = imageArray[rand % imageArray.count]
    
        // 获取图片名:43-130P5122Z60-50.jpg
        let imageName = imageUrl.components(separatedBy: "/").last

    
        // 拼接沙盒路径
        let filePath = self.getFilePath(withImageName: imageName)
    
        let isExist = self.isFileExist(withFilePath: filePath)
        if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
    
            self.downloadAdImageWithUrl(imageUrl: imageUrl ,imageName:imageName!)
    
        }
    
    }
    
    /**
     *  下载新图片
     */
    func downloadAdImageWithUrl(imageUrl : String , imageName : String)
    {
        DispatchQueue.global(qos: .background).async {
            //background thread.
            
            let data = NSData(contentsOf: URL(string: imageUrl)!)
            let image = UIImage.init(data: data! as Data)
            
            var filePath = self.getFilePath(withImageName: imageName)// 保存文件的名称
            
            
            let imagedata = UIImagePNGRepresentation(image!)
            
            do {
                
                try imagedata?.write(to:  URL(fileURLWithPath: filePath!))
                self.deleteOldImage()
                
                UserDefaults.standard.set(imageName, forKey: self.adImageName)
                UserDefaults.standard.synchronize()

                // 如果有广告链接，将广告链接也保存下来
            }catch let error {
                print(error)
            }
            
            
        }
    }
    
    func deleteOldImage()
    {
        let imageName = UserDefaults.standard.value(forKey: self.adImageName)
   
        if (imageName != nil) {
            
            let filePath = self.getFilePath(withImageName: imageName as! String)
            do{
                try FileManager.default.removeItem(atPath: filePath!)
            }catch let error {
                print("get remove error \(error)")
            }
   
        }
        
    }

    

}

