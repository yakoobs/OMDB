//
//  MoviesDatabaseAPI.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

protocol MoviesDatabaseAPIProtocol {
    func fetchResults(query: String) -> OMDBSearchResult
    func fetchDetails(movieId: String) -> MovieDetails
}
