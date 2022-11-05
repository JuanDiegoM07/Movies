//
//  MovieFake.swift
//  MoviesTests
//
//  Created by Juan Diego Marin on 5/11/22.
//

import Foundation
@testable import Movies
import UIKit

enum MovieFake {
    
    static var values: [MovieInfo] {
        [.init(name: "",
               results: result)]
    }
    
    static var result: [ResultMovie] {
        [.init(adult: false,
               backdrop: "",
               id: 0,
               mediaType: "",
               originalLenguaje: "",
               originalTitle: "",
               overview: "",
               populary: 0,
               porterPath: "",
               releaseDate: "",
               title: "",
               video: false,
               voteAverage: 0,
               voteCount: 0)]
    }
}
