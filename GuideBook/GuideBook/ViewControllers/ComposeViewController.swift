//
//  ComposeViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard place != nil else {
            // if palce is nil, abort this
            return
        }
        
        var note = Note()
        
        note.text = textView.text
        
        // Creing a formater for Date()
        let formatter = DateFormatter()
        
        // Use NSDateFormatter website for more info
        formatter.dateFormat = "EEEE, MMM d, yyyy - h:mm a"
        
        // Seting formated date
        note.date = formatter.string(from: Date())
        
        note.placeId = place!.placeId!
        
        // Save the note
        NoteService.addNote(note)
        
        // Dismiss the tab
        dismiss(animated: false, completion: nil)
    }
    
}
