//
//  MovieRepository.swift
//  Movies
//
//  Created by Juan Diego Marin on 1/11/22.
//

import Foundation
import UIKit
import CoreData

protocol MovieRepositoryProtocol {
    func getMovies(completionHandler: @escaping (Result<[ResultMovie], Error>) -> Void)
}

class MovieRepository: MovieRepositoryProtocol {
    
    func getMovies(completionHandler: @escaping (Result<[ResultMovie], Error>) -> Void) {
        let localMovies = self.getMovies()
        if localMovies.results?.count ?? 0 > 0 {
            completionHandler(.success(localMovies.results ?? []))
            return
        }
        let url = URL(string: "https://api.themoviedb.org/4/list/1?api_key=39c8af238a6bdfbe33629010bb758d12")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data {
                do {
                    let movies = try JSONDecoder().decode(MovieInfo.self, from: data)
                         DispatchQueue.main.async {
                             self.deleteAllMovies()
                             self.saveMovie(movies)
                             completionHandler(.success(movies.results ?? []))
                         }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print("Error")
            }
               
        })
        task.resume()
    }
    
    func saveMovie(_ movies: MovieInfo) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
            let movieCoreData = MovieCD(context: appDelegate.persistentContainer.viewContext)
            movieCoreData.name = movies.name
            appDelegate.saveContext()
    }
    
    private func getMovies() -> MovieInfo {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .init(name: "", results: [])
        }
        var movieInfo: MovieInfo = .init(name: "", results: [])
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            let coreDataMovies = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            coreDataMovies.forEach {
                movieInfo = MovieInfo(name: $0.name!, results: [])
            }
        } catch {
            print(error.localizedDescription)
        }
        return movieInfo
    }
    
    private func deleteAllMovies() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            let coreDataMovies = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            
            coreDataMovies.forEach {
                appDelegate.persistentContainer.viewContext.delete($0)
            }
            try appDelegate.persistentContainer.viewContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
