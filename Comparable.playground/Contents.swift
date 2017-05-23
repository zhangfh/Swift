//: Playground - noun: a place where people can play

import Cocoa

/*
    Comparable : Equatable
 Operator Functions
 
 static func <(Self, Self)
 Returns a Boolean value indicating whether the value of the first argument is less than that of the second argument.
 static func <=(Self, Self)
 Returns a Boolean value indicating whether the value of the first argument is less than or equal to that of the second argument.
 static func >(Self, Self)
 Returns a Boolean value indicating whether the value of the first argument is greater than that of the second argument.
 static func >=(Self, Self)
 Returns a Boolean value indicating whether the value of the first argument is greater than or equal to that of the second argument.

 
 // The Comparable protocol makes it possible to compare two values of the same type
 // There is one required operator overload defined in the protocol (<) as well as one defined in the inherited Equatable protocol (==). You get >, <= and >= for free.
 */

struct MyComparableStruct: Comparable {
    var name = "Untitled"
}

func == (lhs: MyComparableStruct, rhs: MyComparableStruct) -> Bool {
    return lhs.name == rhs.name
}
func < (lhs: MyComparableStruct, rhs: MyComparableStruct) -> Bool {
    return lhs.name < rhs.name
}

let value3 = MyComparableStruct()
var value4 = MyComparableStruct()
let thirdCheck = value3 < value4
value4.name = "A New Name"
let fourthCheck = value4 < value3

let fifthCheck = value4 > value3
let sixthCheck = value4 <= value3
let seventhCheck = value4 >= value3