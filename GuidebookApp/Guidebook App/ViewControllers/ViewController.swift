//
//  AppDelegate.swift
//  GuidebookApp
//
//  Created by Paweł Brzozowski on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get the places from core data
        do {
            places = try context.fetch(Place.fetchRequest())
        }
        catch {
            print("Couldn't fetch places from our database")
        }
        
        // Set view controller as the delegate and data source of the tableview
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Doublechack thah row was selcted
        if tableView.indexPathForSelectedRow == nil {
            return
        }
        
        // Get the selcted prace form array
        let selectedPlace =  self.places[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference ot the place view contorller
        let placeVC = segue.destination as! PlaceViewController
        
        // Set the place property od PlaceVC
        placeVC.place = selectedPlace
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // Get a cell reference
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PLACE_CELL) as! PlaceTableViewCell
        
        // Get the place
        let p = self.places[indexPath.row]
        
        // Customize the cell for the place that we're trying to show
        cell.setCell(p)
        
        // Return the cell
        return cell
    }
    
    
    
    
    
}
