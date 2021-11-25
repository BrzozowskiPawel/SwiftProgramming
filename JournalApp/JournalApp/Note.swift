//
//  Note.swift
//  JournalApp
//
//  Created by Paweł Brzozowski on 25/11/2021.
//

import Foundation

struct Note {
    var docId: String
    var title: String
    var body: String
    var isStarted: Bool
    var createdAt: Date
    var lastUpdated: Date
}
