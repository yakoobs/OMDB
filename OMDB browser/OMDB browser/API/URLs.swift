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
        return URL(string: urlString)
    }
    
    private var urlString: String {
        switch self {
        case .search(let query, let page):
            let pageParam = (page != nil) ? "&page=\(page!)" : ""
            
            return APIConstatnts.baseURL + "?apikey=" + APIConstatnts.apiKey + "&s=" + query + "&type=movie" + pageParam
        case .details(let movieId):
            return APIConstatnts.baseURL + "?apikey=" + APIConstatnts.apiKey + "&i=" + movieId
        }
    }
}

struct APIConstatnts {
    static let baseURL = "https://www.omdbapi.com/"
    static let apiKey = "b9bd48a6"
}
