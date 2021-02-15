//
//  MoviesDatabaseAPI.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

protocol MoviesDatabaseAPIProtocol {
    func fetchResults(query: String)
    func fetchDetails(movieId: String)
}

final class MovieDatabaseAPI: MoviesDatabaseAPIProtocol {
    func fetchResults(query: String) {
        let url = "http://www.omdbapi.com/?apikey=b9bd48a6&s=\(query)&type=movie"
    }
    
    func fetchDetails(movieId: String) {
        let url = "http://www.omdbapi.com/?apikey=b9bd48a6&i=\(movieId)"
    }
}
