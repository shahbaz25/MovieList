//
//  Router.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Handle Routing in Entire app

import Foundation
import UIKit
var activityIndicatorView = RUIActivityIndicatorView()
var activityIndicatorCoverView: UIView = UIView()

final class Router {
    // MARK: - Private
    var navigationController: UINavigationController
    let application: Application
    var window: UIWindow
    
    // MARK: - Lifecycle
    init(window: UIWindow, application: Application) {
        navigationController = UINavigationController()
        self.application = application
        self.window = window
        self.start()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        self.setupActivityIndicator()
    }
    
    func setupActivityIndicator() {
        activityIndicatorView = RUIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        activityIndicatorCoverView.frame = (UIApplication.shared.keyWindow?.frame) ?? CGRect()
        activityIndicatorCoverView.backgroundColor = UIColor.primaryBlack().withAlphaComponent(0.7)
        activityIndicatorView.center = (UIApplication.shared.keyWindow?.center) ?? CGPoint(x: 0.0, y: 0.0)
        activityIndicatorView.stopAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
    
    // Base Point of the App when user Launch the APP
    func start() {
        self.navigationController.setNavigationBarHidden(false, animated: true)
        let moivesListViewController = UIStoryboard(name: AppConstants.storyboards.mainStoryboard, bundle: nil).instantiateVC(MovieListViewController.self)
        moivesListViewController?.viewModel = MovieListViewModel(service: application.ServiceAPI)
        _ = navigationController.pushViewController(moivesListViewController!, animated: true)
    }
}

