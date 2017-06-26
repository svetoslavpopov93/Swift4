//: [<< Table Of Contents](TableOfContents)
//:
//: # Associated Type Constraints
//: ## Permit where clauses to constrain associated types [SE-0142]
//:------------

//: ### In Swift 4
import Foundation

protocol SequenceABC {
    
    associatedtype Iterator : IteratorProtocol
    associatedtype SubSequence : Sequence where SubSequence.Iterator.Element == Iterator.Element
    // ^----- This was not allowed in the previous versions
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

protocol SequenceABCD {
    
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
//protocol Testable {
//    associatedtype SubSequence
//    associatedtype Iterator : IteratorProtocol
//    func dropFirst(_ n: Int) -> Self.SubSequence
//}
//
//struct SequenceOfInts : Testable {
//
//    func dropFirst(_ n: Int) -> SequenceOfInts.SubSequence {
//
//        let sub: SimpleSubSequence<Int> = SimpleSubSequence()
//        return sub
//    }
//}
//
//struct SimpleSubSequence<Element> : Testable {
//
//    typealias SubSequence = SimpleSubSequence<Element>
//
//}
//: [< Previous](@previous)   [Next >](@next)
