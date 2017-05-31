//: Playground - noun: a place where people can play

import UIKit

//1.Array
//An ordered, random-access collection.

////数组的声明方式
var oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15] //1
var emptyDoubles: [Double] = [] //2
var emptyFloats: Array<Float> = Array() //3
var digitCounts = Array(repeating: 0, count: 10)
var literalarray : [Int] = Array(arrayLiteral: 1,3,4)

//数组是值拷贝
var copyarray = oddNumbers
oddNumbers = []
print("copyarray \(copyarray)") //清空oddNumbers后，copyarray并没有变化
//数组能力
copyarray.capacity
//数组数量
copyarray.count
//debug string
copyarray.debugDescription

copyarray.endIndex //endIndex一定大于最后一个索引
copyarray.startIndex
oddNumbers.endIndex//空数组其实没有意义


copyarray.indices

copyarray.underestimatedCount

copyarray.dropFirst()
print(copyarray)
copyarray.dropFirst(3)

copyarray.elementsEqual([1,3,5])

//遍历所有数组值
for item in copyarray {
    print("every element in copyarray: \(item).")
}

for (key,value) in copyarray.enumerated() {
    print("\(key) : \(value)")
}
//检查数组是否为空
if oddNumbers.isEmpty
{
    print("now oddNUmbers array is null")
}


let filterarray = copyarray.filter({$0 > 5 })
print("filterarray: \(filterarray)")

let first = copyarray.first(where: {$0 > 13 } )
print("first where is \(first!)")

//读取数组的第一个值和最后一个值 ，如果为空，那么返回为nil
 print("first element is \(copyarray.first!)")//由于是optional，必须解包
 print("first element in oddNumber is \(oddNumbers.first)")
 //print("first element in oddNumber is \(oddNumbers.first!)") //nil强制解包会发生错误
 let lastelement = copyarray.last
//通过下标读取数组的每一个值
print(" the third element is \(copyarray[3])")

//向数组中增加元素
 copyarray.append(10)
//向数组中增加数组
 copyarray.append(contentsOf: [44, 99])

//向数组中插入元素
copyarray.insert(76, at: 3)//注意数组以0开始索引，所以现在3就是插入第4个
//向数组中插入数组
copyarray.insert(contentsOf:[921,12], at:3)

//移除数组中的元素
let returnvalue = copyarray.remove(at: 0)
print("returnvalue is \(returnvalue), array is \(copyarray)")
//移除最后一个元素
copyarray.removeLast() //同样会返回移除后的元素
//移除元素通过range
copyarray.removeSubrange(0...2)
print("after removerange \(copyarray)")
//通过下标替换数组中的元素
copyarray[2] = 99
print("update: \(copyarray)")
//返回第一次出现值的索引,肯定是optional
let i = copyarray.index(of: 99)
//append操作会引起内存分配，所以会有性能问题
//当数组的元素是类或者@objc 协议时，存储有可能是一块连续的存储或nsarray

