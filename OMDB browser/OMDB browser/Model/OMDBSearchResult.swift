//
//  OMDBSearchResult.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

// MARK: - OMDBSearchResult
struct OMDBSearchResult: Codable {
    let search: [MovieBasicInfo]?
    let totalResults: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
    }
}

// MARK: - Search
struct MovieBasicInfo: Codable {
    let title, year, imdbID: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
