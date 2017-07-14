/*: [<< Table Of Contents](TableOfContents)
 
 # String / Multi-line string literals
 ------------
 
 [Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding]: https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md
 
 [Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding]
 
 ------------
 */
let greeting = "Hello, 😜!"
// No need to drill down to .characters
greeting.count
for char in greeting {
    print(char)
}

/*:
 ### `Substring` is the new type for string slices
 */
let comma = greeting.index(of: ",")!
let substring = greeting[..<comma]
type(of: substring)
// String API can be called on Substring
print(substring.uppercased())
/*:
 ### Unicode 9
 
 Swift 4 will support Unicode 9, fixing [some problems with proper grapheme clustering for modern emoji][Emoji 4.0]. All the character counts below are now `1`, as they should be:
 
 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 */
"👧🏽".count // person + skin tone
"👨‍👩‍👧‍👦".count // family with four members
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // family + skin tones
"👩🏻‍🚒".count // person + skin tone + profession

/*:
 ### `Character.unicodeScalars` property
 https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */
let c: Character = "🇪🇺"
Array(c.unicodeScalars)

let galaxy = "Milky Way 🐮"
galaxy.count
let filtered = galaxy.filter { char in
    let isASCII = char.unicodeScalars.reduce(true, { $0 && $1.isASCII })
    return isASCII
}
filtered.count
//:------------
//: [< Previous](@previous)   [Next >](@next)

