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
    @IBOutlet weak var starButton: UIButton!
    
    var note:Note?
    var notesModel:NotesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if note != nil {
            titleTextField.text = note?.title
            bodytextView.text = note?.body
            
            switchStar()
        } else {
            //brand new note
            let newNote = Note(docId: UUID().uuidString, title: titleTextField.text ?? "", body: bodytextView.text ?? "", isStarred: false, createdAt: Date(), lastUpdated: Date())
            self.note = newNote
            notesModel?.saveNote(currentNote: note!)
            switchStar()
        }
    }
    
    func switchStar() {
        if note?.isStarred == true {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
        if note?.isStarred != true{
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Clear out the texview
        self.note = nil
        titleTextField.text = ""
        bodytextView.text = ""
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if note != nil {
            notesModel?.deleteNote(currentNote: note!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        if note != nil {
            self.note?.title = titleTextField.text ?? ""
            self.note?.body = bodytextView.text ?? ""
            self.note?.lastUpdated = Date()
            
            // Send it to the model
            self.notesModel?.saveNote(currentNote: note!)
        }
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func starButtonPressed(_ sender: UIButton) {
        // Change the property of note
        note?.isStarred.toggle()
        
        // update databse
        if self.note != nil {
            notesModel?.updateIsStarred(self.note!.docId, isStarred: self.note!.isStarred)
        }
        
        // upadte start button
        switchStar()
    }
    
    
}
