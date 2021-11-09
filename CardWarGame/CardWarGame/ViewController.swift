//
//  ViewController.swift
//  CardWarGame
//
//  Created by Paweł Brzozowski on 07/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var cpuScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func dealButtonPressed(_ sender: UIButton) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        leftCard.image = UIImage(named: "card"+String(leftNumber))
        rightCard.image = UIImage(named: "card"+String(rightNumber))
    }
    
}

