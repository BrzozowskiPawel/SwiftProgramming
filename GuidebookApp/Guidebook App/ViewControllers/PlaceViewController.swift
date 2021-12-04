//
//  AppDelegate.swift
//  GuidebookApp
//
//  Created by Paweł Brzozowski on 03/12/2021.
//

import UIKit

class PlaceViewController: UIViewController {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    var place: Place?
    
    // Computed property
    lazy var infoViewController: InfoViewController = {
        let infoVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.INFO_VIEWCONTROLLER) as! InfoViewController
        return infoVC
    }()
    
    lazy var mapViewController: MapViewController = {
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.MAP_VIEWCONTROLLER) as! MapViewController
        return mapVC
    }()

    lazy var notesViewController: NotesViewController = {
        let noteVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.NOTES_VIEWCONTROLLER) as! NotesViewController
        return noteVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // Set the image
        if place?.imageName != nil {
            placeImage.image = UIImage(named: place!.imageName!)
        }
        
        // Set the name
        if place?.name != nil {
            nameLabel.text = place!.name
        }
        
        switchChildViewControllers(childVC: infoViewController)
    }
    
    private func switchChildViewControllers(childVC:UIViewController) {
        // Add it as a child view contorller
        addChild(childVC)
        
        // Add it's view as subview of the container view
        containerView.addSubview(childVC.view)
        
        // Set it's frame an sizing
        childVC.view.frame = containerView.bounds
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Indicate that it's now a child view controller
        childVC.didMove(toParent: self)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            switchChildViewControllers(childVC: infoViewController)
        case 1:
            switchChildViewControllers(childVC: mapViewController)
        case 2:
            switchChildViewControllers(childVC: notesViewController)
        default:
            switchChildViewControllers(childVC: infoViewController)
        }
    }
    
}
