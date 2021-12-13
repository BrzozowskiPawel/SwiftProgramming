//
//  ViewController.swift
//  MealApp
//
//  Created by Paweł Brzozowski on 13/12/2021.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var recipes = [Recipe]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Configure CollectionView
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showRecipes(_ r:[Recipe]) {
        
        // Set recipes property with passed in recipes
        recipes = r
        
        // Reload data
        recipeCollectionView.reloadData()
        
    }

}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardCell", for: indexPath) as! RecipeCardCell
        
        // Get the recipe in question
        let r = recipes[indexPath.row]
        
        // Set the recipe to the collectionview cell
        cell.recipe = r
        
        return cell
    }
    
}
