//
//  MovieCell.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    static let cellIdentifier = String(describing: MovieCell.self)
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
            overviewLabel.text = movie?.overview
            let placeholderImage = UIImage(named: "placeholder")
            if let moviePoster = movie?.posterUrl() {
                posterImage.kf.setImage(with: moviePoster, placeholder: placeholderImage)
            } else {
                posterImage.image = placeholderImage
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.layer.cornerRadius = posterImage.frame.width / 2
    }
}
