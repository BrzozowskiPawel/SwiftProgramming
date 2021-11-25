//
//  NoteModel.swift
//  JournalApp
//
//  Created by Paweł Brzozowski on 25/11/2021.
//

import Foundation
import Firebase

protocol NotesModelProtocol {
    func notesRetrieved(notes: [Note])
}

class NotesModel {
    var delegate: NotesModelProtocol?
    
    // Return the notes
    func getNotes() {
        // Get the reference to the database
        let db = Firestore.firestore()
        
        // Get all the notes
        db.collection("notes").getDocuments { snapshot, error in
            // Chech for errors:
            if error == nil && snapshot != nil {
                var notes = [Note]()
                
                for doc in snapshot!.documents {
                    
                    // Convering timestamp into a Date
                    let createdAtDate: Date = Timestamp.dateValue(doc["createdAt"] as! Timestamp)()
                    let lastUpdatedAtDate: Date = Timestamp.dateValue(doc["lastUpdatedAt"] as! Timestamp)()
                    
                    let single_note = Note(docId: doc["docId"] as! String, title: doc["title"] as! String, body: doc["body"] as! String, isStarted: doc["isStarted"] as! Bool, createdAt: createdAtDate, lastUpdated: lastUpdatedAtDate)
                    
                    notes.append(single_note)
                }
                
                // Call the delgate and pass back the notes
                // This needs to be done IN MAIN THREAD becasue it will be nesseary to update the UI
                DispatchQueue.main.async {
                    self.delegate?.notesRetrieved(notes: notes)
                }
            }
        }
    }
}
