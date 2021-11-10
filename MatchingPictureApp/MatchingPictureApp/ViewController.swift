//
//  ViewController.swift
//  MatchingPictureApp
//
//  Created by Paweł Brzozowski on 10/11/2021.
//

import UIKit

class ViewController: UIViewController {

    let model = CardModel()
    var cardsArray = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardsArray = model.getCards()
    }


}

