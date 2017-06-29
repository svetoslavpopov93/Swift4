//: [<< Table Of Contents](TableOfContents)
//:
//: # Associated Type Constraints
//: ## Permit where clauses to constrain associated types [SE-0142]
//:------------
//: ### In Swift 4
import Foundation

protocol MySequence {
    associatedtype Iterator : IteratorProtocol
    associatedtype SubSequence : Sequence where SubSequence.Iterator.Element == Iterator.Element
//                                          ^----- This was not allowed in the previous versions
}

//: ## Change 'filter' to return an associated type [SE-0174]
//: ### In Swift 3:
let drinks = ["Ariana Radler":2.1, "Coca-Cola":1.1, "Cappy":1.5]
var overpricedDrinks = drinks.filter { (value) -> Bool in
    return value.value > 1.5
}

type(of: overpricedDrinks) // overpricedDrinks is array of tuples

//: ### In Swift 4:
// The new filter implementation
protocol NewSequence {
    associatedtype Filtered
    associatedtype Iterator : IteratorProtocol
    
    func filter(_ isIncluded: (Iterator.Element) throws -> Bool) rethrows -> Filtered // filter(_:) will now return the associatedtype
}

// The default filter(_:) implementation of RangeReplaceableCollection
extension RangeReplaceableCollection {
    func filter(_ isIncluded: (Iterator.Element) throws -> Bool) rethrows -> Self {
        var result = Self()
        for element in self {
            if try isIncluded(element) {
                result.append(element)
            }
        }
        return result
    }
}

//: ## Support recursive constraints on associated types [SE-0157]
//: ### The following is accepted, but still not implemented
//protocol Sequence {
//    // SubSequences themselves must be Sequences.
//    // The element type of the subsequence must be identical to the element type of the sequence.
//    // The subsequence's subsequence type must be itself.
//    associatedtype SubSequence
//
//    func dropFirst(_ n: Int) -> Self.SubSequence
//    // ...
//}
//
//struct SequenceOfInts : Sequence {
//    // This concrete implementation of `Sequence` happens to work correctly.
//    // Implicitly:
//    // The subsequence conforms to Sequence.
//    // The subsequence's element type is the same as the parent sequence's element type.
//    // The subsequence's subsequence type is the same as itself.
//    func dropFirst(_ n: Int) -> SimpleSubSequence<Int> {
//        // ...
//    }
//}
//
//struct SimpleSubSequence<Element> : Sequence {
//    typealias SubSequence = SimpleSubSequence<Element>
//    typealias Iterator.Element = Element
//    // ...
//}
//:------------
//: [< Previous](@previous)   [Next >](@next)
