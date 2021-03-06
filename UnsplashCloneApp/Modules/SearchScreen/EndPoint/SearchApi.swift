//
//  SearchApi.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/10/21.
//

import Foundation
//
//https://api.unsplash.com/search/photos?page=1&query=office&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"

enum SearchApi: EndPoint {
    
    case searchPhotos(query: String)
    case searchCollections (query: String)
    case searchUsers (query: String)
    
    var environmentBaseUrl: String {
        "https://api.unsplash.com/search"
    }
    
    var task: HTTPTask {
        .request
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl ) else {
            fatalError("URL won't work")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .searchPhotos(let query):
            return "/photos?page=1&query=\(query)"
            
        case .searchCollections(let query):
            return "/collections?page=1&query=\(query)"

        case .searchUsers(let query):
            return "/users?page=1&query=\(query)"
        }
    }
    
    var apiKey: String {
          "&client_id=2e5zRIIUowkNDy00Hh41zKFlmpyFtmBja6DuA-CIn88"
      }
    
    var fullAddress: String {
        environmentBaseUrl + path + apiKey
    }
}
