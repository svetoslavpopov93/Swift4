/*: [<< Table Of Contents](TableOfContents)

# Encoding and Decoding
------------

[Swift Evolution Proposal SE-0166: Swift Archival & Serialization]: https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md "View in GitHub"
 
[Swift Evolution Proposal SE-0166: Swift Archival & Serialization]
 
------------
*/

import Foundation

let json = """
[
    {
        "product_name": "Bananas",
        "product_cost": 200,
        "description": "A banana grown in Ecuador."
    },
    {
        "product_name": "Oranges",
        "product_cost": 100,
        "description": "A juicy orange."
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
 https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md "Swift Evolution Proposal SE-0167: Swift Encoders"
 */


var encoder = JSONEncoder()

// Properties offered by JSONEncoder to customize output
encoder.dataEncodingStrategy
encoder.nonConformingFloatEncodingStrategy
encoder.outputFormatting
encoder.userInfo

let encoded = try encoder.encode(groceries)
String(data: encoded, encoding: .utf8)

/*:
 ### Decoding
*/

let decoder = JSONDecoder()
let products = try decoder.decode([GroceryProduct].self, from: json)

for product in products {
    print("\t\(product.name) (\(product.points) points): \(product.description)")
}

let encodedProducts = try decoder.decode([GroceryProduct].self, from: encoded)

for product in encodedProducts {
    print("\t\(product.name) (\(product.points) points): \(product.description)")
}

//:------------
//: [< Previous](@previous)   [Next >](@next)
