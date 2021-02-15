//
//  OMDBSearchResult.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

// MARK: - OMDBSearchResult
struct OMDBSearchResult: Codable {
    let search: [MovieBasicInfo]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search
        case totalResults
        case response
    }
}

// MARK: - Search
struct MovieBasicInfo: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title
        case year
        case imdbID
        case type
        case poster
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}
