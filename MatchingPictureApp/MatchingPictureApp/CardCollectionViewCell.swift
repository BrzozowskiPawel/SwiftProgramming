//
//  CardCollectionViewCell.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configureCell(card: Card){
        // Keep track of the card this cell represents
        self.card = card
        
        // set the front img to
        frontImageView.image = UIImage(named: card.imageName)
        
        
        // reseting the status of the cell
        if card.isFlipped{
            //show fron img view
            flipUp(speed: 0)
        }
        else {
            //show back
            flipDown(speed: 0, delay: 0)
        }
        
        if card.isMatched == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }
    }
    
    func flipUp(speed:TimeInterval = 0.3) {
        // set the status of the card
        card?.isFlipped = true
        
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipDown(speed:TimeInterval = 0.3, delay: TimeInterval = 0.5) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        
        // set the status of the card
        card?.isFlipped = false
        
        
    }
    
    func remove() {
        // make the image views invisible
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
