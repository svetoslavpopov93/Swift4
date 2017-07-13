/*:
[<< Table Of Contents](TableOfContents)

# Dictionary and Set Enchancements
------------
 
[Swift Evolution Proposal SE-0165: Dictionary and Set Enhancements]: https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md/ "View in GitHub"
 
 [Swift Evolution Proposal SE-0165: Dictionary and Set Enhancements]
 
 ------------
 ## Sequence-based initializer
*/

import Foundation

//let uniqueFriends = ["John", "Blake", "Harry"]
//let uniqueFriendsDictionary = Dictionary(uniqueKeysWithValues:zip(1..., uniqueFriends))
//                                                                  ^---- Using the newly introduced infinite array
//let allFriends = ["John", "Blake", "Harry", "John", "Johnny", "Blake"]
//let ages = [21, 23, 24, 22, 27, 25]
//
//let allFriendsDictionary = Dictionary(zip(allFriends, ages), uniquingKeysWith: {
//    friend1, friend2 in //                          ^------ Using two arrays
//    return friend1 > friend2 ? friend1 : friend2
//})

//print(allFriendsDictionary)

//: ## Merging initializer and merge method
//let duplicateTuples = [("Monday", 28),  ("Tuesday", 27)]
//var mutatingDictionary = Dictionary(uniqueKeysWithValues: tupleArray)
//
//mutatingDictionary.merge(duplicateTuples, uniquingKeysWith: min) // Mutating version
//
//let updatedDictionary = mutatingDictionary.merging(duplicateTuples, uniquingKeysWith: min) // Initializer
//
////: ## Subscript with default value
//let life = [String:Any]()
//let socialLife = life["socialLife", default: "You are a programmer. You don't have social life... :("]
//
////: ## Grouping a sequence
//let buckets = Dictionary(grouping: allFriends, by: { $0.first! })
//print(buckets)
//
//
////: ## Dictionary-specific `map` and `filter`
//var friends = ["Ivan":21, "Dimitar":22, "Kiril":32, "Nikolai":40]
//var filteredFriends = friends.filter { $0.value < 30 }
//print(filteredFriends) // filteredNames is now a filtered Dictionary, not an Array
//
//var agedFriends = friends.map { friend in
//    friend.value += 10
//}
//print(agedFriends) // agedFriends is also a Dictionory, not an Array
//
////: ## Set-specific `map`
//let numbers: Set = [1,2,3,4,5]
//let filteredNumbers = numbers.filter { $0 % 2 == 0 } // numbers is now a filtered Set, not an Array
//print(filteredNumbers)
//
//var mappedNumbers = numbers.map { number in
//    number *= 2
//}

//:------------
//: [< Previous](@previous)   [Next >](@next)

