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
    func search(query: String, page: Int?, completion: @escaping SearchResultCompletion)
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
