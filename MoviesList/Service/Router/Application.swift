//
//  Application.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

import Foundation
import UIKit

class Application {
    // MARK: - Dependencies
    private let window: UIWindow
    
    lazy var navigation: Router = Router(
        window: self.window,
        application: self
    )
    
    // Network Call Implementation
    lazy var ServiceAPI = ServiceImpl()
    
    // MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }
}

