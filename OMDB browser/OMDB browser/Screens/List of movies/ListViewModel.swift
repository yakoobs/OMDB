//
//  ListViewModel.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

protocol ListViewModelDelegate: AnyObject {
    func updateResults()
    func showError(_ error: Error)
}

final class ListViewModel {
    weak var delegate: ListViewModelDelegate?
    
    private let moviesAPI: MoviesDatabaseAPIProtocol
    private var movies: [MovieBasicInfo]?
    
    init(moviesAPI: MoviesDatabaseAPIProtocol = MovieDatabaseAPI()) {
        self.moviesAPI = moviesAPI
    }
    
    func search(for query: String) {
        moviesAPI.search(query: query, completion: handleSearchResults)
    }
    
    private var handleSearchResults: SearchResultCompletion {
        return {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self?.movies = result.search
                    print("Movies: \(result.search)")
                    self?.delegate?.updateResults()
                case .failure(let error):
                    self?.delegate?.showError(error)
                }
            }
        }
    }
}
