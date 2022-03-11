//
//  EmptyDataCell.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit

    class EmptyDataCell: UITableViewCell {
        static let cellIdentifier = String(describing: EmptyDataCell.self)
        
        @IBOutlet var emptyMessageLabel: UILabel!
        
    }
