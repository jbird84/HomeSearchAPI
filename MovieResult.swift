//
//  MovieFetcher.swift
//  PleyHomeSearch
//
//  Created by Kinney Kare on 5/2/22.
//

import Foundation


import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int
    let poster_path: String

    enum CodingKeys: String, CodingKey {
        case adult
        case genreIDS = "genre_ids"
        case poster_path = "poster_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
