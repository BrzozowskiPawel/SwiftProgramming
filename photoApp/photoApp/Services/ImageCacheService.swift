//
//  ImageCacheService.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 29/11/2021.
//

import Foundation
import UIKit

class ImageCacheService {
    
    static var imageCache = [String:UIImage]()
    
    static func saveImage(url:String?, image:UIImage?) {
        // Chech agains nil
        if url == nil || image == nil {
            return
        }
        
        // add to the cache
        imageCache[url!] = image!
    }
    
    static func getImage(url:String?) -> UIImage? {
        // Check that url isn't nil
        if url == nil {
            return nil
        }
        
        // Chech the dic for the url
        return imageCache[url!]
    }
}
