//
//  AppConstants.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// All the Displaystrings, Names and Constant Values Stored here

import Foundation
import UIKit

class AppConstants {
    
    struct screenTitle {
        static let movieList: String = "Movies"
    }
    
    struct imageName {
        static let placeHolder: String = "SplashImage.jpg"
    }
    static let estimatedTableViewRowHeight: CGFloat = 20
    static let cornerRadiusForCard: CGFloat = 4
    
    struct fontSize {
        static let Large: CGFloat = 20.0
        static let Medium: CGFloat = 18.0
    }
    
    struct storyboards {
        static let mainStoryboard: String = "Main"
    }
    
    enum networkError: String{
        case noInternet = "The Internet connection appears to be offline."
    }
    
    struct displayString {
        static let rating: String = "Ratings: "
        static let ratingOf: String = "/10.0 "
        static let cast: String = "Cast: "
        static let noConnection: String = "No connection"
        static let error: String = "Error!"
        static let cancel: String = "Cancel"
        static let retry: String = "Retry"
    }
    
}
