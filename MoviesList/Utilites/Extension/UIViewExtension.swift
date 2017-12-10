//
//  UIViewExtension.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//



import Foundation
import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

// Get cell from NIb file
protocol NibLoadableView: class {
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self()), bundle: nil)
    }
}

