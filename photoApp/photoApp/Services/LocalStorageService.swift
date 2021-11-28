//
//  LocalStorageService.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import Foundation
import CryptoKit

class LocalStorageService {
    static func saveUser(userId: String?, username:String?) {
        // Get a refrence to the user defaults by returning shared object
        let defaults = UserDefaults.standard
        
        // Save the userId and username to defaults
        defaults.set(userId, forKey: Constants.userIdKey)
        defaults.set(username, forKey: Constants.usernameKey)
    }
    
    static func loadUser() -> PhotoUser? {
        
        // Geta  reference to user defaults
        let defaults = UserDefaults.standard
        
        // Get the username and id
        let username = defaults.value(forKey: Constants.usernameKey) as? String
        let userId = defaults.value(forKey: Constants.userIdKey) as? String
        
        // Return the results
        if userId != nil && username != nil {
            return PhotoUser(userID: userId, username: username)
        } else {
            // Cannot  retrived
            return nil
        }
    }
    
    static func clearUserDefaults() {
        // get a refrence to the user defaults
        let defualts = UserDefaults.standard
        
        // Clear the values
        defualts.set(nil, forKey: Constants.userIdKey)
        defualts.set(nil, forKey: Constants.usernameKey)
    }
}
