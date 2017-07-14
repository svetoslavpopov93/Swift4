/*: [<< Table Of Contents](TableOfContents)

# NSNumber bridging
------------

[Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types]: https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "View in GitHub"
 
 [Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types]

------------
*/
import Foundation

let n = NSNumber(value: UInt32(543))
let v = n as? Int8


let no = NSNumber(value: UInt32(543))
let vo = n as? Int16

let nn = NSNumber(value: Int64.max)
if nn is Int16 {
    
    print("wow")
}

let nnn = NSNumber(value: Int64.max)
if nnn is Int16 {
    
    print("Swift 3")
} else if nnn is Int64 {
   
    print("Swift 4")
}
//:------------
//: [< Previous](@previous)   [Next >](@next)
