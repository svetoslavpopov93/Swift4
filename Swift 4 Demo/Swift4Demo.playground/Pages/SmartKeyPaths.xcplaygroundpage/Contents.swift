/*:
[<< Table Of Contents](TableOfContents)

# Smart Key Paths
------------
https://github.com/apple/swift-evolution/blob/master/proposals/0161-key-paths.md "Swift Evolution Proposal SE-0161: Smart KeyPaths: Better Key-Value Coding for Swift"

### Declaring the objects
*/
struct Address {
    var street:String
    var zip:String
    var city:String
    var state:String
}

struct Friend {
    var name: String
    var addresses: [Address]
    
    var primaryAddress: Address {
        return addresses.first!
    }
}

let mainAddress = Address(street: "Apple Bay Street", zip: "94608", city: "Emeryville", state: "California")
let secondAddress = Address(street: "27th Way", zip: "85042", city: "Phoenix", state: "Arizona")
let friend = Friend(name: "Steve Jobs", addresses: [mainAddress, secondAddress])

//: ### Accessing the properties
let nameKey = \Friend.name
let stateKey = \Friend.primaryAddress.state

print(friend[keyPath: stateKey])
print(friend[keyPath: nameKey])

//:------------
//: [< Previous](@previous)   [Next >](@next)

