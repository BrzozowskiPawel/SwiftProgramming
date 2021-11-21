//
//  ViewController.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the ViewCotroller as the datasoruce and delgate of TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Detect which article the user selected (index path)
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            return
        }
        
        // Get article that have been tapped on
        let article = articles[indexPath!.row]
        
        // get a reference to the detail view contorller
        let detailViewController = segue.destination as! DetailViewController
        
        // Pass the article url to the detail view contorller
        detailViewController.articleURL = article.url!
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article to display
        let article = articles[indexPath.row]
        
        // TODO: Cusotmize it
        cell.displayArticle(article)
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SOMETHING")
    }
    
}

extension ViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocool/ Delgate Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles
        
        // Reloading data when we have new data
        tableView.reloadData()
    }
}
