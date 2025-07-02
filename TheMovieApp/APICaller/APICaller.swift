//
//  APICaller.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary on 01/07/24.
//

import Foundation
import Alamofire
import RxSwift

struct Constants{
    static let API_Key = "d5386c76028d197e750a16b542401670"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller{
    static let shared = APICaller()
    
    private init () {}
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_Key)") else { return }
        
        AF.request(url).responseDecodable(of: TrendingMovies.self) { response in
            switch response.result {
            case .success(let results):
                // Data successfully fetched
                completion(.success(results.results))
                
            case .failure(let error):
                // An error occurred while fetching data
                completion(.failure(error))
            }
        }
        
    }
    
    func getTrendingMovies() -> Observable<[Movie]> {
        return Observable.create { observer -> Disposable in
            guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_Key)")
            else {
                observer.onError(URLError(.badURL))
                return Disposables.create()
            }
            let request = AF.request(url).validate(statusCode: 200..<300)
    
            request.responseDecodable(of: TrendingMovies.self) { response in
                switch response.result {
                case .success(let results):
                    observer.onNext(results.results)
                    observer.onCompleted()
    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    

        
        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do{
//                let results = try JSONDecoder().decode(TrendingMovies.self, from: data)
//                completion(.success(results.results))
//            }
//            catch{
//                completion(.failure(error))
//            }
//
//        }
//        task.resume()
    
//    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
//        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_Key)&language=en-US&page=1") else { return }
//
//        AF.request(url).responseDecodable(of: TrendingMovies.self) { response in
//            switch response.result {
//            case .success(let results):
//                // Data successfully fetched
//                completion(.success(results.results))
//
//            case .failure(let error):
//                // An error occurred while fetching data
//                completion(.failure(error))
//            }
//        }
//
//    }
    
    func getPopularMovies() -> Observable<[Movie]> {
        return Observable.create { observer -> Disposable in
            guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_Key)&language=en-US&page=1")
            else {
                observer.onError(URLError(.badURL))
                return Disposables.create()
            }
            let request = AF.request(url).validate(statusCode: 200..<300)
    
            request.responseDecodable(of: TrendingMovies.self) { response in
                switch response.result {
                case .success(let results):
                    observer.onNext(results.results)
                    observer.onCompleted()
    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
        
        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do{
//                let results = try JSONDecoder().decode(TrendingMovies.self, from: data)
//                print(results)
//                completion(.success(results.results))
//            }
//            catch{
//                completion(.failure(error))
//            }
//
//        }
//        task.resume()
    
    
//    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_Key)&language=en-US&page=1") else { return }
//
//        AF.request(url).responseDecodable(of: TrendingMovies.self) { response in
//            switch response.result {
//                    case .success(let results):
//                        // Data successfully fetched
//                completion(.success(results.results))
//
//                    case .failure(let error):
//                        // An error occurred while fetching data
//                        completion(.failure(error))
//                    }
//        }
        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do{
//                let results = try JSONDecoder().decode(TrendingMovies.self, from: data)
//                print(results)
//                completion(.success(results.results))
//            }
//            catch{
//                completion(.failure(error))
//            }
//
//        }
//        task.resume()
        
//    }
    
    func getTopRatedMovies() -> Observable<[Movie]> {
        return Observable.create { observer -> Disposable in
            guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_Key)&language=en-US&page=1")
            else {
                observer.onError(URLError(.badURL))
                return Disposables.create()
            }
            let request = AF.request(url).validate(statusCode: 200..<300)
    
            request.responseDecodable(of: TrendingMovies.self) { response in
                switch response.result {
                case .success(let results):
                    observer.onNext(results.results)
                    observer.onCompleted()
    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}


