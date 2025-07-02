//
//  APICallTests.swift
//  TheMovieAppTests
//
//  Created by Akshit chauddhary on 01/07/24.
//

import XCTest
import RxSwift
import RxCocoa

@testable import TheMovieApp

final class APICallTests: XCTestCase {
    
    var viewModel: MovieViewModel!
    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        viewModel = MovieViewModel()
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        disposeBag = nil
    }

    func testFetchTrendingMovies() {
            //given
            let expectation = XCTestExpectation(description: "Fetch trending movies")
            var moviesResult: [Movie]?
            var errorResult: Error?

            //when
            viewModel.fetchTrendingMovies(
                completion: { movies in
                    moviesResult = movies
                    expectation.fulfill()
                },
                onError: { error in
                    errorResult = error
                    expectation.fulfill()
                }
            )

            //then
            wait(for: [expectation], timeout: 5.0)
            XCTAssertNotNil(moviesResult)
            XCTAssertNil(errorResult)
        }

    func testFetchPopularMovies() {
        let expectation = XCTestExpectation(description: "Fetch popular movies")
        var moviesResult: [Movie]?
        var errorResult: Error?

        viewModel.fetchPopularMovies(
            completion: { movies in
                moviesResult = movies
                expectation.fulfill()
            },
            onError: { error in
                errorResult = error
                expectation.fulfill()
            }
        )

        wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(moviesResult)
        XCTAssertNil(errorResult)
    }

    func testFetchTopRatedMovies() {
        let expectation = XCTestExpectation(description: "Fetch top rated movies")
        var moviesResult: [Movie]?
        var errorResult: Error?

        viewModel.fetchTopRatedMovies(
            completion: { movies in
                moviesResult = movies
                expectation.fulfill()
            },
            onError: { error in
                errorResult = error
                expectation.fulfill()
            }
        )

        wait(for: [expectation], timeout: 5.0)
        XCTAssertNotNil(moviesResult)
        XCTAssertNil(errorResult)
    }

}
