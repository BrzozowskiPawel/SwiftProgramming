//
//  SearchViewController.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 15/02/2022.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the title
        title =  "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    

}
