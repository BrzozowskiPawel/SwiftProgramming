//
//  UserService.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import Foundation
import FirebaseFirestore

class UserService {
    static func createProfile(userID: String, username:String, completion: @escaping (PhotoUser?) -> Void) {
        // Get a firestore reference
        let db = Firestore.firestore()
        
        // create a dict for profile
        let profileData = ["username": username]
        
        // Cretae a document for userID
        db.collection("users").document(userID).setData(profileData) { error in
            if error == nil {
                // Create and return photo user
                var newuser = PhotoUser()
                newuser.username = username
                newuser.userID = userID
                
                completion(newuser)
            } else {
                // soemting went wrong, return nil
                completion(nil)
            }
        }
        
    }
    static func retrieveProfile(userID:String, completion: @escaping (PhotoUser?) -> Void) {
        // Get refrence to the firestore
        let db = Firestore.firestore()
        
        // Chech for a profile with userID
        db.collection("users").document(userID).getDocument { snapshot, error in
            if error != nil || snapshot == nil {
                print("‼️ Error with retrieving data or no data \(error!)")
                return
            }
            
            if let profile = snapshot!.data() {
                // Profile was found, create a new photoUser
                var newUser = PhotoUser()
                newUser.userID = snapshot?.documentID
                newUser.username = profile["username"] as? String
                
                // Return User
                completion(newUser)
            } else {
                print("Could get profile for userID \(userID)")
                // return nil
                completion(nil)
            }
        }
    }
}
