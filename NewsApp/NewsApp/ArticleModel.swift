//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 19/11/2021.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles:[Article])
}
class ArticleModel{
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        // Fire off the request to the API
        
        // Create a string URL
        let stringURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3b3c282c213345bb87c6d8ae34e1d588"
        
        // Create a URL object
        let url = URL(string: stringURL)
        
        // Check that it isnt nil
        guard url != nil else {
            print("URL object is empty")
            return
        }
        // Get the URL Session
        let session = URLSession.shared
        
        // Crete the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // Chcech that there are no errors and there is data
            if error == nil && data != nil {
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                do {
                    // Parse the JSON into the article service
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    // Everything connected with UI should be in main thread
                    DispatchQueue.main.async {
                        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and deleagte pattern
                        self.delegate?.articlesRetrieved(articleService.articles!)
                    }
                    
                } catch {
                    print("Sorry there was and error while decoding JSON")
                }
                
            }
        }
        // Start the data task
        dataTask.resume()
    }
}
