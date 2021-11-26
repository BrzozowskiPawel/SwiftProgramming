//
//  NoteViewController.swift
//  JournalApp
//
//  Created by Paweł Brzozowski on 25/11/2021.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodytextView: UITextView!
    
    var note:Note?
    var notesModel:NotesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if note != nil {
            titleTextField.text = note?.title
            bodytextView.text = note?.body
        }
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if note != nil {
            notesModel?.deleteNote(currentNote: note!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        if note == nil {
            //brand new note
            let newNote = Note(docId: UUID().uuidString, title: titleTextField.text ?? "No title", body: bodytextView.text ?? "No data", isStarted: false, createdAt: Date(), lastUpdated: Date())
            self.note = newNote
            notesModel?.saveNote(currentNote: note!)
        }
        else if note != nil {
            self.note?.title = titleTextField.text ?? "No title"
            self.note?.body = bodytextView.text ?? "No data"
            self.note?.lastUpdated = Date()
            
            // Send it to the model
            self.notesModel?.saveNote(currentNote: note!)
        }
        dismiss(animated: true, completion: nil)

    }
    
}
