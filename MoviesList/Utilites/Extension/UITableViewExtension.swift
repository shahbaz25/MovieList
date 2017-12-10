//
//  UITableViewExtension.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Table View Cell registraction methods

import UIKit

extension UITableView {
    func setupProperties() {
        backgroundColor = UIColor.whiteGrey()
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        bounces = false
        estimatedRowHeight = AppConstants.estimatedTableViewRowHeight
        rowHeight = UITableViewAutomaticDimension
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.defaultReuseIdentifier, bundle: bundle)
        
        return register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerWithIdentifier<T: UITableViewCell>(_: T.Type, identifier: String) where T: ReusableView, T: NibLoadableView {
        register(T.nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusableView {
        return dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
}
