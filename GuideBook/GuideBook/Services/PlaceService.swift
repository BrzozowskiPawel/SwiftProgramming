//
//  PlaceService.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 07/12/2021.
//

import Foundation
import RealmSwift

class PlaceService {
    static func getPlaces() -> Results<Place> {
        
        // Get a ref to the place.realm
        let realm = try! Realm(configuration: Constants.RealmConfig.placesConfig)
        
        // Get the places and return it
        return realm.objects(Place.self)
    }
}
