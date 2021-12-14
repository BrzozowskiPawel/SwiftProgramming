//
//  AppDelegate.swift
//  GuidebookApp
//
//  Created by Paweł Brzozowski on 03/12/2021.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var fetchedNotesRC:NSFetchedResultsController<Note>?
    
    var place:Place?
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        refresh()
    }
    
    // MARK: - Methods
    
    func refresh() {
        
        // Check if there's a place set
        if let place = place {
            
            // Get a fetch request for the places
            let request:NSFetchRequest<Note> = Note.fetchRequest()
            request.predicate = NSPredicate(format: "place = %@", place)
            
            // Set a sort descriptor
            let sort = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [sort]
            
            do {
            
                // Create a fetched results controller
                fetchedNotesRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
                
                // Execute the fetch
                try fetchedNotesRC!.performFetch()
            }
            catch {}
            
            // Tell table view to request data
            tableView.reloadData()
        }
        
    }
    
    
    @IBAction func addNoteTapped(_ sender: Any) {
        
        // Display the popup
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADDNOTES_VIEWCONTROLLER) as! AddNoteViewController
        
        // Set self as delegate so we can get notified of a new note being added
        addNoteVC.delegate = self
        
        // Pass the place object through
        addNoteVC.place = place
        
        // Configure the popup mode
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        // Present it
        present(addNoteVC, animated: true, completion: nil)
    }
    
}

extension NotesViewController: AddNoteDelegate {
    
    func noteAdded() {
        
        // Refetch the notes from core data and display in tableview
        refresh()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedNotesRC?.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NOTE_CELL, for: indexPath)
        
        // Get references to the labels
        let dateLabel = cell.viewWithTag(1) as! UILabel
        let noteLabel = cell.viewWithTag(2) as! UILabel
        
        // Get the note for this indexpath
        let note = fetchedNotesRC?.object(at: indexPath)
        
        if let note = note {
            
            let df = DateFormatter()
            df.dateFormat = "MMM d, yyyy - h:mm a"
            
            dateLabel.text = df.string(from: note.date!)
            noteLabel.text = note.text
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            
            if self.fetchedNotesRC == nil {
                // Nothing to delete
                return
            }
            
            // Get a reference to the note to be deleted
            let n = self.fetchedNotesRC!.object(at: indexPath)
            
            // Pass it to the core data context delete method
            self.context.delete(n)
            
            // Save the context
            self.appDelegate.saveContext()
            
            // Refetch results and refresh tableview
            self.refresh()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
}
