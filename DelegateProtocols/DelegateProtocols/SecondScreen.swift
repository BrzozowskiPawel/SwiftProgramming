//
//  SecondScreen.swift
//  DelegateProtocols
//
//  Created by Paweł Brzozowski on 16/11/2021.
//

// Delegate - Protocol is like master - slave.
// FirstScreen (just do something) is slave and SecondScreen(know information and send it) is master.
// Base on picked side (in SecondScreen) we are gona pass some data back to the FirstScreen
// When FirstScreen gets data it does what code says

import UIKit

// 1. Setting up Protocol (on master side)
protocol SideSelectionDelegate {
    // Just a list of function WITHOUT CODE (list of functions names)
    func didTapChoice(image: UIImage, name: String, color: UIColor)
}

class SecondScreen: UIViewController {

    // 2. Creating need to have variable to hold delegate
    var selectionDelegate: SideSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func whiteVuttonTapped(_ sender: UIButton) {
        // Imperial
        
        // 3. Declaring function as it need to be declared becase of the protocol
        selectionDelegate.didTapChoice(image: UIImage(named: "vader")!, name: "Darth Vader", color: .red)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        // Rebel
        
        // 3. Declaring function as it need to be declared becase of the protocol
        selectionDelegate.didTapChoice(image: UIImage(named: "luke")!, name: "Luke Skywalker", color: .cyan)
        dismiss(animated: true, completion: nil)
    }
    
}
