//: Playground - noun: a place where people can play

import Cocoa

//典型初始化
var emptyDictionary = Dictionary<String, Int>()

//方便初始化
var equivilentEmptyDictionary = [String: Int]()

//构造初始化
var anotherEmptyDictionary = Dictionary<String, Int>(minimumCapacity: 10)

//数组初始化
var literalDictionary = ["a":1]




var dictionary = ["one": 1, "two": 2, "three": 3]
let value = dictionary["two"]

//条件
if let unwrappedValue = dictionary["three"] {
    print("The integer value for \"three\" was: \(unwrappedValue)")
    unwrappedValue
}
dictionary["three"] = 33
dictionary

//使用下标增加元素
dictionary["four"] = 4
dictionary

//移除元素
dictionary["three"] = nil
dictionary

//更新值
dictionary = ["one": 1, "two": 2, "three": 3]
let previousValue = dictionary.updateValue(22, forKey: "two")
dictionary

if let unwrappedPreviousValue = dictionary.updateValue(33, forKey: "three") {
    print("Replaced the previous value: \(unwrappedPreviousValue)")
} else {
    print("Added a new value")
}

//updateValue不但能更新，还能添加
if let unwrappedPreviousValue = dictionary.updateValue(44, forKey: "four") {
    print("Replaced the previous value: \(unwrappedPreviousValue)")
} else {
    print("Added a new value")
}

dictionary

//移除值
dictionary = ["one": 1, "two": 2, "three": 3]
let prevValue = dictionary.removeValue(forKey: "two")
dictionary

if let unwrappedPreviousValue = dictionary.removeValue(forKey: "three") {
    print("Removed the old value: \(unwrappedPreviousValue)")
} else {
    print("Didn't find a value for the given key to delete")
}
dictionary

dictionary.removeAll()
dictionary

// Querying a Dictionary
dictionary = ["one": 1, "two": 2, "three": 3]
let elementCount = dictionary.count

//便利字典的key
for key in dictionary.keys {
    print("Key: \(key)")
}

let keysArray = Array(dictionary.keys)
//遍历字典的value
for value in dictionary.values {
    print("Value: \(value)")
}

let valuesArray = Array(dictionary.values)

// Operators
let dictionary1 = ["one": 1, "two": 2]
var dictionary2 = ["one": 1]

dictionary2["two"] = 2

dictionary1
dictionary2

let result = dictionary1 == dictionary2
//重新赋值
dictionary2 = ["one": 1]

dictionary1
dictionary2
let secondResult = dictionary1 != dictionary2



