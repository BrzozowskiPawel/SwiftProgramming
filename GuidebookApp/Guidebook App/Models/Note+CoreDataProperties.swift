//
//  Note+CoreDataProperties.swift
//  Guidebook App
//
//  Created by Christopher Ching on 2020-07-29.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var text: String?
    @NSManaged public var date: Date?

}
