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
    var movies: [MovieBasicInfo] = []
    var totalResults: Int = 0
    var selectedItem: MovieBasicInfo?
    
    private var page: Int = 1
    private let moviesAPI: MoviesDatabaseAPIProtocol

    init(moviesAPI: MoviesDatabaseAPIProtocol = MovieDatabaseAPI()) {
        self.moviesAPI = moviesAPI
    }
    
    func search(for query: String) {
        page = 1
        movies = []
        delegate?.updateResults()
        moviesAPI.search(query: query, page: nil, completion: handleSearchResults)
    }
    
    func loadMore(for query: String) {
        guard shouldLoadMore else {return}
        page += 1
        moviesAPI.search(query: query, page: page, completion: handleSearchResults)
    }
    
    private var shouldLoadMore: Bool {
        return movies.count < totalResults
    }
    
    var resultsCount: Int {
        return movies.count
    }
    
    private var handleSearchResults: SearchResultCompletion {
        return {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    if let search = result.search {
                        self?.movies.append(contentsOf: search)
                    }
                    self?.totalResults = Int(result.totalResults) ?? 0
                    self?.delegate?.updateResults()
                case .failure(let error):
                    self?.delegate?.showError(error)
                }
            }
        }
    }
}
