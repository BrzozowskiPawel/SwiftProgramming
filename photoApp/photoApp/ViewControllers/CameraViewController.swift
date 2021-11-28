//
//  CameraViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit

class CameraViewController: UIViewController {
    
    @IBOutlet weak var uploadLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // Hide all elements
        progresBar.alpha = 0
        progresBar.progress = 0
        uploadLabel.alpha = 0
        uploadLabel.text = ""
        doneButton.alpha = 0
        
    }
    func savePhoto(image:UIImage) {
        // THIS NEEDS TO BE DONE ON MAIN THREAD
        // BECASUE ITS UPDATING UI
        DispatchQueue.main.async {
            // Call the photo servie to send
            PhotoService.savePhoto(image: image) { procentage in
                // update the prgoress bar
                self.progresBar.alpha = 1
                self.progresBar.progress = Float(procentage)
                
                // update the label
                let roundedProcentage = Int(procentage * 100)
                self.uploadLabel.text = "\(roundedProcentage) %"
                self.uploadLabel.alpha = 1
                
                // check if its done
                if procentage == 1 {
                    self.doneButton.alpha = 1
                    self.uploadLabel.text = "Upload Completed ✅"
                }
            }
        }
    }

    @IBAction func doneButtonPressed(_ sender: Any) {
        // Get a refrence to the tab bar controller
        let tabBarVC = self.tabBarController as? MainTabViewController
        
        if let tabBarVC = tabBarVC {
            // call go to feed
            tabBarVC.goToFeed()
        }
        
    }
    
}
