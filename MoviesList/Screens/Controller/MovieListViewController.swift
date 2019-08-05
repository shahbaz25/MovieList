//
//  MovieListViewController.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// Show Movie List

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTableView: UITableView! {
        didSet {
            movieListTableView.delegate = self
            movieListTableView.dataSource = self
            movieListTableView.setupProperties()
            viewModel.tableItemTypes.forEach { $0.registerCell(tableview: self.movieListTableView) }
        }
    }
    var heightAtIndexPath = NSMutableDictionary()
    var viewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.title
        Helper.setupNavigationBar(controller: self)
        
        // Observer Whenever tableView Needs to reload it's data
        viewModel.reloadTable = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.movieListTableView.reloadData()
        }
        
        // Observer to show Alert
        viewModel.showALert = { (message,title) in
            self.showAlert(message: message,title: title)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.APICall()
    }

}

// TableView
extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // No.of rows in tableView
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.viewModel.tableItems.count
    }
    
    // Setup Row data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = self.viewModel.tableItems[indexPath.row]
        return (cellViewModel.cellInstanatiate(tableview: tableView, indexPath: indexPath))
    }
    
    // Handle case whenever cell will Display
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let height = NSNumber(value: Float(cell.frame.size.height))
        heightAtIndexPath.setObject(height, forKey: indexPath as NSCopying)
        if self.movieListTableView.indexPathsForVisibleRows?.contains(indexPath) ?? false{
            checkForUpdate(visitedRow: indexPath)
        }
    }
    
    // Handle whenever cell is Tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.tableItems[indexPath.row].isHidden.value = !self.viewModel.tableItems[indexPath.row].isHidden.value
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = heightAtIndexPath.object(forKey: indexPath) as? NSNumber {
            return CGFloat(height.floatValue)
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    // Check if the last cell is Visited then call API for more Data
    func checkForUpdate(visitedRow: IndexPath){
        if visitedRow.row == viewModel.tableItems.count - 1{
            viewModel.APICall()
        }
    }
}

extension MovieListViewController{
    func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: AppConstants.displayString.cancel, style: .default, handler: nil)
        alertController.addAction(cancelAction)
        let retryAction = UIAlertAction(title: AppConstants.displayString.retry, style: .default, handler: { (action) in
            self.viewModel.APICall()
        })
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

