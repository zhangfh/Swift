//: Playground - noun: a place where people can play

import Cocoa

// 构造函数
let emptyString = String()
// 方便
let equivilentString = ""

let repeatedString = String(["a","b"])

// Querying a String
var string = "Hello, world!"
let firstCheck = string.isEmpty
string = ""
let secondCheck = string.isEmpty

string = "Hello, world!"
let hasPrefixFirstCheck = string.hasPrefix("Hello")
let hasPrefixSecondCheck = string.hasPrefix("hello")

let hasSuffixFirstCheck = string.hasSuffix("world!")
let hasSuffixSecondCheck = string.hasSuffix("World!")

// Changing and Converting Strings
string = "42"
if let number = Int(string) {
    print("Got the number: \(number)")
} else {
    print("Couldn't convert to a number")
}
// Operators
// Concatinate +
let combination = "Hello " + "world"
// You can use the + operator with two strings as shown in the combination example, or with a string and a character in either order:
let exclamationPoint: Character = "!"
var charCombo = combination
charCombo.append(exclamationPoint)

// Append +=
string = "Hello "
string += "world"
string.append(exclamationPoint)
string

// Equality ==
let string1 = "Hello world!"
let string2 = "Hello" + " " + "world" + "!"
let equality = string1 == string2

// Less than <
let stringGreater = "Number 3"
let stringLesser = "Number 2"
let resulNotLessThan = stringGreater < stringLesser
let resultIsLessThan = stringLesser < stringGreater

"abc" < "def"
"def" < "abc"

"abc" > "def"
"d" > "abc"
"Number 2" > "number 1"

