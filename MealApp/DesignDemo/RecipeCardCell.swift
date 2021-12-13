//
//  ViewController.swift
//  MealApp
//
//  Created by Paweł Brzozowski on 13/12/2021.
//

import UIKit

class RecipeCardCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImageViewContainer: UIView!
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    var recipe:Recipe? = nil {
        
        didSet {
            
            if recipe != nil {
                // Set the image when the recipe property is set
                recipeImageView.image = UIImage(named: recipe!.cardImage)
                
                // Round the corners of the image view
                recipeImageView.layer.cornerRadius = 8
                
                // Set the drop shadow
                recipeImageViewContainer.layer.shadowColor = UIColor.black.cgColor
                recipeImageViewContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
                recipeImageViewContainer.layer.shadowOpacity = 0.4
                recipeImageViewContainer.layer.shadowRadius = 0.1
                recipeImageViewContainer.layer.shadowPath = UIBezierPath(roundedRect: recipeImageViewContainer.bounds, cornerRadius: 8).cgPath
                recipeImageViewContainer.layer.masksToBounds = false
                recipeImageViewContainer.clipsToBounds = false
            }
        } // End didSet
    }
    
}
