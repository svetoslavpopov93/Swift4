//: [<< Table Of Contents](TableOfContents)
//:
//: # NSNumber bridging
//:------------
/*
https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types"
*/
//:------------
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8 // nil in Swift 4. This would be 31 in Swift 3 (try it!).

//:------------
//: [< Previous](@previous)   [Next >](@next)
