//
//  AppDelegate.swift
//  GuidebookApp
//
//  Created by Paweł Brzozowski on 03/12/2021.
//

import UIKit
import CoreData

protocol AddNoteDelegate {
    
    func noteAdded()
}

class AddNoteViewController: UIViewController {

    // MARK: - Variables and Properties
    
    var delegate:AddNoteDelegate?
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardView.layer.cornerRadius = 5
        cardView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        // Create a new note
        // Configure the properties
        let n = Note(context: context)
        n.date = Date()
        n.text = textView.text
        n.place = place
        
        // Save the core data context
        appDelegate.saveContext()
        
        // Let the delegate know that the note was added
        delegate?.noteAdded()
        
        // Dismiss the popup
        dismiss(animated: true, completion: nil)
    }
    
}
