//
//  ViewController.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    var cardsArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardsArray = model.getCards()
        
        // THIS NEEDS TO BE SET UP TO INDICATE THAT VEIWCONTROLLER IS DELEGATE
        // set the view contorller as the deatasourcse and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - CollectionViewDelegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    // This metohod get call when collection view want to crete cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a cell as reusable cell to save up memory
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        
        // return cell
        return cell
    }
    
    
    // Here we can configure the cell (right before dispaling)
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Confiure the state of the cell based on the properites of the Card that it represents
        
        let cardCell = cell as? CardCollectionViewCell
        
        // curent card
        let currentCard = cardsArray[indexPath.row]
        
        // TODO: configure cell
        cardCell?.configureCell(card: currentCard)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // check the status of the card
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false{
            //flip the card up
            cell?.flipUp()
            
            // Chech if this is fist card that wa sflipped
            if firstFlippedCardIndex == nil {
                // this is firtst card fillped
                firstFlippedCardIndex = indexPath
            } else {
                // Second card that is flipped
                
                // Run the comparison logic
                checkForMatch(indexPath)
            }
        }
        
        
    }
    
    // MARK: game logic
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath){
        // get the 2 card objects for indexes
        
        let cardOne = cardsArray[firstFlippedCardIndex!.row]
        let cardTwo = cardsArray[secondFlippedCardIndex.row]
        
        // Get the two collection view cells for cardone and cardtwo
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        // compare this two cards
        if cardOne.imageName == cardTwo.imageName {
            // its a match
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
        } else {
            // Its not match
            
            // Flip them back over
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        // reset the firstFlippedCardIndex property
        firstFlippedCardIndex = nil
    }
    
}

