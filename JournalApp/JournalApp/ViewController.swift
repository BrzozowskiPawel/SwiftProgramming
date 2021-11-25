//
//  ViewController.swift
//  JournalApp
//
//  Created by Paweł Brzozowski on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

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
        
        // retive all notes
        notesModel.getNotes()
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
