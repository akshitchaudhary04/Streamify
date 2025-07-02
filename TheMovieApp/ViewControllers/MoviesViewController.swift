//
//  MoviesViewController.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 03/07/24.
//

import UIKit
import RxSwift

enum Sections: Int {
    case TrendingMovies = 0
    case Popular = 1
    case TopRated = 2
}

class MoviesViewController: UIViewController{

    let sectionTitles: [String] = ["Trending Movies", "Popular", "Top Rated"]
    let viewModel = MovieViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.visibleViewController?.title = "Movies"
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = UIColor.black
        tabBarController?.tabBar.tintColor = UIColor.white

        title = "Movies"
    }

}

extension MoviesViewController: UITableViewDelegate {
    
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.backgroundColor = .black
        cell.delegate = self
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            viewModel.fetchTrendingMovies { movies in
                cell.configure(with: movies)
            } onError: { error in
                print(error.localizedDescription)
            }
        case Sections.Popular.rawValue:
            viewModel.fetchPopularMovies { movies in
                cell.configure(with: movies)
            } onError: { error in
                print(error.localizedDescription)
            }
        case Sections.TopRated.rawValue:
            viewModel.fetchTopRatedMovies { movies in
                cell.configure(with: movies)
            } onError: { error in
                print(error.localizedDescription)
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
}

extension MoviesViewController: HomeTableViewCellDelegate {
    func cellTapped(movies: Movie) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? MovieDetailsViewController
        vc?.movie = movies
        navigationController?.pushViewController(vc!, animated: true)
        print("Hello")
    }
}


