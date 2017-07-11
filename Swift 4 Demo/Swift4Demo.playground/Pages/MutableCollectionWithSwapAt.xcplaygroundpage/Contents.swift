/*:
[<< Table Of Contents](TableOfContents)

# Mutable Collection with swapAt
------------
 The existing `swap(_:_:)` function was originally created to support the sort algorithm , which is why it is declared in stdlib/sort.swift.gyb.
 
[SE-0173][SE-0173] introduces a new method for swapping two elements in a collection. Unlike the existing `swap(_:_:)` function, `swapAt(_:_:)` takes the indices of the elements to be swapped, not the elements themselves (via `inout` arguments).

The reason for this addition is that `swap` with two `inout` arguments is incompatible with the new exclusive memory access rules proposed in [SE-0176][SE-0176]. The existing `swap(_:_:)` function will no longer work for swapping two elements of the same collection.

[SE-0173]: https://github.com/apple/swift-evolution/blob/master/proposals/0173-swap-indices.md "Swift Evolution Proposal SE-0173: Add `MutableCollection.swapAt(_:_:)`"
[SE-0176]: https://github.com/apple/swift-evolution/blob/master/proposals/0176-enforce-exclusive-access-to-memory.md "Swift Evolution Proposal SE-0176: Enforce Exclusive Access to Memory"
 
 ### In Swift 3
*/

var elements = ["H", "O", "Na", "C", "Br"]
swap(&elements[0], &elements[1])

//: ### In Swift 4
var numbers = ["one", "two", "three", "four", "five", "six"]
numbers.swapAt(0, 3)

//:------------
//: [< Previous](@previous)   [Next >](@next)

