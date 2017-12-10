//
//  CardView.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// To gave UIView A Card Effect

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    
    override func layoutSubviews() {
        layer.cornerRadius = 4.0
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 1)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
    }
}
