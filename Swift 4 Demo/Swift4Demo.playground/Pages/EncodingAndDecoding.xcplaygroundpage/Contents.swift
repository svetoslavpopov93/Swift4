//: [<< Table Of Contents](TableOfContents)
//:
//: # Encoding and Decoding
/*
[SE-0166] defines a way for any Swift type (classes, structs, and enums) to describe how to archive and serialize itself. Types can make themselves (un-)archivable by conforming to the `Codable` protocol.

In many cases adding the `Codable` conformance will be all you have to do for your custom types because the compiler can generate a default implementation if all of the typesʼ members are themselves `Codable`. You can also override the default behavior if you need to customize how your type encodes itself. There is a lot to this topic — make sure to read the proposal for details.

[SE-0166]: https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md "Swift Evolution Proposal SE-0166: Swift Archival & Serialization"

*/
//:------------
// Make a custom type archivable by conforming it (and all its members) to Codable

import Foundation

let json = """
[
    {
        "name": "Banana",
        "points": 200,
        "description": "A banana grown in Ecuador."
    },
    {
        "name": "Orange",
        "points": 100,
        "description": "An orange."
    }
]
""".data(using: .utf8)!

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "product_name"
        case points = "product_cost"
        case description
    }
}

let groceries = [GroceryProduct(name: "Grapes", points: 230, description: "A mixture of red and green grapes."), GroceryProduct(name: "Lemons", points: 2300, description: "An extra sour lemon.")]

/*:
 ### Encoding
 
 Once you have a `Codable` value, you need to pass it to an encoder in order to archive it.
 
 Youʼll be able to write your own encoders and decoders that make use of the `Codable` infrastructure, but Swift will also come with a built-in set of encoders and decoders for JSON (`JSONEncoder` and `JSONDecoder`) and property lists (`PropertyListEncoder` and `PropertyListDecoder`). These are defined in [SE-0167][SE-0167]. `NSKeyedArchiver` will also support all `Codable` types.
 
 [SE-0167]: https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md "Swift Evolution Proposal SE-0167: Swift Encoders"
 */


var encoder = JSONEncoder()

//// Properties offered by JSONEncoder to customize output
encoder.dataEncodingStrategy
encoder.dateEncodingStrategy
encoder.nonConformingFloatEncodingStrategy
encoder.outputFormatting
encoder.userInfo

let jsonData = try encoder.encode(groceries)
String(data: jsonData, encoding: .utf8)

/*:
 ### Decoding
 */
let decoder = JSONDecoder()
let decoded = try decoder.decode([GroceryProduct].self, from: jsonData)
for product in decoded {
    print("\t\(product.name) (\(product.points) points): \(product.description)")
}
//:------------
//: [< Previous](@previous)   [Next >](@next)
