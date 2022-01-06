//
//  FirstScreen.swift
//  DelegateProtocols
//
//  Created by Paweł Brzozowski on 16/11/2021.
//


// Delegate - Protocol is like master - slave.
// FirstScreen (just do something) is slave and SecondScreen(know information and send it) is master.
// Base on picked side (in SecondScreen) we are gona pass some data back to the FirstScreen
// When FirstScreen gets data it does what code says

import UIKit

// This screen just gets the information and show it.
class FirstScreen: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting button radius to make it rounded
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height/2
    }
    
    // When user press this button, screen is changed
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let secondScreenVC = storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! SecondScreen
        
        // 4. Setting SecondScreen var as this class (This class want to by slave for master).
        secondScreenVC.selectionDelegate = self
        present(secondScreenVC, animated: true, completion: nil)
    }

}

// 5. Creating extension for this ViewController to fulfill Protocol requariments
extension FirstScreen: SideSelectionDelegate {
    // 6. This function will be called when SecondScreen (master) calls this funtion.
    //    In thic ViewController this inst being called by user.
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        mainImageView.image = image
        nameLabel.text = name
        view.backgroundColor = color
    }
    
    
}
