//
//  ViewController.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationSegmentedController: UISegmentedControl!
    @IBOutlet weak var animationTypeLabel: UILabel!
    @IBOutlet weak var animatedButton: AnimatedButton!
    @IBOutlet weak var animatedLabel: AnimatedLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animationSegmentedController(_ sender: Any) {
        switch animationSegmentedController.selectedSegmentIndex
            {
            case 0:
            animatedLabel.text = "1"
            case 1:
            animatedLabel.text = "2"
            default:
                break
            }
    }
    
    
}

