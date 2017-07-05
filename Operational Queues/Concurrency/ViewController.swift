//
//  ViewController.swift
//  Concurrency
//
//  Created by tommy trojan on 4/11/15.
//  Copyright (c) 2015 Skyground Media Inc. All rights reserved.
//
import UIKit

typealias KVOContext = UInt8

class ViewController: UIViewController {
    
    @IBOutlet weak var currentBuyerLabel: UILabel!
    
    @IBOutlet weak var nextBuyerLabel: UILabel!
    
    @IBOutlet weak var userBoughtTapeRoll: UITextView!
    
    @IBOutlet weak var userPaidTapeRoll: UITextView!

    
    @IBOutlet weak var onAlphaSlider: UISlider!
    
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!

    @IBOutlet weak var resetBtn: UIButton!

    @IBAction func onAlphaChanged(_ sender: AnyObject) {
        
    }
    
    @IBAction func onBuyClicked(_ sender: AnyObject) {
        buyNow()
    }
    
    @IBAction func onCancelClicked(_ sender: AnyObject) {
        operationQueue.cancelAllOperations()
    }
    
    @IBAction func onResetClicked(_ sender: AnyObject) {
        currentIdx = 0
    }

    
    let customers:Array<String> = ["A", "B", "C", "D", "E", "F", "G"]
    var currentIdx:Int = 0
    var operationQueue:OperationQueue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabels()
        buyNow()
    }
    
    /** ** ** ** ** ** ** ** ** ** ** ** ** **
    UI Methods
    ** ** ** ** ** ** ** ** ** ** ** ** ** **/
    
    func buyNow(){
        updateLabels( "currentBuyerLabel", message: "\(customers[currentIdx])")
        
        let remainingCustomers:Int = (customers.count - 1) - currentIdx
        updateLabels( "nextBuyerLabel", message: "\(remainingCustomers)" )
        
        if(currentIdx < customers.count - 1){
            currentIdx += 1
        } else {
            currentIdx = 0
        }
        buyAndPay()
    }
    
    func buyAndPay(){
        //Switch to new customer
        let customerName:String = customers[currentIdx]
        
        //1. Create an Operation from NSOperation
        let buyTicket:BlockOperation = BlockOperation.init(block: {
            //Run simulator to resemble an HTTP request
            let num:Double = Simulator.sharedInstance.runSimulatorWithMinTime(2, maxTime: 5)
            //You cannot update the UIX from a background thread so you call this data back up the main UIX.
            DispatchQueue.main.async(execute: { () -> Void in
                //Update the text label with the new async data
                self.updateLabels("currentBuyerLabel", message:  self.customers[self.currentIdx])
                
                self.updateLabels("userBoughtTapeRoll", message: "\(customerName) bought tickets in \(num).")
                
                let nextIdx:Int = self.currentIdx + 1
                self.updateLabels( "nextBuyerLabel", message: self.customers[nextIdx])
            })
        })
        
        //2. Trigger a completion event
        buyTicket.completionBlock = {
            print("nsBlockOperation.completionBlock completed for \(customerName)")
            
        }
        
        let payTicket:BlockOperation = BlockOperation.init(block: {
            //Run simulator to resemble an HTTP request
            let num:Double = Simulator.sharedInstance.runSimulatorWithMinTime(2, maxTime: 5)
            //You cannot update the UIX from a background thread so you call this data back up the main UIX.
            DispatchQueue.main.async(execute: { () -> Void in
                print("payTicket in \(num) time")
                self.updateLabels( "userPaidTapeRoll", message: "\(customerName) paid in \(num) time")

            })
        })
        
        payTicket.addDependency( buyTicket )
        payTicket.completionBlock = {
             print("final all queue count \(self.operationQueue.operationCount)")
           
        }
        var MyObservationContext = KVOContext()
        
        let options = NSKeyValueObservingOptions.new //NSKeyValueObservingOptions.Old
        payTicket.addObserver(self,
            forKeyPath: "isCancelled",
            options: options,
            context: &MyObservationContext )
        
        //3. Add the operations to a queue
        operationQueue.addOperation( buyTicket )
        operationQueue.addOperation( payTicket )
        print("get all queue count \(operationQueue.operationCount)")
        

    }
    
    func clearLabels(){
        updateLabels( "currentBuyerLabel", message: "")
        updateLabels( "nextBuyerLabel", message: "")
        updateLabels( "userBoughtTapeRoll", message: "")
        updateLabels( "userPaidTapeRoll", message: "")
    }
    
    //Serial task
    func buyTicket(){
        //Increment the index
        currentIdx += 1
        if(currentIdx == customers.count ){
            //Turn off the BUY button
            buyBtn.isEnabled = false
            
            clearLabels()
            
            updateLabels( "currentBuyerLabel", message: "No more customers.")
        }else{
        }
    }
    
    func updateLabels(_ label:String, message:String){
        switch(label){
            case "currentBuyerLabel":
                currentBuyerLabel.text = message
                break
            case "nextBuyerLabel":
                nextBuyerLabel.text = message
                break
            case "userBoughtTapeRoll":
                let oldMessage:String = userBoughtTapeRoll.text
                let newMessage:String = "\(message) \n"
                
                userBoughtTapeRoll.text = oldMessage + newMessage
                break
            case "userPaidTapeRoll":
                let oldMessage:String = userPaidTapeRoll.text
                let newMessage:String = "\(message) \n"
                
                userPaidTapeRoll.text = oldMessage + newMessage

            default :
                break
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("kvo arrive")
        if let change = keyPath  {
            if change == "isCancelled" {
                print("cancel all operation")
            }
        }
    }
}
