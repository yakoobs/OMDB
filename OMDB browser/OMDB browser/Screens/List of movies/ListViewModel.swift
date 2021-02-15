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
    var movies: [MovieBasicInfo]?
    var selectedItem: MovieBasicInfo?
    
    init(moviesAPI: MoviesDatabaseAPIProtocol = MovieDatabaseAPI()) {
        self.moviesAPI = moviesAPI
    }
    
    func search(for query: String) {
        moviesAPI.search(query: query, completion: handleSearchResults)
    }
    
    var resultsCount: Int {
        return movies?.count ?? 0
    }
    
    private var handleSearchResults: SearchResultCompletion {
        return {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self?.movies = result.search
                    self?.delegate?.updateResults()
                case .failure(let error):
                    self?.delegate?.showError(error)
                }
            }
        }
    }
}
