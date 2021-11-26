//
//  ViewController.swift
//  JournalApp
//
//  Created by Paweł Brzozowski on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    private var isStarButtonPressed = false
    @IBOutlet weak var starButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private var notesModel = NotesModel()
    private var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // set self as delgate for notes model
        notesModel.delegate = self
        
        // Set the sarButton status
        setStarFilterButton()
        
        // retive all notes acording to starButton
        isStarButtonPressed ? notesModel.getNotes(true) : notesModel.getNotes()
    }

    func setStarFilterButton(){
        let imageName = isStarButtonPressed ? "star.fill" : "star"
        starButton.image = UIImage(systemName: imageName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Getting reference to the destination and set up its properties
        let notesViewController = segue.destination as! NoteViewController
        
        if tableView.indexPathForSelectedRow != nil {
            notesViewController.note = notes[tableView.indexPathForSelectedRow!.row]
            
            // Also we need to deselect the row
            tableView.deselectRow(at: tableView.indexPathForSelectedRow! , animated: true)
        }
        
        notesViewController.notesModel = self.notesModel
    }
    
    @IBAction func starTapped(_ sender: UIBarButtonItem) {
        // togle the star filter status
        isStarButtonPressed.toggle()
        
        // run query
        isStarButtonPressed ? notesModel.getNotes(true) : notesModel.getNotes()
        
        // udpate button
        setStarFilterButton()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        
        let titleLabel = cell.viewWithTag(1) as? UILabel
        let bodyLabel = cell.viewWithTag(2) as? UILabel
        
        titleLabel?.text = notes[indexPath.row].title
        bodyLabel?.text = notes[indexPath.row].body
        
        return cell
    }
    
    
    
    
    
}

extension ViewController: NotesModelProtocol {
    func notesRetrieved(notes: [Note]) {
        // set notes property and refresh
        self.notes = notes
        tableView.reloadData()
    }
    
    
}
