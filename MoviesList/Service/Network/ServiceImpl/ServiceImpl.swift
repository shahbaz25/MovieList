//
//  ServiceImpl.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// API Call Implementation for different API's

import Foundation

class ServiceImpl: ServiceProtocol {
    
    // Get Movies
    func getMovieList(completion: @escaping (_ result: MovieListModel?, _ error: Error?) -> Void) {
        _ = API.request(.getMoviesList()) { response in
            if (response.result.error) != nil {
                completion(nil, response.result.error as NSError?)
            } else {
                if let JSON = response.result.value as? [String: AnyObject] {
                    let movieList = MovieListModel.mappedMovieListModel(JSON)
                    completion(movieList, response.result.error)
                } else {
                    completion(nil, NSError(domain: "Data", code: 0, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"]))
                }
            }
        }
    }
}
