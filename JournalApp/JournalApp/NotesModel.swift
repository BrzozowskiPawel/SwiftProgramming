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
    var listener: ListenerRegistration?
    
    // When object isnt being used this is how we clean up memory
    deinit {
        // Unregister listener
        listener?.remove()
    }
    
    // Return the notes
    func getNotes() {
        // Get the reference to the database
        let db = Firestore.firestore()
        
        // Get all the notes
        
        self.listener = db.collection("notes").addSnapshotListener({ snapshot, error in
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
        })
    }
    
    func deleteNote(currentNote:Note) {
        let db = Firestore.firestore()
        
        db.collection("notes").document(currentNote.docId).delete()
    }
    
    func saveNote(currentNote:Note) {
        let db = Firestore.firestore()
        
        db.collection("notes").document(currentNote.docId).setData(noteToDict(currentNote: currentNote))
    }
    
    func noteToDict(currentNote:Note) -> [String:Any] {
        var dict = [String:Any]()
        dict["docId"] = currentNote.docId
        dict["title"] = currentNote.title
        dict["body"] = currentNote.body
        dict["isStarted"] = currentNote.isStarted
        dict["createdAt"] = currentNote.createdAt
        dict["lastUpdatedAt"] = currentNote.lastUpdated
        
        return dict
    }
}
