//
//  DetailViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if place have been set, coz it should be done in prepare function.
        if place != nil {
            showPlace(place: place!)
        }
    }
    
    func showPlace(place: Place) {
        nameLabel.text = place.name
        adressLabel.text = place.address
        summaryLabel.text = place.summary
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func notesButtonPressed(_ sender: UIButton) {
        // Creating a VC from storyboard id
        let notesVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.NOTESVC_VC) as? NotesViewController
        
        if let notesVC = notesVC {
            // Set the palce property
            notesVC.place = place
            
            // Present the view controller
            present(notesVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        // Creating a VC from storyboard id
        let mapVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.MAP_VC) as? MapViewController
        
        if let mapVC = mapVC {
            // Set the palce property
            mapVC.place = place
            
            // Present the view controller
            present(mapVC, animated: true, completion: nil)
        }
    }
    

}
