//: [<< Table Of Contents](TableOfContents)
//:
//: # Composing classes and protocols
//:------------
/*
[SE-0156]: You can now write the equivalent of the Objective-C code `UIViewController <SomeProtocol> *` in Swift, i.e. declare a variable of a concrete type and constrain it to one or more protocols at the same time. The syntax is `let variable: SomeClass & SomeProtocol1 & SomeProtocol2`.
 https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md "Swift Evolution Proposal SE-0156: Class and Subtype existentials"
*/
import Foundation
import UIKit


protocol HeaderView {
    
    
}

class ViewController: UITableViewController {
    let header: UIView & HeaderView
    
    init(header: UIView & HeaderView) {
        self.header = header
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder decoder: NSCoder) {
        fatalError("not implemented")
    }
}

// Can't pass in a simple UIView that doesn't conform to the protocol
//ViewController(header: UIView())
// error: argument type 'UIView' does not conform to expected type 'UIView & HeaderView'

// Must pass in an UIView (subclass) that also conforms to the protocol
extension UIImageView: HeaderView {}

ViewController(header: UIImageView()) // works

//OR

protocol MyProtocol { }
class View { }
class ViewSubclass: View, MyProtocol { }

class MyClass {
    var delegate: (View & MyProtocol)?
}

let myClass = MyClass()
//myClass.delegate = View() // error: cannot assign value of type 'View' to type '(View & MyProtocol)?'
myClass.delegate = ViewSubclass()

// OR
protocol Shakeable {
    
    func shake()
}

extension UIButton: Shakeable {
    func shake() {
        print("UIButton -> shake")
    }
}
extension UISlider: Shakeable {
    func shake() {
        print("UISlider -> shake")
    }
}
func shakeEm(controls: [UIControl & Shakeable]) {
    for control in controls {
        
        control.shake()
    }
}
/*
[SE-0143]: Conditional conformances express the notion that a generic type will conform to a particular protocol only when its type arguments meet certain requirements.
https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md
*/

//extension Array: Equatable where Element: Equatable {
//    static func ==(lhs: Array<Element>, rhs: Array<Element>) -> Bool { ... }
//}
//:------------
//: [< Previous](@pre⌄vious)   [Next >](@next)
