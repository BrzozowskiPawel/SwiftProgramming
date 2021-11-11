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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a cell as reusable cell to save up memory
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        // TODO: configure cell
        
        // return cell
        return cell
    }
    
}

