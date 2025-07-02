//
//  MovieCollectionViewCell.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 05/07/24.
//

import UIKit
import SDWebImage

protocol HomeTableViewCellDelegate: NSObject {
    func cellTapped(movies: Movie)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        imageVIew.sd_setImage(with: url, completed: nil)
    }
}
