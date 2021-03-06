//
//  Simulator.swift
//  Concurrency
//
//  Created by tommy trojan on 4/11/15.
//  Copyright (c) 2015 Skyground Media Inc. All rights reserved.
//
import Foundation

class Simulator {
    
    class var sharedInstance: Simulator {
        struct Static {
            static let instance: Simulator = Simulator()
        }
        return Static.instance
    }

    func runSimulatorWithMinTime( _ minTime:Int, maxTime:Int ) -> Double {
        
        //Calculate random thread wait time
        let ms:Int = ( Int(arc4random()) % ((maxTime - minTime) * 1000) ) + (minTime * 1000)
        
        let waitTime:Double = Double(ms) / 1000.0;
        
        Thread.sleep(forTimeInterval: waitTime)
        
        print( "Simulator.runSimulatorWithMinTime:", waitTime )
        return waitTime
    }

}
