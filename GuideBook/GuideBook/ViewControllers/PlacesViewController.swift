//
//  PlacesViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit
import RealmSwift

class PlacesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var places: Results<Place>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get places from Realm
        places = PlaceService.getPlaces()
        
        // Setup the tbale view
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard places != nil && tableView.indexPathForSelectedRow?.row != nil else {
            return
        }
        
        let detailVC =  segue.destination as? DetailViewController
        
        if let detailVC = detailVC {
            // Set place for DetailVC.
            detailVC.place = places![tableView.indexPathForSelectedRow!.row]
        }
    }
    
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Inline if statment
        return places != nil ? places!.count : 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.PLACECELLID, for: indexPath) as! PlaceTableViewCell
        
        // Get current place
        let p = places![indexPath.row]
        
        // Configure the cell
        cell.showPlace(place_: p)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Trigger the seque to the detail VC
        performSegue(withIdentifier: Constants.Storyboard.SEGUE_DETAIL, sender: self)
        //
    }
}
