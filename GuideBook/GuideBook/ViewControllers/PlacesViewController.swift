//
//  PlacesViewController.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import UIKit
import RealmSwift

class PlacesViewController: UIViewController {

    
    var places: Results<Place>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        places = PlaceService.getPlaces()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
