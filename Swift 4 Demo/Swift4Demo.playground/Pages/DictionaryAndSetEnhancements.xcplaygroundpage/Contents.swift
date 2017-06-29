//: [<< Table Of Contents](TableOfContents)
//:
//: # Dictionary and Set Enchancements
//:------------
//: ## Creating dictionary using array elements
import Foundation

let uniqueFriends = ["John", "Blake", "Harry"]
let uniqueFriendsDictionary = Dictionary(uniqueKeysWithValues:zip(1..., uniqueFriends))
//                                                                  ^---- Using the newly introduced infinite array
let allFriends = ["John", "Blake", "Harry", "John", "Johnny", "Blake"]
let ages = [21, 23, 24, 22, 27, 25]

let allFriendsDictionary = Dictionary(zip(allFriends, ages), uniquingKeysWith: {
    friend1, friend2 in //                          ^------ Using two arrays
    return friend1 > friend2 ? friend1 : friend2
})

print(allFriendsDictionary)

//: ## Provide default value if value for key does not exist
let life = [String:Any]()
let socialLife = life["socialLife", default: "You are a programmer. You don't have social life... :("]

//: ## Partition array in different buckets
let buckets = Dictionary(grouping: allFriends, by: { $0.first! })
print(buckets)
 
//:------------
//: [< Previous](@previous)   [Next >](@next)

