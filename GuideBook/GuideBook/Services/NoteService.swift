//
//  NoteService.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 08/12/2021.
//

import Foundation
import RealmSwift

class NoteService {
    static var notifiactionToken: NotificationToken?
    
    static func getNotes(placeId: String, updates: @escaping () -> Void) -> Results<Note> {
        // Get a ref to the realm file
        let realm = try! Realm()
        
        // Retriev the results
        let results = realm.objects(Note.self).filter("placeId = %@", placeId).sorted(byKeyPath: "date", ascending: false)
        
        if notifiactionToken != nil {
            // Make sure to close obserwer before oepning another one
            notifiactionToken?.invalidate()
        }
        notifiactionToken = results.observe { (changes) in
            switch changes {
            case .update:
                updates()
            case .error:
                break
            case .initial:
                break
            }
        }
        
        // Return the results
        return results
    }
    
    static func addNote(_ note: Note) {
        // Get a ref to the realm file
        let realm = try! Realm()
        
        //Add the new note to the realm file
        try! realm.write({
            realm.add(note)
        })
    }
}
