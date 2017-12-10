//
//  CellRepresentable.swift
//  MoviesList
//
//  Created by Shahbaz on 08/12/17.
//  Copyright © 2017 Shahbaz. All rights reserved.
//

// This handle cell registration to TableView and cell Loading

import UIKit

protocol CellRepresentable {
    static func registerCell(tableview: UITableView)
    func cellInstanatiate(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell
}
