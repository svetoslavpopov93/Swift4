/*: [<< Table Of Contents](TableOfContents)

# Composing classes and protocols
------------

 
[Swift Evolution Proposal SE-0156: Class and Subtype existentials]: https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md/ "View in GitHub"
[Swift Evolution Proposal SE-0156: Class and Subtype existentials]

 ------------
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
    var delegate: (View & MyProtocol)
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

//:------------
//: [< Previous](@pre⌄vious)   [Next >](@next)
