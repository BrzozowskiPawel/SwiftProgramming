import UIKit

var greeting = "Hello, playground"

class testClass {
    var value: Any
    
    init(testVal: Any) {
        self.value = testVal
    }
}

let obj = testClass(testVal: "10")
let obj2 = testClass(testVal: 5)

if let str = obj2.value as? String {
   // obj is a String. Do something with str
    print("Value is string")
}
else {
   // obj is not a String
    print("It's not a string")
}
