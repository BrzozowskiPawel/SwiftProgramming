//
//  FirstScreen.swift
//  DelegateProtocols
//
//  Created by Paweł Brzozowski on 16/11/2021.
//

import UIKit

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
        present(secondScreenVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
