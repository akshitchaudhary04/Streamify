//
//  MovieViewModel.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 03/07/24.
//

import Foundation
import RxSwift
import RxCocoa

class MovieViewModel {
    
    private let disposeBag = DisposeBag()
    private let loadingRelay = BehaviorRelay<Bool>(value: false)
    private let loadingIndexPathRelay = BehaviorRelay<IndexPath?>(value: nil)
    
    func fetchTrendingMovies(completion: @escaping([Movie]) -> Void, onError: @escaping(Error) -> Void) {
        loadingRelay.accept(true)
        APICaller.shared.getTrendingMovies()
                .subscribe(
                    onNext: { movies in
                        completion(movies)
                        self.loadingRelay.accept(false)
                    },
                    onError: { error in
                        onError(error)
                        self.loadingRelay.accept(false)
                    }
                )
                .disposed(by: disposeBag)
    }
    
    func fetchPopularMovies(completion: @escaping([Movie]) -> Void, onError: @escaping(Error) -> Void) {
        loadingRelay.accept(true)
        APICaller.shared.getPopularMovies()
                .subscribe(
                    onNext: { movies in
                        completion(movies)
                        self.loadingRelay.accept(false)
                    },
                    onError: { error in
                        onError(error)
                        self.loadingRelay.accept(false)
                    }
                )
                .disposed(by: disposeBag)
    }
    
    func fetchTopRatedMovies(completion: @escaping([Movie]) -> Void, onError: @escaping(Error) -> Void) {
        loadingRelay.accept(true)
        APICaller.shared.getTopRatedMovies()
                .subscribe(
                    onNext: { movies in
                        completion(movies)
                        self.loadingRelay.accept(false)
                    },
                    onError: { error in
                        onError(error)
                        self.loadingRelay.accept(false)
                    }
                )
                .disposed(by: disposeBag)
    }
}
