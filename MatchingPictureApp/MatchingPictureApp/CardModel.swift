//
//  CardModel.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import Foundation

class CardModel {
    func getCards() -> [Card]{
        // Declare an empty array to store numbers that have been generated
        var generatedNumbers = [Int]()
        
        // Declare an empty array
        var generatedCards = [Card]()
        
        // Randomly generate 8 pairs of cards
        while generatedNumbers.count < 8 {
            // Generate random number
            let randomNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randomNumber) == false {
                // Create two new card object
                let cardOne = Card()
                let cardTwo = Card(
                )
                // Set image names
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                // Add to the array
                generatedCards += [cardOne,cardTwo]
                
                generatedNumbers.append(randomNumber)
            }
            
            
        }
        // Randomize the cards withing the array
        generatedCards.shuffle()
        
        // Return the array
        return generatedCards
    }
}
