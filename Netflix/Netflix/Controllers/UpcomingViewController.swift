//
//  UpcomingViewController.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 15/02/2022.
//

import UIKit

class UpcomingViewController: UIViewController {

    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var titles: [Title] = [Title]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        // Setup the title
        title =  "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        // Add table to the view
        view.addSubview(upcomingTable)
        
        // Setup the table
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        // Get the data
        fetchUpcoming()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming() {
        APICaller.shared.getUpComingMovies { [weak self] results in
            switch results {
            case .success(let dowloadedTitles):
                self?.titles = dowloadedTitles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row].original_title ?? "Unknown"
        return cell
    }
    
    
}
