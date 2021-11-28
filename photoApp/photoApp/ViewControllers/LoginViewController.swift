//
//  LoginViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit
import FirebaseAuthUI
import FirebaseEmailAuthUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        // Create a FirebaseAuthUI object
        let authUI = FUIAuth.defaultAuthUI()
        
        // chech that it's not nil
        if let authUI = authUI {
            // Set self as delgate for the authUI
            authUI.delegate = self
            
            // Set sign in providers
            authUI.providers = [FUIEmailAuth()]
            
            // Get the prebuilt UI view controller
            let authViewController = authUI.authViewController()
            
            // Present it
            present(authViewController, animated: true, completion: nil)
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            // There was an error
            print("error \(error!)")
            return
        }
        
        // Geting ad checking for nil user
        let user =  authDataResult?.user
        if let user = user {
            // chech on the database side if user has a profile
            UserService.retrieveProfile(userID: user.uid) { user in
                // Chechk if user is nil
                if user == nil {
                    // if user dont have a profile create a profile view contorller
                    self.performSegue(withIdentifier: Constants.profileSegue, sender: self)
                }
                else {
                    // if have profile, go to tab bar controller
                    
                    // Save user to local storage
                    LocalStorageService.saveUser(userId: user!.userID, username: user!.username)
                    
                    // Create instance of the tab abr controller
                    let tapBarVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.tabBarContoller)
                    
                    guard tapBarVC != nil else {
                        return
                    }
                    
                    // Set it as the root view coontroller of the window
                    self.view.window?.rootViewController = tapBarVC
                    self.view.window?.makeKeyAndVisible()
                    
                }
                
            }
        }
    }
}
