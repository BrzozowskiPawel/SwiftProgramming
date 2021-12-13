//
//  ViewController.swift
//  MealApp
//
//  Created by Paweł Brzozowski on 13/12/2021.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var modalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        modalView.layer.cornerRadius = 8
        addButton.layer.cornerRadius = 8
        editButton.layer.cornerRadius = 8
    }
    

}
