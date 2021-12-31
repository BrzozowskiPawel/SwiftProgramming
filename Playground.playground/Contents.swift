import UIKit

var greeting = "Hello, playground"

// Mark: - Computed properties

let pizzaInches: Int = 14

var numberOfSlices: Int {
    return pizzaInches - 4
}

print(numberOfSlices)
