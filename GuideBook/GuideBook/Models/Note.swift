//
//  Note.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 06/12/2021.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var placeId: String?
    @objc dynamic var date: String?
    @objc dynamic var text: String?
    
}
