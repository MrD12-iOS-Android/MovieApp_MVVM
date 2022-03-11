//
//  SearchResponse.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import Foundation
struct SearchResponse: Codable {
    var movies: [Movie]
    var page: Int
    var totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
    }
}
