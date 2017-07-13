/*:
[<< Table Of Contents](TableOfContents)

# Mutable Collection with swapAt
------------
https://github.com/apple/swift-evolution/blob/master/proposals/0173-swap-indices.md "Swift Evolution Proposal SE-0173: Add `MutableCollection.swapAt(_:_:)`"
https://github.com/apple/swift-evolution/blob/master/proposals/0176-enforce-exclusive-access-to-memory.md "Swift Evolution Proposal SE-0176: Enforce Exclusive Access to Memory"
 
 ### In Swift 3
*/

var elements = ["H", "O", "Na", "C", "Br"]
//swap(&elements[0], &elements[1])

//: ### In Swift 4
var numbers = ["one", "two", "three", "four", "five", "six"]
numbers.swapAt(0, 3)

//:------------
//: [< Previous](@previous)   [Next >](@next)

