//
//  Photo.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import Foundation
import FirebaseFirestore

struct Photo {
    var photoId: String?
    var byId: String?
    var byUsername: String?
    var date: String?
    var url: String?
    
    init? (snapshot:QueryDocumentSnapshot) {
        // parse the data out
        let data = snapshot.data()
        
        let photoId = data["photoId"] as? String
        let userId = data["byId"] as? String
        let username = data["byUsername"] as? String
        let date = data["date"] as? String
        let url = data["url"] as? String
        
        // check for missing data
        if photoId == nil || userId == nil || username == nil || date == nil || url == nil {
            // Not a valid photo struct
            return nil
        }
        
        // set our properties
        self.photoId = photoId
        self.byId = userId
        self.byUsername = username
        self.date = date
        self.url = url
        
    }
}
