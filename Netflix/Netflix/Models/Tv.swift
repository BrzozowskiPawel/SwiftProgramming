//
//  TV.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 20/02/2022.
//

import Foundation

struct Tv: Codable {

    var id: Int
    var media_type: String?
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var vote_average: Double
    var vote_count: Int
}

struct TrendingTvResponse: Codable {
    let results: [Tv]
}
