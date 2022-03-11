//
//  MovieDetailViewController.swift
//  movie_test
//
//  Created by Dilshod Iskandarov on 3/10/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    //MARK:- IBOutlet
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var overviewTextView: UITextView!
//    @IBOutlet weak var posterImage: UIImageView!
//    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var overviewTextView: UITextView!
    @IBOutlet var titleLabel: UILabel!
    
    //MARK:- Variables
    var movie: Movie?

    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupView()
    }

    init(movie: Movie) {
        super.init(nibName: String(describing: MovieDetailViewController.self), bundle: nil)
        self.movie = movie
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- Helpers
    func setupView() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        overviewTextView.text = movie.overview
        ratingLabel.text = "\(movie.rating)"
        let placeholderImage = UIImage(named: "placeholder")
        if let moviePoster = movie.posterUrl() {
            posterImage.kf.setImage(with: moviePoster, placeholder: placeholderImage)
        } else {
            posterImage.image = placeholderImage
        }
    }

    @IBAction func backPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

