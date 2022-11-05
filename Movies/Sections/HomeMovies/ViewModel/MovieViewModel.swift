//
//  MovieViewModel.swift
//  Movies
//
//  Created by Juan Diego Marin on 1/11/22.
//

import Foundation

class MoviesViewModel {
    
    // MARK: Internal properties
    var error: (String) -> Void = { _ in }
    var success: () -> Void = {}
    var movies: [ResultMovie] = []

    // MARK: - Private Properties

    private var repository: MovieRepositoryProtocol!

    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }

    func getMovie() {
        repository.getMovies { result in
            switch result {
                
            case .success(let movies):
                self.movies = movies
                self.success()
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
}
