//
//  MovieListViewModel.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Provide Data for MovieList ViewController

import Foundation

class MovieListViewModel {
    private(set) var tableItemTypes: [CellRepresentable.Type] = [MovieTableViewCellViewModel.self]
    var tableItems = [MovieTableViewCellViewModel]()
    var reloadTable: (() -> Void)?
    var showALert: ((String,String) -> Void)?
    var serviceAPI : ServiceProtocol
    var firstTimeFlag = false
    var title = AppConstants.screenTitle.movieList
    
    init(service: ServiceProtocol) {
        serviceAPI = service
        APICall()
    }
}

extension MovieListViewModel{
    
    // Setup Tableview's Data
    func setup(movieList: [MovieDetails]) -> [MovieTableViewCellViewModel]{
        return (0..<movieList.count).map { value in
            return MovieTableViewCellViewModel(movieDetails: movieList[value])
        }
    }
    
    // Call API To get more Movies Data
    func APICall(){
        Helper.showActivityIndicator()
        serviceAPI.getMovieList(completion: { [weak self] result, error in
            Helper.hideActivityIndicator()
            guard let strongSelf = self else { return }
            
            // Error occurs then show alert and Load Offline data
            if error != nil {
                strongSelf.setupOfflineData()
                switch AppConstants.networkError(rawValue: error?.localizedDescription ?? ""){
                    case .noInternet?:
                        strongSelf.showALert?(error?.localizedDescription ?? "",AppConstants.displayString.noConnection)
                    default:
                        strongSelf.showALert?(error?.localizedDescription ?? "",AppConstants.displayString.error)
                }
            } else {
                
                // Setup Movie got from API
                if let movieList = result?.response{
                    var totalMovies = UserDefaultService.getMovies()
                    totalMovies.append(contentsOf: movieList)
                    UserDefaultService.setMovies(movieList: totalMovies)
                    let movies = strongSelf.setup(movieList: movieList)
                    strongSelf.tableItems.append(contentsOf: movies)
                    strongSelf.reloadTable?()
                }else{
                    strongSelf.setupOfflineData()
                }
            }
        })
    }
    
    // If Network is not Available then setup Data which is already stored in database
    func setupOfflineData(){
        let movieList = setup(movieList: UserDefaultService.getMovies())
        tableItems = movieList
        if !firstTimeFlag{
            firstTimeFlag = true
            reloadTable?()
        }
    }
}
