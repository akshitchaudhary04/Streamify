//
//  Movie.swift
//  TheMovieApp
//
//  Created by Akshit chaudhary 03/07/24.
//

import Foundation

struct TrendingMovies: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let backdrop_path: String?
    let media_type: String?
    let title: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
