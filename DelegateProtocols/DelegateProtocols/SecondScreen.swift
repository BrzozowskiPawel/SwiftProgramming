//
//  SecondScreen.swift
//  DelegateProtocols
//
//  Created by Paweł Brzozowski on 16/11/2021.
//

import UIKit

class SecondScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func whiteVuttonTapped(_ sender: UIButton) {
        // Imperial
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        // Rebel
        dismiss(animated: true, completion: nil)
    }
    
}
