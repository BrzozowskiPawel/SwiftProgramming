//
//  APICaller.swift
//  APIKit
//
//  Created by Paweł Brzozowski on 10/01/2022.
//

import Foundation



public class APICaller {
    public static let shared = APICaller()
    
    private init() {
        
    }
    
    public func fetchCourseNames(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            // If there is problem with url return empty collection
            completion([])
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                // If there is no data return empty collection
                completion([])
                return
            }
            // Decoding
            do {
                // Create a rwa JSON
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String:String]] else {
                    completion([])
                    return
                }
                
                let names = json.compactMap({ $0["name"]})
                completion(names)
                
            } catch {
                // If there is error -> reurn empyty collection
                completion([])
            }
        }
        
        task.resume()
    }
}
