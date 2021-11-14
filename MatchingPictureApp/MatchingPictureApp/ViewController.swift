//
//  ViewController.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    var cardsArray = [Card]()
    
    var firstFlippedCardIndex:IndexPath?
    
    var timer:Timer?
    var miliseconds:Int = 100 * 1000
    
    var soundPlayer = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardsArray = model.getCards()
        
        // THIS NEEDS TO BE SET UP TO INDICATE THAT VEIWCONTROLLER IS DELEGATE
        // set the view contorller as the deatasourcse and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Initalize the timer
        // timerInterval -> times of one tick (in this case 1 ms, this if time of f = 1/T)
        // target -> this class
        // selector -> #selector(<my func>)
        // userInfo -> additonal options
        // repeats -> tiemr should loop after timerInterval
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        // timer can run in background, its wont be stopped while scrolling
        RunLoop.main.add(timer!, forMode: .common)
        
    }
    
    // This is called when user se tscreen
    override func viewDidAppear(_ animated: Bool) {
        // play shufle sound
        soundPlayer.plasySound(effect: .shuffle)
    }
    // MARK: - Timer Methods
    
    @objc func timerFired() {
        // Decrement the counter
        miliseconds -= 1
        
        // Update the label
        let seconds:Double = Double(miliseconds)/1000.0
        timerLabel.text =  String(format: "Time left: %.2f", seconds)
        
        // stop the timer if it 0
        if miliseconds <= 0 {
            timer?.invalidate()
            timerLabel.textColor = .red
            // Check if the user has cleared all the pairs
            checkForGameEnd()
        }
        
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
        
        // configure cell
        cardCell?.configureCell(card: currentCard)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if miliseconds <= 0 {
            return
        }
        // get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // check the status of the card
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false{
            //flip the card up
            cell?.flipUp()
            
            // play shufle sound
            soundPlayer.plasySound(effect: .flip)
            
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
            
            // play match sound
            soundPlayer.plasySound(effect: .match)
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            // Was that the last pair?
            checkForGameEnd()
        } else {
            // Its not match
            
            // play not match sound
            soundPlayer.plasySound(effect: .nomach)
            
            // Flip them back over
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
            
        }
        
        // reset the firstFlippedCardIndex property
        firstFlippedCardIndex = nil
    }
    
    func checkForGameEnd() {
        // Check if there is any card that is unmatched
        var hasWon = true
        
        for singleCard in cardsArray{
            if singleCard.isMatched == false{
                // We found card unmatched
                hasWon = false
                
                // End looping
                break
            }
        }
        if hasWon{
            // User has won, show an alert
            showAlert(title: "Congratulations!", message: "You have wont the game")
            
        } else {
            // User hasnt won yet, check if there any time left
            if miliseconds <= 0 {
                showAlert(title: "Time's up :(", message: "Try one more time")
            }
        }
    }
    
    func showAlert(title:String, message:String){
        // create an allert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // create action with Ok button to dismiss it
        let okAlerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        // add action to the alert (othewise it wont show button)
        alert.addAction(okAlerAction)
        
        // present allert with action
        present(alert, animated: true, completion: nil)
    }
    
}

