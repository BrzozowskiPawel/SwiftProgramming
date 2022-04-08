//
//  Person.swift
//  PhotoMemory
//
//  Created by Paweł Brzozowski on 07/04/2022.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var imgae: String
    
    init(name: String, image: String) {
        self.name = name
        self.imgae = image
    }
}
