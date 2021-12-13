//
//  NotesViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var place: Place?
    var notes: Results<Note>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get notes for specifyci place
        if place != nil {
            notes =  NoteService.getNotes(placeId: place!.placeId!, updates: {
                // Notes result set has updated so reload the tableview
                self.tableView.reloadData()
            })
        }
        
        // COnfigure tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the dynamic cell height dyanmic
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func composeButtonTapped(_ sender: UIBarButtonItem) {
        // Create a new compose VC
        let composeVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.COMPOSE_VC) as? ComposeViewController
        
        if let composeVC = composeVC {
            // Set the properties
            composeVC.place = place
            
            // Set the rpesenation mode
            composeVC.modalPresentationStyle = .fullScreen
            
            // Present it
            present(composeVC, animated: false, completion: nil)
        }
        
    }
    
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes != nil ? notes!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.NOTECELLID, for: indexPath) as! NoteTableViewCell
        
        // Get a note
        let note = notes![indexPath.row]
        
        // Configure the cell
        cell.configureNoteCell(note: note)
        
        // Set the 
        return cell
    }
    
    
    
}


