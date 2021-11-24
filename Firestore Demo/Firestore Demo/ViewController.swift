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
        // db.collection("users").addDocument(data: ["firstname":"John","lastname":"krasinki","age":40])
        
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
        
        // MARK: - Delating data
        
        // deliting a documnet
        // db.collection("users").document("a0STv31plRwHdnxv76VM").delete()
        
        // deliting a specyfic field
        // db.collection("users").document("userid123").updateData(["test":FieldValue.delete()])
        
        // MARK: - Handling errors
        
        // All methods have compliton - you can specyfic what will be done in complition
//        db.collection("users").addDocument(data: [:]) { error in
//            if error != nil {
//                print(error!)
//            }
//        }
        
        // MARK: - Reading data
        
        // reradin a single document
//        db.collection("users").document("userid123").getDocument { docSpanshot, error in
//            if error == nil && docSpanshot != nil && docSpanshot!.data() != nil{
//                // No error, we have snapshot and data
//                print(docSpanshot!.data()!)
//            } else {
//                print("Error while reading document: \(error)")
//            }
//        }
        
        // Reading a collection of documents
//        db.collection("users").getDocuments { querySpanshots, error in
//            if error == nil && querySpanshots != nil {
//            // No error, we have snapshot and da
//                for doc in querySpanshots!.documents{
//                    print(doc.documentID)
//                }
//            } else {
//                print("Error while reading document: \(error!)")
//            }
//        }
        
        // MARK: - Listening for data
        
        // Lstening in changes (single document)
//        let listener = db.collection("users").document("userid123").addSnapshotListener { docSnapshot, error in
//            if error == nil && docSnapshot != nil && docSnapshot!.data() != nil{
//                // No error, we have snapshot and data
//                print(docSnapshot!.data()!)
//            } else {
//                print("Error while reading document: \(error!)")
//            }
//
//        }
//
        // Remeber to remove the listener
        // listener.remove()
        
        // Listening for changes in a collection
//        let listener = db.collection("users").addSnapshotListener { querySnapshot, error in
//            // chech for errors
//            if error == nil && querySnapshot != nil {
//                // Reading only changes
//                for change in querySnapshot!.documentChanges {
//                    print(change.document.documentID)
//                }
//            }
//
//        }
        
        // Remeber to remove the listener
        // listener.remove()
        
        // MARK: - Quering data from FireBase
        // Example returnig everybody that have age = 20.
        
        // This return a querry -> need to add .getDocument or add a listener
//        db.collection("users").whereField("age", isEqualTo: 20).getDocuments { snapShot, error in
//            let data =  snapShot!.documents
//
//            for doc in data {
//                print(doc.documentID)
//            }
//        }
        
    }
    


}

