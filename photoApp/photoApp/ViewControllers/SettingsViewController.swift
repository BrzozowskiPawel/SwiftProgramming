//
//  SettingsViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutButtonTapped(_ sender: Any) {
        // Sign out from Firebase Auth
        do {
            try Auth.auth().signOut()
            
            // Clearn lolacl storage
            LocalStorageService.clearUserDefaults()
            
            // Transition to loginViewController
            let loginNavVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.loginNavController)
            
            self.view.window?.rootViewController = loginNavVC
            self.view.window?.makeKeyAndVisible()
            // This is a convenience method to show the current window and position it in front of all other windows at the same level or lower. If you only want to show the window, change its isHidden property to false.
        } catch {
            print("‼️ error while signing out the user")
            
        }
        
    }
    

}
