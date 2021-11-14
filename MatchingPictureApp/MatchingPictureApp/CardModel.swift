//
//  CardModel.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an empty array to store numbers that we've generated
        var generatedNumbers = [Int]()
        
        // Declare an empty array
        var generatedCards = [Card]()
        
        // Randomly generate 8 pairs of cards
        while generatedNumbers.count < 8 {
            
            // Generate a random number
            let randomNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randomNumber) == false {
            
                // Create two new card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                // Set their image names
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                
                // Add them to the array
                generatedCards += [cardOne, cardTwo]
                
                // Add this number to the list of generated numbers
                generatedNumbers.append(randomNumber)
                
                print(randomNumber)
            }
        }
        
        // Randomize the cards within the array
        generatedCards.shuffle()
        
        // Return the array
        return generatedCards
    }
    
}
