//
//  MovieTableViewCell.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Movie Card UI Handling

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var detailsStackView: UIStackView! {
        didSet{
            detailsStackView.isLayoutMarginsRelativeArrangement = true
            detailsStackView.layoutMargins = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 8.0, right: 8.0)
        }
    }
    @IBOutlet weak var cast: UILabel!
    @IBOutlet weak var ratings: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var posterImage: UIImageView! {
        didSet {
            posterImage.layer.cornerRadius = AppConstants.cornerRadiusForCard
        }
    }
    @IBOutlet weak var movieName: UILabel! {
        didSet{
            movieName.font = UIFont.futuraMedium(size: AppConstants.fontSize.Large)
        }
    }
    var viewModel: MovieTableViewCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Initial Setup for Cell
    func prepare(viewModel: MovieTableViewCellViewModel){
        self.viewModel = viewModel
        
        // Fetch Image form String through SDImage and Cache it
        posterImage.sd_setShowActivityIndicatorView(true)
        posterImage.sd_setIndicatorStyle(.gray)
        if let url = URL(string: viewModel.imageUrl ?? ""){
            posterImage.sd_setImage(with: url, placeholderImage: UIImage(named: AppConstants.imageName.placeHolder))
        }
        
        // Observer for moviePlot is hidden or not
        viewModel.isHidden.bindAndFire({ (value) in
            if value{
                self.moviePlot.text = ""
                self.ratings.text = ""
                self.cast.text = ""
                self.movieName.text = ""
            }else{
                self.moviePlot.attributedText = viewModel.plot
            }
        })
        self.moviePlot.isHidden = viewModel.isHidden.value
        self.ratings.attributedText = viewModel.ratings
        self.cast.attributedText = viewModel.cast
        self.movieName.text = viewModel.movieName
    }
}
