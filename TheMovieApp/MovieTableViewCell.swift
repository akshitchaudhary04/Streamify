//
//  MovieTableViewCell.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 03/07/24.
//

import UIKit
import RxSwift
import RxCocoa

class MovieTableViewCell: UITableViewCell {
    
    weak var delegate: HomeTableViewCellDelegate?
    private var movies: [Movie] = [Movie]()
    private let viewModel = MovieViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    public func configure(with movies: [Movie]){
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension MovieTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selectedMovie = movies[indexPath.row]
        delegate?.cellTapped(movies: selectedMovie)
    }
}

extension MovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell

        guard let model = movies[indexPath.row].poster_path else { return UICollectionViewCell() }

        cell.configure(with: model)

        return cell
    }
}
