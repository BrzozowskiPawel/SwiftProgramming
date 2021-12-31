//import UIKit - doesnt exist for MacOS
import Foundation

// Mark: - Computed properties

//let pizzaInches: Int = 12
//var numberOFPeople: Int = 6
//let slicesPerPerson: Int = 5
//
//var numberOfSlices: Int {
//    get {
//        return pizzaInches - 4
//    }
//    // Called when there is change in numberOfSlices
//    // Without it programer cannot set new val for this propery (it can be used tho).
//    set {
//        print("Number of slices now has a new val: \(newValue)")
//    }
//}
//
//
//// Calculate number of pizzas acording to dominos
//var numberOfPizzas: Int {
//    get {
//        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
//        return numberOFPeople / numberOfPeopleFedPerPizza
//    } set {
//        let totalSlices = numberOfSlices * newValue // newValue is new value of numberOfPizzas
//        numberOFPeople = totalSlices / slicesPerPerson
//    }
//}
//
//numberOfPizzas = 4
//print(numberOfPizzas)

// MARK: - Observed properties (trigger a code when property of value is changed)

// Ex. Somebody want to buy 33" pizza which is to big value... (at least for normal human XD)

var pizzaInches: Int = 10 {
    // both willSet and didSet monitor if pizzaInches changed
    willSet {
        // Will trigger right before val is change
        print("new value of pizzaInches set to: \(newValue)") // Acces to new value
    }
    didSet {
        // Right after it changes this will execute
        print("previous value of pizzaInches set to: \(oldValue)") // Acces to old val (setted before)
        if pizzaInches >= 18 {
            print("SORRY BUT THIS PIZZA IS TOOOOOO BIG 😳 - setting piza to max (18 inch)")
            pizzaInches = 18
        }
    }
}

pizzaInches = 20

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
