//
//  Favorites.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import Foundation
import RealmSwift

class Favourite: Object {
    var favouritePlaceIds = List<String>()
    
}
