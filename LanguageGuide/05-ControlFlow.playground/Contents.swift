//: Playground - noun: a place where people can play

import Cocoa
// Control Flow Chapter

// For Loops
// For-In
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// While Loops
// While
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08


var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")


// Repeat-While
square = 0
diceRoll = 0
repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")

// Conditional Statements
// If
var temperatureInFarenheit = 30
if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
}

temperatureInFarenheit = 40
if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else {
    print("It's not that cold. wear a t-shirt.")
}

temperatureInFarenheit = 90
if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else if temperatureInFarenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. wear a t-shirt.")
}

temperatureInFarenheit = 72
if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else if temperatureInFarenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

// Switch
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or consonant")
}


// No Implicit Fallthrough
let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a": // Not valid if this line is in place as no executble line for this case statement.
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}


// Interval Matching
let approximateCount = 62
let countedThings = "moons orbitiy Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "manu"
}

print("There are \(naturalCount) \(countedThings).")
// Note: Both the closed range operator (...) and half-open range operator (..<) functions are overloaded to return either an IntervalType or Range. An interval can determine whether it contains a particular element, such as when matching a switch statement case. A range is a collecton of consecutive values, which can be iterated on in a for-in statement.


// Tuples
let somePoint = (1,1)
switch somePoint {
case (0, 0):
    print("(0,0) is at the origin")
case (_, 0):
    print("\(somePoint.0),0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0, somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0, somePoint.1)) is outside of the box")
}

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhare else at (\(x), \(y))")
}

// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Control Transfer Statements
// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

puzzleOutput

// Break
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3”
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
    
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)


// Labelled Statements
board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

// Early Exit
// Guard
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
greet(person: [:])
greet(person: ["name": "John"])
greet(person: ["name":"Jane", "location": "Cupertino"])


// Checking API Availability
if #available(iOS 9, OSX 10.12, *) {
    print("Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X")
} else {
    print("Fall back to earlier iOS and OSX APIs")
}

