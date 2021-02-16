//
//  MoviesDatabaseAPI.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

typealias SearchResultCompletion = (Result<OMDBSearchResult,Error>) -> Void
typealias FetchDetailsCompletion = (Result<MovieDetails,Error>) -> Void

protocol MoviesDatabaseAPIProtocol {
    
    /// Search for movies with string query
    /// - Parameters:
    ///   - query: movie title
    ///   - page: Optional param when you want to use paging
    ///   - completion: Returns search result with movies' basic info or error.
    func search(query: String, page: Int?, completion: @escaping SearchResultCompletion)
    
    /// Get details about the moview
    /// - Parameters:
    ///   - movieId: Identifier from IMDb
    ///   - completion: Returns movie details or error
    func fetchDetails(movieId: String, completion: @escaping FetchDetailsCompletion)
}

final class MovieDatabaseAPI: MoviesDatabaseAPIProtocol {
    func search(query: String, page: Int? = nil, completion: @escaping SearchResultCompletion) {
        
        if let url = APIEndpoints.search(query, page).url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(OMDBSearchResult.self, from: data)
                        completion(.success(result))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
    
    func fetchDetails(movieId: String, completion: @escaping FetchDetailsCompletion) {
        if let url = APIEndpoints.details(movieId).url {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let details = try JSONDecoder().decode(MovieDetails.self, from: data)
                        completion(.success(details))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
}
