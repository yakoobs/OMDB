//
//  MovieDetailsViewModel.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

protocol MovieDetailsViewModelDelegate: AnyObject {
    func updateDetails()
    func showError(_ error: Error)
}

final class MovieDetailsViewModel {
    private let movieId: String
    private let moviesAPI: MoviesDatabaseAPIProtocol

    weak var delegate: MovieDetailsViewModelDelegate?
    var movieDetails: MovieDetails?
    
    init(movieId: String, moviesAPI: MoviesDatabaseAPIProtocol = MovieDatabaseAPI()) {
        self.movieId = movieId
        self.moviesAPI = moviesAPI
    }
    
    func fetchDetails() {
        moviesAPI.fetchDetails(movieId: movieId, completion: handleResult)
    }
    
    private var handleResult: FetchDetailsCompletion {
        return {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let details):
                    self?.movieDetails = details
                    self?.delegate?.updateDetails()
                case .failure(let error):
                    self?.delegate?.showError(error)
                }
            }
        }
    }
}
