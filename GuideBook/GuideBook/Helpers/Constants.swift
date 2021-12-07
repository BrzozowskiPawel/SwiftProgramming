//
//  Constants.swift
//  GuideBook
//
//  Created by Paweł Brzozowski on 07/12/2021.
//

import Foundation
import RealmSwift

struct Constants {
    
    struct Storyboard {
        static let SEGUE_DETAIL = "goToDetail"
        static let NOTESVC_VC = "NotesViewController"
        static let COMPOSE_VC = "ComposeViewController"
        static let MAP_VC = "MapViewController"
    }
    
    struct RealmConfig {
        static let placesConfig = Realm.Configuration(fileURL: Bundle.main.url(forResource: "Place", withExtension: "realm"), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: true, schemaVersion: 0, migrationBlock: nil, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
    }
    
}
