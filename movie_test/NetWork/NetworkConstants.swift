//
//  NetworkConstants.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import Foundation

struct NetworkConstants {
    static let defaultRequestParams = ["api_key": "04c56a8a469a987ce3cf341217ff9664"]
    static let defaultRequestHeaders = ["Content-type": "application/json; charset=utf-8"]
    static let baseURL = "https://api.themoviedb.org/3"
    static let nowPlayingServicePath = "/movie/popular"
    static let upcomingServicePath = "/movie/now_playing"
    static let topRatedServicePath = "/movie/top_rated"
    static let searchServicePath = "/search/movie"
    static let imagesBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let queryParameterKey = "query"
    static let pageParameterKey = "page"
}
