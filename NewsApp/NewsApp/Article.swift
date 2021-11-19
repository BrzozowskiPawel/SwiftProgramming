//
//  Article.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 19/11/2021.
//


// This class contains single article object
import Foundation


struct Article: Decodable  {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}
