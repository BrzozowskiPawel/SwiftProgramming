//
//  ArticleService.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 19/11/2021.
//


// This class contains ArticleService object wich is basically API response
import Foundation

struct ArticleService: Decodable {
    // We dont need status property so we can just dont code it
    var totalResaults: Int?
    var articles: [Article]?
}
