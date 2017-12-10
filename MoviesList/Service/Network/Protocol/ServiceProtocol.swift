//
//  ServiceProtocol.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// API Service Protocol

import Foundation

protocol ServiceProtocol {
    func getMovieList(completion: @escaping (_ result: MovieListModel?, _ error: Error?) -> Void)
}
