//
//  URLs.swift
//  OMDB browser
//
//  Created by Sokołowski Jakub (FIRMA ZEWNĘTRZNA ) on 15/02/2021.
//

import Foundation

enum APIEndpoints {
    case search(String, Int?)
    case details(String)
    
    var url: URL? {
        var components = baseURLComponents
        switch self {
        case .search(let query, let page):
            components.queryItems?.append(contentsOf: [
                URLQueryItem(name: APIConstants.typeKey, value: APIConstants.defaultType),
                URLQueryItem(name: APIConstants.searchKey, value: query)
            ])
            if let page = page {
                components.queryItems?.append(URLQueryItem(name: APIConstants.pageKey, value: String(page)))
            }
            return components.url
            
        case .details(let movieId):
            components.queryItems?.append(URLQueryItem(name: APIConstants.movieIdKey, value: movieId))
            return components.url
        }
    }
    
    private var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = APIConstants.scheme
        components.host = APIConstants.host
        components.queryItems = [URLQueryItem(name: "apikey", value: APIConstants.apiKey)]
        return components
    }
}

private struct APIConstants {
    static let scheme = "https"
    static let host = "www.omdbapi.com"
    static let baseURL = "https://www.omdbapi.com/"
    static let apiKey = "b9bd48a6"
    static let typeKey = "type"
    static let defaultType = "movie"
    static let searchKey = "s"
    static let pageKey = "page"
    static let movieIdKey = "i"
}
