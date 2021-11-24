//
//  ViewController.swift
//  Firestore Demo
//
//  Created by Paweł Brzozowski on 22/11/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Refrence to the Firestore
        let db = Firestore.firestore()
        
        // MARK: - Adding values to Firebase
        // Do any additional setup after loading the view.
    
        
        // adding a documnet with a specyfic ID
        //db.collection("users").document("userid123").setData(["firstname":"Tom","lastname":"Bee","age":25])
        
        // Adding a document with auto ID
        //db.collection("users").addDocument(data: ["firstname":"Bob","lastname":"Bobowsky","age":100])
        
        // Adding a docu,mnet woth a utogenerted id while getting referne to the id
//        let myNewDocument = db.collection("users").document()
//        myNewDocument.setData(["firstname":"Sara","lastname":"Johns","age":01, "id":myNewDocument.documentID])
        
        // Creting another doucment for previous document ID
//        db.collection("allergies").document(myNewDocument.documentID).setData(["alergies":"peanuts"])
        
        // MARK: - Overwriting data Firebase
        // All data
        //db.collection("users").document("userid123").setData(["firstname":"Not Tom","lastname":"Not Bee","age":0])
        
        //Specific data
        //db.collection("users").document("userid123").setData(["firstname":"New name"], merge: true)
        
        //db.collection("users").document("userid123").setData(["firstname":"Not Tom","lastname":"Not Bee","age":0,"updated":"yes"], merge: true)
        
        // MARK: Updating data
        // If this exist it will udpate and if not it will add
        // db.collection("users").document("userid123").updateData(["test":"test"])
        
        // MARK: Delating data
        
        // deliting a documnet
    }
    


}

