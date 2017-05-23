//: Playground - noun: a place where people can play

import Cocoa

// Strings
// Swift automatically bridges between the String type and the NSString class.

// To enable string bridging, just import Foundation.

let string: String = "abc"
let bridgedString: NSString = string as NSString


let stringLiteral: NSString = "123"
if let integerValue = Int(stringLiteral as String) {
    print("\(stringLiteral) is the integer \(integerValue)")
}
// Numbers
// Swift automatically bridges from Int, UInt, Float, Double, Bool to NSNumber
let number = 42
let bridgedNumber: NSNumber = number as NSNumber
let integerLiteral: NSNumber = 5
let floatLiteral: NSNumber = 3.14159
let booleanLiteral: NSNumber = true

// Arrays
//  Swift automatically bridges from NSArray to the native Array structure. The bridged class will be of type AnyObject[]. You can downcast the AnyObject[] to a more specific type. This will return an optional type though as it is not possible to know that all of the elements of the array can be downcast to the specified type until runtime.

let schoolSupplies: NSArray = ["Pencil", "Eraser", "Notebook"]
// Sets
let amenities: NSSet = ["Sauna", "Steam Room", "Jacuzzi"]

// Dictionaries
let medalRankings: NSDictionary = ["Gold": "1st Place", "Silver": "2nd Place", "Bronze": "3rd Place"]
