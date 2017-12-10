//
//  UserDefaults.swift
//  MoviesList
//
//  Created by Shahbaz on 10/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Default Database

import UIKit

class UserDefaultService : NSObject, NSCoding {
    var movieList: [MovieDetails]?
    
    func encode(with aCoder: NSCoder) {
        if movieList != nil {
            aCoder.encode(movieList, forKey: "MovieDetails")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        movieList = aDecoder.decodeObject(forKey: "MovieDetails") as? [MovieDetails]
    }
    
    
    static func setMovies(movieList: [MovieDetails]) {
        let archivedMovieListData = NSKeyedArchiver.archivedData(withRootObject: movieList)
        UserDefaults.standard.set(archivedMovieListData, forKey: "MovieDetails")
    }
    
    static func getMovies() -> [MovieDetails] {
        if UserDefaults.standard.object(forKey: "MovieDetails") != nil {
            let movieData = UserDefaults.standard.object(forKey: "MovieDetails")
            return NSKeyedUnarchiver.unarchiveObject(with: movieData as! Data) as! [MovieDetails]
        }
        return [MovieDetails]()
    }
}

