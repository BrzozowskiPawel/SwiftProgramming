//
//  Place.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import Foundation
import RealmSwift

// Class need to be a subclas of Realm Object
class Place: Object {
    @objc dynamic var placeId:String?
    @objc dynamic var name:String?
    @objc dynamic var address:String?
    @objc dynamic var summary:String?
    
    @objc dynamic var lat:Double = 0
    @objc dynamic var long:Double = 0
}
