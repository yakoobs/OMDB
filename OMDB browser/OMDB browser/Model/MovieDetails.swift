//
//  MovieDetails.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

// MARK: - MovieDetails
struct MovieDetails: Codable {
    let title, year, rated, released: String
    let runtime, genre, director, writer: String
    let actors, plot, language, country: String
    let awards: String
    let poster: String
    let ratings: [Rating]
    let metascore, imdbRating, imdbVotes, imdbID: String
    let type, dvd, boxOffice, production: String
    let website, response: String

    enum CodingKeys: String, CodingKey {
        case title
        case year
        case rated
        case released
        case runtime
        case genre
        case director
        case writer
        case actors
        case plot
        case language
        case country
        case awards
        case poster
        case ratings
        case metascore
        case imdbRating, imdbVotes, imdbID
        case type
        case dvd
        case boxOffice
        case production
        case website
        case response
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source
        case value
    }
}
