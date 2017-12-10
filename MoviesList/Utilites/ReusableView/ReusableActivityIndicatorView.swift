//
//  ReusableActivityIndicatorView.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Reuseble Activity Indicator View

import Foundation
import UIKit

class RUIActivityIndicatorView: UIActivityIndicatorView {
    
    override init(activityIndicatorStyle style: UIActivityIndicatorViewStyle) {
        super.init(activityIndicatorStyle: style)
        _initRUIActivityIndicatorView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _initRUIActivityIndicatorView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _initRUIActivityIndicatorView()
    }
    
    fileprivate func _initRUIActivityIndicatorView() {
        hidesWhenStopped = true
        color = UIColor.primaryWhite()
    }
}
