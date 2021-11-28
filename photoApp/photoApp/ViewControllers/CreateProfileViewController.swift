//
//  CreateProfileViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit
import FirebaseAuth

class CreateProfileViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func confirmButtonTapped(_ sender: Any) {
        // Check that there is a user logged in
        guard Auth.auth().currentUser != nil else{
            // no user logged in
            return
        }
        
        // Get the username and check if it valid username
        let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if username == nil || username == ""{
            // show error message
            return
        }
        
        // Call the user service to create a profile
        UserService.createProfile(userID: Auth.auth().currentUser!.uid, username: username!) { user in
            // Check if it was created succesully
            if user != nil {
                // Save user to local storage
                LocalStorageService.saveUser(userId: user!.userID, username: user!.username)
                
                // If there is user, go to the TabBarVV
                let tabBarVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.tabBarContoller)
                self.view.window?.rootViewController = tabBarVC
                self.view.window?.makeKeyAndVisible()
            }
            // If there is no user display error
            
        }
        
        
        
        
    }
    

}
