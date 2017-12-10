//
//  Helper.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Provide Reuseble methods throughout the App

import Foundation
import UIKit

final class Helper {
    
    // Setup custom Navigation bar with attributes
    static func setupNavigationBar(controller: UIViewController){
        // Set basic properties
        controller.navigationController?.isNavigationBarHidden = false
        controller.navigationController?.navigationBar.isTranslucent = true
        controller.navigationController?.navigationBar.isOpaque = true
        controller.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.primaryBlue()]
        controller.navigationController?.navigationBar.tintColor = UIColor.primaryRed()
        controller.navigationController?.navigationBar.backgroundColor = UIColor.primaryGreen()
    }
    
    static func showActivityIndicator() {
        UIApplication.shared.keyWindow?.addSubview(activityIndicatorCoverView)
        UIApplication.shared.keyWindow?.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
    }
    
    static func hideActivityIndicator() {
        activityIndicatorCoverView.removeFromSuperview()
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
    }
    
    // Create Custom string with Attributes
    static func createAtteributedString(title: String,font: UIFont) -> NSMutableAttributedString{
        return NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.font: font])
    }
    
    // Add Image In Label
    static func addImage() -> NSAttributedString{
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "ratings")
        attachment.bounds = CGRect(x: 0, y: -2.0, width: 18.0, height: 18.0)
        return NSAttributedString(attachment: attachment)
    }
}
