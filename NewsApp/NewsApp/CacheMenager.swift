//
//  CacheMenager.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 21/11/2021.
//

import Foundation

class CacheManager {
    
    static var imageDistionary = [String:Data]()
    
    static func saveData(_ url: String, _ imageData:Data) {
        
        // Save the image data wirh URL
        imageDistionary[url] = imageData
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nil
        return imageDistionary[url]
    }
}
