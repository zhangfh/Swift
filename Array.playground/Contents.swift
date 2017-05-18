//: Playground - noun: a place where people can play

import Cocoa

//Array
//1.标准初始化
var emptyArray = Array<Int>()
print("emptyArray count \(emptyArray.count)")

//2.方便初始化
var equivilentEmptyArray = [Int]()
print("equivilentEmptyArray count \(equivilentEmptyArray.count)")

//3.构造函数初始化
let numericArray = Array(repeating: 42, count: 3)
print("numericArray count \(numericArray.count)")
print("first element in numricArray is \(numericArray[0])")

let stringArray = Array(repeating: "Hello", count: 2)
print("first element in stringArray is \(stringArray[0])")

//4.赋值初始化
var subscriptableArray = ["zero", "one", "two", "three"]

//下标访问
subscriptableArray[3]
//通过下标添加新元素将会发生运行时错误
//subscriptableArray[4] = "new item"

let subRange = subscriptableArray[1...3]

//清除两个元素
subscriptableArray[1...2] = []
subscriptableArray
print("subscriptableArray count \(subscriptableArray.count)")

// 添加新元素
var array = [0, 1]
array.append(2)
array
array.append(3)

array.insert(4, at: 0)
//移除元素 
let removedelement = array.remove(at: 0)
array
removedelement

let lastRemoved = array.removeLast()
lastRemoved
array

array.removeAll()
array

array = [0, 1, 2, 3]
array.removeAll()
array.capacity


array = [0, 1, 2, 3]
array.removeAll(keepingCapacity: true)
array.capacity
print("array count \(array.count)")
array.reserveCapacity(10)
array.capacity


// Querying an array
var arrayToCount = ["zero", "one", "two"]
let firstCount = arrayToCount.count
arrayToCount += ["three"]

let secondCount = arrayToCount.count

let firstIsEmpty = arrayToCount.isEmpty
arrayToCount.removeAll()
let secondIsEmpty = arrayToCount.isEmpty

var capacity = arrayToCount.capacity
arrayToCount.reserveCapacity(1000)
capacity = arrayToCount.capacity//为什么是1001,不是1000

//算法
var arrayToSort = [3, 2, 5, 1, 4]
arrayToSort.sort(by: {
    (s1: Int , s2: Int) -> Bool in
        return s1 > s2
})

//简化
arrayToSort.sort(by: {
    s1 , s2  in
    return s1 > s2
})

arrayToSort.sort(by: {
    s1 , s2  in s1 > s2
})

arrayToSort.sort(by: {
    $0 > $1
})

arrayToSort.sort(by: >)

arrayToSort.sort(){
    $0 > $1
}
arrayToSort.sort{
    $0 > $1
}

arrayToSort = [3, 2, 5, 1, 4]
let sortedArray = arrayToSort.sorted { $0 < $1 }
sortedArray
let descendingArray = arrayToSort.sorted { $1 < $0 }
descendingArray

sortedArray
let reversedArray = sortedArray.reversed()
reversedArray


let filteredArray = sortedArray.filter { $0 % 2 == 0 }
filteredArray

let multipliedArray = sortedArray.map { $0 * 2 }
multipliedArray

let describedArray = sortedArray.map { "Number: \($0)" }
describedArray



let addResult = sortedArray.reduce(0) { $0 + $1 }
addResult

let multipliedResult = sortedArray.reduce(0) { $0 * $1 }
multipliedResult

var operatorArray = [0, 1, 2]
operatorArray += [3]
operatorArray += [4, 5, 6]

