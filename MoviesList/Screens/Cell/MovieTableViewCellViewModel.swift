//
//  MovieTableViewCellViewModel.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Provide Data for cell to display

import Foundation
import UIKit

class MovieTableViewCellViewModel {
    var isHidden : Dynamic<Bool> = Dynamic(true)
    var movieName : String?
    var ratings: NSMutableAttributedString?
    var cast: NSMutableAttributedString?
    var castName: NSMutableAttributedString?
    var plot: NSMutableAttributedString?
    var imageUrl: String?
    init(movieDetails: MovieDetails) {
        self.movieName = movieDetails.title

        self.ratings = Helper.createAtteributedString(title: AppConstants.displayString.rating, font: UIFont.futuraMedium(size: AppConstants.fontSize.Medium))
        self.ratings?.append(Helper.createAtteributedString(title: (movieDetails.imdbRating ?? "") + AppConstants.displayString.ratingOf, font: UIFont.helveticaNeueLight(size: AppConstants.fontSize.Medium)))
        self.ratings?.append(Helper.addImage())
        
        self.cast = Helper.createAtteributedString(title: AppConstants.displayString.cast, font: UIFont.futuraMedium(size: AppConstants.fontSize.Medium))
        self.cast?.append(Helper.createAtteributedString(title: movieDetails.actors ?? "", font: UIFont.helveticaNeueLight(size: AppConstants.fontSize.Medium)))
        
        self.plot = Helper.createAtteributedString(title: movieDetails.plot ?? "", font: UIFont.helveticaNeueLight(size: AppConstants.fontSize.Medium))
        
        self.imageUrl = movieDetails.poster
    }
}

extension MovieTableViewCellViewModel: CellRepresentable {
    
    static func registerCell(tableview: UITableView) {
        tableview.register(MovieTableViewCell.self)
    }
    
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableview.dequeueReusableCell(indexPath: indexPath)
        cell.prepare(viewModel: self)
        return cell
    }
}
