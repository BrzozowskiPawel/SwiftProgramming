//
//  SearchViewController.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 15/02/2022.
//

import UIKit

class SearchViewController: UIViewController {

    private var titles: [Title] = [Title]()
    
    private let searchTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the title
        title =  "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .systemBackground
        
        // Add table to the view
        view.addSubview(searchTable)
        
        // Setup the table
        searchTable.delegate = self
        searchTable.dataSource = self
        
        fetchDiscoverMovies()
    }
    
    private func fetchDiscoverMovies() {
        APICaller.shared.getDiscoverMovies { resutls in
            switch resutls {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.searchTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchTable.frame = view.bounds
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let titleName = titles[indexPath.row].original_title ?? "Unknown name"
        let url = titles[indexPath.row].poster_path ?? "none"
        let model = TitleViewModel(titleName: titleName, posterURL: url)
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
