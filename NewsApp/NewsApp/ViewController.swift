//
//  ViewController.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 19/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ArticleModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get the articles from the model
        model.delegate = self
        model.getArticles()
    }
    

}

extension ViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocool/ Delgate Methods
    
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles 
    }
}
