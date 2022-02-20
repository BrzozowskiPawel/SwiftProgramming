//
//  APICaller.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 20/02/2022.
//

import Foundation

struct Constatnts {
    static let APIKey =  "7744e7629b700ec6c1680b72d44ef48b"
    static let baseURL = "https://api.themoviedb.org"
}


class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping(String) -> Void) {
        
        guard let url = URL(string: "\(Constatnts.baseURL)/3/trending/all/day?api_key=\(Constatnts.APIKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
