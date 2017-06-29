//: [<< Table Of Contents](TableOfContents)
//:
//: # Generic subscripts
/*
 Courtesy of [SE-0148], subscripts can now have generic arguments and/or return types.
  https://github.com/apple/swift-evolution/blob/master/proposals/0148-generic-subscripts.md "Swift Evolution Proposal SE-0148: Generic Subscripts"
 */
//:------------
struct JSON {
    fileprivate var storage: [String:Any]
    
    init(dictionary: [String:Any]) {
        self.storage = dictionary
    }
    
    subscript<T>(key: String) -> T? {
        return storage[key] as? T
    }
}

let json = JSON(dictionary: [
    "name": "Berlin",
    "country": "de",
    "population": 3_500_500
    ])

// No need to use as? Int
let population: Int? = json["population"]

/*:
 Another example: a subscript on `Collection` that takes a generic sequence of indices and returns an array of the values at these indices:
 */
extension Collection {
    subscript<Indices: Sequence>(indices indices: Indices) -> [Element] where Indices.Element == Index {
        var result: [Element] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

let words = "Lorem ipsum dolor sit amet".split(separator: " ")
words[indices: [1,2]]
//:------------
//: [< Previous](@previous)   [Next >](@next)

