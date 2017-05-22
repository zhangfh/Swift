//: Playground - noun: a place where people can play

import Cocoa

// Swift Standard Library - Types - Numeric Types

// Boolean
var aBool: Bool
aBool = true
aBool = false
!aBool
aBool.description
aBool.customMirror
aBool.hashValue

// Int
// The primary integer type in Swift is Int, which is word-sized. This means that it holds 32 bits on 32-bit platforms, and 64 bits on 64-bit platforms.
// For the majority of use cases, you should use the base Int type.
var anInt = Int()
anInt.advanced(by: 3)
anInt.advanced(by: 5)

anInt
anInt = -10
anInt.distance(to: 20)
anInt.customMirror

// Int is 64 bit on my Mac OS X system
Int.min
Int.max

UInt.min
let maxUInt = UInt.max
print("Max UInt = \(maxUInt)")

Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max

UInt8.min
UInt8.max
UInt16.min
UInt16.max
UInt32.min
UInt32.max
UInt64.min
UInt64.max

// Floating Point
// The primary floating-point type in Swift is Double, which uses 64 bits. If you do not require 64-bit precision, Swift also includes a 32-bit Float type.
var aDouble = Double()

aDouble.advanced(by: 5)
aDouble.description
aDouble.isFinite
aDouble.isInfinite
aDouble.isNaN
aDouble.isNormal

aDouble.isSignalingNaN
aDouble.sign
aDouble.isSubnormal
aDouble.isZero

aDouble = 1.0 / 0.0
aDouble.isInfinite
aDouble.isNaN
aDouble = Double.nan

aDouble.isNaN

aDouble = Double.abs(-7.3)

