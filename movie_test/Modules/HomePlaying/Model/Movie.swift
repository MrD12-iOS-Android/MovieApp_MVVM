//
//  Movie.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import Foundation

struct Movie: Codable {

    var id: Int
    var title: String?
    var overview: String?
    var poster: String?
    var video: Bool?
    private var voteAverage: Decimal
    var rating: NSDecimalNumber {
        get { return NSDecimalNumber(decimal: voteAverage) }
    }

    init(id: Int, title: String, overview: String, poster: String, voteAverage: Decimal, video: Bool) {
        self.id = id
        self.video = video
        self.title = title
        self.overview = overview
        self.poster = poster
        self.voteAverage = voteAverage
    }

    func posterUrl() -> URL? {
        return URL(string: "\(NetworkConstants.imagesBaseURL)\(poster ?? "")")
    }

    enum CodingKeys: String, CodingKey {
        case id, title, overview, video
        case poster = "poster_path"
        case voteAverage = "vote_average"
    }
}
