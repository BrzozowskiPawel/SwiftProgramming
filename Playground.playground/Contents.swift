//import UIKit - doesnt exist for MacOS
import Foundation

// Mark: - Computed properties

let pizzaInches: Int = 14

var numberOfSlices: Int {
    get {
        return pizzaInches - 4
    }
    // Called when there is change in numberOfSlices
    // Without it programer cannot set new val for this propery (it can be used tho).
    set {
        print("Number of slices now has a new val: \(newValue)")
    }
}

numberOfSlices = 12
