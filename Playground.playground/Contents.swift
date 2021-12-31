//import UIKit - doesnt exist for MacOS
import Foundation

// Mark: - Computed properties

let pizzaInches: Int = 12
var numberOFPeople: Int = 6
let slicesPerPerson: Int = 5

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


// Calculate number of pizzas acording to dominos
var numberOfPizzas: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOFPeople / numberOfPeopleFedPerPizza
    } set {
        let totalSlices = numberOfSlices * newValue // newValue is new value of numberOfPizzas
        numberOFPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizzas = 4

print(numberOfPizzas)
