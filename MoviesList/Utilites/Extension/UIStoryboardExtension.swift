//
//  UIStoryboardExtension.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    /// Get view controller from storyboard by its class type
    /// Usage: let profileVC = storyboard!.instantiateVC(ProfileViewController) /* profileVC is of type ProfileViewController */
    /// Warning: identifier should match storyboard ID in storyboard of identifier class
    public func instantiateVC<T>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        if let vc = instantiateViewController(withIdentifier: storyboardID) as? T {
            return vc
        } else {
            return nil
        }
    }
}

