//
//  Note+CoreDataProperties.swift
//  GuidebookApp
//
//  Created by Paweł Brzozowski on 04/12/2021.
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

extension Note : Identifiable {

}
