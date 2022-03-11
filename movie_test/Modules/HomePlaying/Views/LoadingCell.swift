//
//  LoadingCell.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit
class LoadingCell: UITableViewCell {
    static let cellIdentifier = String(describing: LoadingCell.self)
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
}
