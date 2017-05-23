//: Playground - noun: a place where people can play

import Cocoa

/*
    CustomStringConvertible is Pritable in swift 3.0
    Instance Properties
 
    var description: String
    A textual representation of this instance.
*/

// Printable
// The Printable protocol allows you to customize the textual representation of any type ready for printing (for example, to Standard Out).
struct MyPrintableStruct: CustomStringConvertible {
    var name = "Untitled"
    var description: String {
        return "MyType: \(name)"
    }
}

let value = MyPrintableStruct()
print("Created a \(value)")

