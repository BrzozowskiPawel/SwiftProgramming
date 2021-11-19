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
        
        // Parse the returned JSON into article instances and pass it back to the view controller with the protocol and deleagte pattern
        delegate?.articlesRetrieved([Article]())
    }
}
