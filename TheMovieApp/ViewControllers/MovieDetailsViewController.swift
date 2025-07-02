//
//  MovieDetailsViewController.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 06/07/24.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    
    @IBOutlet weak var detailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = movie?.title
        releaseDate.text = "Release Data: " + (movie?.release_date ?? "")
        detailsLabel.text = movie?.overview
        configure(with: movie?.backdrop_path ?? " ")
        voteCount.text = "Vote Count: " + IntToString(data: movie?.vote_count ?? 0)
        voteAverage.text = "Vote Average: " + DoubleToString(data: movie?.vote_average ?? 0.0)
        
    }

    
    private func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        posterImage.sd_setImage(with: url, completed: nil)
    }

    private func IntToString(data: Int) -> String{
        let newData = String(data)
        return newData
    }

    private func DoubleToString(data: Double) -> String{
        let newData = String(data)
        return newData
    }

    @IBAction func didTapPlayButton(_ sender: Any) {
    }
}
