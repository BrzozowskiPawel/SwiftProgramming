//
//  PhotoService.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import CryptoKit

class PhotoService {
    static func savePhoto(image: UIImage) {
        // Check that user is logged in
        if Auth.auth().currentUser == nil{
            return
        }
        
        // Get the data representaion fo the UIImage
        let photoData = image.jpegData(compressionQuality: 0.1)
        
        guard photoData != nil else {
            // coudlnt get data from the UIImage
            return
        }
        
        // Create a filename
        let filename = UUID().uuidString
        
        // Get the user id of the current user
        let userID = Auth.auth().currentUser!.uid
        
        // Create a firebase storage path/reference
        let ref = Storage.storage().reference().child("images/\(userID)/\(filename).jpg")
        
        // Upload the data
        ref.putData(photoData!, metadata: nil) { metadata, error in
            // Chech if upload was successful
            if error == nil {
                
                // Crete a databse entry
                self.createDatabseEntry(ref: ref)
            }
        }
        
        // Upon successful upload, create the dattabase entry
    }
    
    private static func createDatabseEntry(ref: StorageReference) {
        
        // Dowload url
        ref.downloadURL { url, error in
            // If there is no error then continue
            if error == nil {
                // Photo id
                let photoId = ref.fullPath
                
                // Get the current user
                let photoUser = LocalStorageService.loadUser()
                
                // UserID
                let userId = photoUser?.userID
                
                // Username
                let username = photoUser?.username
                
                // Date
                let df = DateFormatter()
                df.dateStyle = .full
                
                let dateString = df.string(from: Date())
                
                // Create a dict of data
                let metadata = ["photoId" : photoId,"byId" : userId!,"byUsername" : username!,"date" : dateString,"url" : url!.absoluteURL.absoluteString ] as [String : Any]
                
                // Save the metadate to Firestore db
                let db = Firestore.firestore()
                
                db.collection("photos").addDocument(data: metadata) { error in
                    // Chech if saveng was succesfull
                    if error == nil {
                        // Succesully created data
                    }
                }
            }
        }
    }
    
}
