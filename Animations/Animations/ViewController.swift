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
        
    }
    
    // All code inde components fodler.
    @IBAction func animatedButtonPressed(_ sender: Any) {
        switch animationSegmentedController.selectedSegmentIndex
            {
            case 0:
            animationTypeLabel.text = "Shake animation"
            animatedLabel.shakeAnimation(shakeVal: 5)
            animatedButton.shakeAnimation(shakeVal: 5)
            case 1:
            animationTypeLabel.text = "Fade animation"
            animatedLabel.fadeAnimation()
            animatedButton.fadeAnimation()
            case 2:
            animationTypeLabel.text = "Scale animation"
            animatedLabel.scaleAnimation(startSize: 1, endSize: 2)
            animatedButton.scaleAnimation(startSize: 1, endSize: 2)
            default:
                break
            }
    }
    
}

