//
//  Movie.swift
//  Movies
//
//  Created by Juan Diego Marin on 1/11/22.
//

import Foundation

struct MovieInfo: Decodable {
    let name: String?
    let results: [ResultMovie]?
    
    init(name: String, results: [ResultMovie])  {
        self.name = name
        self.results = results
    }
}

struct ResultMovie: Decodable {
    let adult: Bool?
    let backdrop_path: String?
    let id: Int?
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let populary: Float?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let voteAverage: Float?
    let voteCount: Int?
    
    init(adult: Bool?, backdrop: String?, id: Int?, mediaType: String?, originalLenguaje: String?, originalTitle: String?, overview:String?, populary: Float?, porterPath: String?, releaseDate: String?, title: String?, video: Bool?, voteAverage: Float?, voteCount: Int?) {
        self.adult = adult
        self.backdrop_path = backdrop
        self.id = id
        self.media_type = mediaType
        self.original_language = originalLenguaje
        self.original_title = originalTitle
        self.overview = overview
        self.populary = populary
        self.poster_path = porterPath
        self.release_date = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
}
