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
        
        // Set viewcontroller as the datasource and delgate
        tableView.delegate = self
        tableView.dataSource = self

        // Add pull to refresh
        addRefreshControl()
        
        // Do any additional setup after loading the view.
        // Call the PhotoService to retrieve photos
        PhotoService.retrievePhotos { photos_ in
            self.photos = photos_
            self.tableView.reloadData()
        }
    }
    
    func addRefreshControl() {
        // crete a refresh controll
        let refresh = UIRefreshControl()
        
        // set target
        refresh.addTarget(self, action: #selector(refreshFeed(refreshControl:)), for: .valueChanged)
        
        // add totableview
        self.tableView.addSubview(refresh)
    }
    
    @objc func refreshFeed(refreshControl: UIRefreshControl) {
        PhotoService.retrievePhotos { newPhotos in
            // Asign new photos to array
            self.photos = newPhotos
            
            DispatchQueue.main.async {
                // refresh tableview
                self.tableView.reloadData()
                
                // Stop the spinner
                refreshControl.endRefreshing()
            }

        }
    }
    
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a Photo cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.photoCellId, for: indexPath) as? PhotoTableViewCell
        
        // Get the phoyo this cell is displaying
        let photo = self.photos[indexPath.row]
        
        // Cal display photo method
        cell?.displayPhoto(photo: photo)
        
        // return the cell
        return cell!
        
    }
    
    
}
