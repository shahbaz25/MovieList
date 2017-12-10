//
//  UIColorExtension.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Provide Custom Colors

import Foundation
import UIKit

extension UIColor {
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func colorFromHexString(_ hexString: String) -> UIColor {
        let hexString: NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        return self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    static func primaryBlack() -> UIColor {
        return colorFromHexString("000000")
    }
    
    static func primaryWhite() -> UIColor {
        return colorFromHexString("FFFFFF")
    }
    
    static func primaryBlue() -> UIColor {
        return colorFromHexString("0082CE")
    }
    
    static func primaryGreen() -> UIColor {
        return colorFromHexString("51B040")
    }
    
    static func primaryRed() -> UIColor {
        return colorFromHexString("D0011B")
    }
    
    static func whiteGrey() -> UIColor {
        return colorFromHexString("F2F3F6")
    }
}

