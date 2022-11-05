//
//  MoviesRepositoryMock.swift
//  MoviesTests
//
//  Created by Juan Diego Marin on 5/11/22.
//

import Foundation
@testable import Movies

class MoviesRepositoryMock: MovieRepositoryProtocol {
    
    var movies: [ResultMovie]?
    func getMovies(completionHandler: @escaping (Result<[ResultMovie], Error>) -> Void) {
        if let movies = movies {
            completionHandler(.success(movies))
        }
    }
    
    
}
