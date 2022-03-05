//
//  YouTubeResponse.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 05/03/2022.
//

import Foundation

struct YouTubeResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
