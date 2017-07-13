/*: 
[<< Table Of Contents](TableOfContents)

# One-sided ranges
------------
https://github.com/apple/swift-evolution/blob/master/proposals/0172-one-sided-ranges.md "Swift Evolution Proposal SE-0172: One-sided Ranges"
*/
let names = ["John", "Michael", "Travis", "Peter", "Joshua", "Fred"]
let n = 2
//: ### Option 1: Less/Greater than or equal to N
let namesOption1Less = names[...n]
print("Option 1, less than \(n):\n\(namesOption1Less)\n")

let namesOption1Greater = names[n...]
print("Option 1, greater than \(n):\n\(namesOption1Greater)\n")
//: ### Option 2: Less than N
let namesOption2Less = names[..<n]
print("Option 2, less than \(n):\n\(namesOption2Less)\n")
//: ### Option 3: All elements
let namesOption3 = names[...]
print("Option 3, all items: \n\(namesOption3)\n")

//:------------
//: [< Previous](@previous)   [Next >](@next)

