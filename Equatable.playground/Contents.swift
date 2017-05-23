//: Playground - noun: a place where people can play

import Cocoa

/*
    protocol Equatable
        static func ==(Self, Self)
        Returns a Boolean value indicating whether two values are equal.
*/

// Equatable
// The Equatable protocol makes it possible to determine whether two values of the same type are considered to be equal.
struct MyEquatableStruct: Equatable {
    var name = "Untitled"
    
    static func == (lhs: MyEquatableStruct, rhs: MyEquatableStruct) -> Bool {
        return lhs.name == rhs.name
    }
}

let value1 = MyEquatableStruct()
var value2 = MyEquatableStruct()
let firstCheck = value1 == value2

value2.name = "A New Name"
let secondCheck = value1 == value2

//为什么遵循Equatable协议时，把 方法写在 {}里面 必须加static。
//为什么可以写在外面，而且必须去掉static
struct MyEquatableStruct2: Equatable {
    var name = "Untitled"
    

}

  func == (lhs: MyEquatableStruct2, rhs: MyEquatableStruct2) -> Bool {
    return lhs.name == rhs.name
 }
