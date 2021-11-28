//
//  FeedViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Call the PhotoService to retrieve photos
        PhotoService.retrievePhotos { photos_ in
            self.photos = photos_
            self.tableView.reloadData()
        }
    }
    

    

}
